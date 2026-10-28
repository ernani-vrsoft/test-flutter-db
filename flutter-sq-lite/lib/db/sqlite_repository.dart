import 'package:drift/drift.dart';

import '../benchmark/benchmark.dart';
import '../seed/calculo.dart';
import '../seed/seed_data.dart';
import 'database.dart';

class SqliteRepository implements BenchmarkRepository {
  late final AppDatabase _db;

  @override
  String get nome => 'SQLite (drift)';

  @override
  Future<void> abrir() async {
    _db = await AppDatabase.abrir();
  }

  @override
  Future<void> fechar() => _db.close();

  @override
  Future<Resultado> inserir() async {
    if (await _contar(_db.produtos) > 0) {
      throw StateError('A base não está vazia. Execute o Delete antes.');
    }

    final seedProdutos = gerarProdutos();
    final seedVendas = gerarVendas();
    final resultado = Resultado('Insert');

    await resultado.medir('Inserir 500 produtos + códigos + impostos', () {
      return _db.transaction(() async {
        final codigos = <CodigosBarrasCompanion>[];
        for (final s in seedProdutos) {
          final impostoId = await _db.into(_db.impostos).insert(
                ImpostosCompanion.insert(
                  icms: s.imposto.icms,
                  pis: s.imposto.pis,
                  cofins: s.imposto.cofins,
                  ipi: s.imposto.ipi,
                ),
              );
          final produtoId = await _db.into(_db.produtos).insert(
                ProdutosCompanion.insert(
                  codigo: s.codigo,
                  descricao: s.descricao,
                  preco: s.preco,
                  impostoId: impostoId,
                ),
              );
          for (final ean in s.codigosBarras) {
            codigos.add(
              CodigosBarrasCompanion.insert(codigo: ean, produtoId: produtoId),
            );
          }
        }
        await _db.batch((b) => b.insertAll(_db.codigosBarras, codigos));
      });
    });

    final produtosPorCodigo = await resultado.medir(
      'Buscar produtos inseridos',
      () async {
        final linhas = await _db.select(_db.produtos).join([
          innerJoin(
            _db.impostos,
            _db.impostos.id.equalsExp(_db.produtos.impostoId),
          ),
        ]).get();
        return {
          for (final linha in linhas)
            linha.readTable(_db.produtos).codigo: (
              linha.readTable(_db.produtos),
              linha.readTable(_db.impostos),
            ),
        };
      },
    );

    await resultado.medir('Calcular e gravar 100 vendas', () {
      return _db.transaction(() async {
        final itens = <VendaItensCompanion>[];
        for (final s in seedVendas) {
          final totais = TotaisVenda();
          final calculos = <(Produto, ItemVendaSeed, CalculoItem)>[];
          for (final itemSeed in s.itens) {
            final (produto, imposto) =
                produtosPorCodigo[itemSeed.codigoProduto]!;
            final calculo = calcularItem(
              preco: produto.preco,
              quantidade: itemSeed.quantidade,
              aliquotaIcms: imposto.icms,
              aliquotaPis: imposto.pis,
              aliquotaCofins: imposto.cofins,
              aliquotaIpi: imposto.ipi,
            );
            totais.somar(calculo);
            calculos.add((produto, itemSeed, calculo));
          }

          final vendaId = await _db.into(_db.vendas).insert(
                VendasCompanion.insert(
                  numero: s.numero,
                  data: s.data,
                  valorBruto: totais.valorBruto,
                  valorIcms: totais.valorIcms,
                  valorPis: totais.valorPis,
                  valorCofins: totais.valorCofins,
                  valorIpi: totais.valorIpi,
                  valorTotal: totais.valorTotal,
                ),
              );

          var sequencia = 1;
          for (final (produto, itemSeed, calculo) in calculos) {
            itens.add(
              VendaItensCompanion.insert(
                vendaId: vendaId,
                produtoId: produto.id,
                sequencia: sequencia++,
                quantidade: itemSeed.quantidade,
                precoUnitario: produto.preco,
                valorBruto: calculo.valorBruto,
                valorIcms: calculo.valorIcms,
                valorPis: calculo.valorPis,
                valorCofins: calculo.valorCofins,
                valorIpi: calculo.valorIpi,
                valorTotal: calculo.valorTotal,
              ),
            );
          }
        }
        await _db.batch((b) => b.insertAll(_db.vendaItens, itens));
      });
    });

    await _preencherContagens(resultado);
    return resultado;
  }

  @override
  Future<Resultado> buscar() async {
    final resultado = Resultado('Get');

    final (produtos, codigosPorProduto) = await resultado.medir(
      'Buscar produtos + códigos + impostos',
      () => _db.transaction(() async {
        final produtos = await _db.select(_db.produtos).join([
          innerJoin(
            _db.impostos,
            _db.impostos.id.equalsExp(_db.produtos.impostoId),
          ),
        ]).map((l) => (l.readTable(_db.produtos), l.readTable(_db.impostos)))
            .get();
        final codigosPorProduto = <int, List<CodigoBarras>>{};
        for (final codigo in await _db.select(_db.codigosBarras).get()) {
          codigosPorProduto.putIfAbsent(codigo.produtoId, () => []).add(codigo);
        }
        return (produtos, codigosPorProduto);
      }),
    );

    final (vendas, itensPorVenda) = await resultado.medir(
      'Buscar vendas + itens',
      () => _db.transaction(() async {
        final vendas = await _db.select(_db.vendas).get();
        final itensPorVenda = <int, List<VendaItem>>{};
        for (final item in await _db.select(_db.vendaItens).get()) {
          itensPorVenda.putIfAbsent(item.vendaId, () => []).add(item);
        }
        return (vendas, itensPorVenda);
      }),
    );

    resultado.detalhes['Produtos lidos'] = '${produtos.length}';
    resultado.detalhes['Códigos lidos'] =
        '${codigosPorProduto.values.fold<int>(0, (s, l) => s + l.length)}';
    resultado.detalhes['Vendas lidas'] = '${vendas.length}';
    resultado.detalhes['Itens lidos'] =
        '${itensPorVenda.values.fold<int>(0, (s, l) => s + l.length)}';
    resultado.detalhes['Soma total das vendas'] = vendas
        .fold<double>(0, (s, v) => arredondar(s + v.valorTotal))
        .toStringAsFixed(2);
    return resultado;
  }

  @override
  Future<Resultado> deletar() async {
    final resultado = Resultado('Delete');
    await resultado.medir('Apagar todas as entidades', () {
      return _db.transaction(() async {
        await _db.delete(_db.vendaItens).go();
        await _db.delete(_db.vendas).go();
        await _db.delete(_db.codigosBarras).go();
        await _db.delete(_db.produtos).go();
        await _db.delete(_db.impostos).go();
      });
    });
    await _preencherContagens(resultado);
    return resultado;
  }

  Future<int> _contar(TableInfo tabela) async {
    final total = countAll();
    final linha = await (_db.selectOnly(tabela)..addColumns([total])).getSingle();
    return linha.read(total)!;
  }

  Future<void> _preencherContagens(Resultado resultado) async {
    resultado.detalhes['Produtos'] = '${await _contar(_db.produtos)}';
    resultado.detalhes['Códigos de barras'] =
        '${await _contar(_db.codigosBarras)}';
    resultado.detalhes['Impostos'] = '${await _contar(_db.impostos)}';
    resultado.detalhes['Vendas'] = '${await _contar(_db.vendas)}';
    resultado.detalhes['Itens de venda'] = '${await _contar(_db.vendaItens)}';
  }
}
