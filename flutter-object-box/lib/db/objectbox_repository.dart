import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../benchmark/benchmark.dart';
import '../objectbox.g.dart';
import '../seed/calculo.dart';
import '../seed/seed_data.dart';
import 'entities.dart';

class ObjectBoxRepository implements BenchmarkRepository {
  late final Store _store;
  late final Box<Imposto> _impostos;
  late final Box<Produto> _produtos;
  late final Box<CodigoBarras> _codigos;
  late final Box<Venda> _vendas;
  late final Box<VendaItem> _itens;

  @override
  String get nome => 'ObjectBox';

  @override
  Future<void> abrir() async {
    final dir = await getApplicationSupportDirectory();
    _store = await openStore(directory: p.join(dir.path, 'objectbox'));
    _impostos = _store.box<Imposto>();
    _produtos = _store.box<Produto>();
    _codigos = _store.box<CodigoBarras>();
    _vendas = _store.box<Venda>();
    _itens = _store.box<VendaItem>();
  }

  @override
  Future<void> fechar() async => _store.close();

  @override
  Future<Resultado> inserir() async {
    if (_produtos.count(limit: 1) > 0) {
      throw StateError('A base não está vazia. Execute o Delete antes.');
    }

    final seedProdutos = gerarProdutos();
    final seedVendas = gerarVendas();
    final resultado = Resultado('Insert');

    await resultado.medir('Inserir 500 produtos + códigos + impostos', () {
      _store.runInTransaction(TxMode.write, () {
        final impostos = <Imposto>[];
        final produtos = <Produto>[];
        final codigos = <CodigoBarras>[];
        for (final s in seedProdutos) {
          final imposto = Imposto(
            icms: s.imposto.icms,
            pis: s.imposto.pis,
            cofins: s.imposto.cofins,
            ipi: s.imposto.ipi,
          );
          final produto = Produto(
            codigo: s.codigo,
            descricao: s.descricao,
            preco: s.preco,
          )..imposto.target = imposto;
          impostos.add(imposto);
          produtos.add(produto);
          for (final ean in s.codigosBarras) {
            codigos.add(CodigoBarras(codigo: ean)..produto.target = produto);
          }
        }
        _impostos.putMany(impostos);
        _produtos.putMany(produtos);
        _codigos.putMany(codigos);
      });
    });

    final produtosPorCodigo = await resultado.medir(
      'Buscar produtos inseridos',
      () {
        final produtos = _produtos.getAll();
        return {
          for (final produto in produtos)
            // Força o carregamento do imposto (ToOne é lazy).
            if (produto.imposto.target != null) produto.codigo: produto,
        };
      },
    );

    await resultado.medir('Calcular e gravar 100 vendas', () {
      final vendas = <Venda>[];
      final itens = <VendaItem>[];
      for (final s in seedVendas) {
        final venda = Venda(numero: s.numero, data: s.data);
        final totais = TotaisVenda();
        var sequencia = 1;
        for (final itemSeed in s.itens) {
          final produto = produtosPorCodigo[itemSeed.codigoProduto]!;
          final imposto = produto.imposto.target!;
          final calculo = calcularItem(
            preco: produto.preco,
            quantidade: itemSeed.quantidade,
            aliquotaIcms: imposto.icms,
            aliquotaPis: imposto.pis,
            aliquotaCofins: imposto.cofins,
            aliquotaIpi: imposto.ipi,
          );
          totais.somar(calculo);
          itens.add(
            VendaItem(
              sequencia: sequencia++,
              quantidade: itemSeed.quantidade,
              precoUnitario: produto.preco,
              valorBruto: calculo.valorBruto,
              valorIcms: calculo.valorIcms,
              valorPis: calculo.valorPis,
              valorCofins: calculo.valorCofins,
              valorIpi: calculo.valorIpi,
              valorTotal: calculo.valorTotal,
            )
              ..venda.target = venda
              ..produto.target = produto,
          );
        }
        venda
          ..valorBruto = totais.valorBruto
          ..valorIcms = totais.valorIcms
          ..valorPis = totais.valorPis
          ..valorCofins = totais.valorCofins
          ..valorIpi = totais.valorIpi
          ..valorTotal = totais.valorTotal;
        vendas.add(venda);
      }
      _store.runInTransaction(TxMode.write, () {
        _vendas.putMany(vendas);
        _itens.putMany(itens);
      });
    });

    _preencherContagens(resultado);
    return resultado;
  }

  @override
  Future<Resultado> buscar() async {
    final resultado = Resultado('Get');

    final produtos = await resultado.medir(
      'Buscar produtos + códigos + impostos',
      () => _store.runInTransaction(TxMode.read, () {
        final produtos = _produtos.getAll();
        // Acessa as relações para carregar tudo (são lazy no ObjectBox).
        for (final produto in produtos) {
          produto.imposto.target;
          produto.codigosBarras.length;
        }
        return produtos;
      }),
    );

    final vendas = await resultado.medir(
      'Buscar vendas + itens',
      () => _store.runInTransaction(TxMode.read, () {
        final vendas = _vendas.getAll();
        for (final venda in vendas) {
          for (final item in venda.itens) {
            item.produto.targetId;
          }
        }
        return vendas;
      }),
    );

    resultado.detalhes['Produtos lidos'] = '${produtos.length}';
    resultado.detalhes['Códigos lidos'] =
        '${produtos.fold<int>(0, (s, p) => s + p.codigosBarras.length)}';
    resultado.detalhes['Vendas lidas'] = '${vendas.length}';
    resultado.detalhes['Itens lidos'] =
        '${vendas.fold<int>(0, (s, v) => s + v.itens.length)}';
    resultado.detalhes['Soma total das vendas'] = vendas
        .fold<double>(0, (s, v) => arredondar(s + v.valorTotal))
        .toStringAsFixed(2);
    return resultado;
  }

  @override
  Future<Resultado> deletar() async {
    final resultado = Resultado('Delete');
    await resultado.medir('Apagar todas as entidades', () {
      _store.runInTransaction(TxMode.write, () {
        _itens.removeAll();
        _vendas.removeAll();
        _codigos.removeAll();
        _produtos.removeAll();
        _impostos.removeAll();
      });
    });
    _preencherContagens(resultado);
    return resultado;
  }

  void _preencherContagens(Resultado resultado) {
    resultado.detalhes['Produtos'] = '${_produtos.count()}';
    resultado.detalhes['Códigos de barras'] = '${_codigos.count()}';
    resultado.detalhes['Impostos'] = '${_impostos.count()}';
    resultado.detalhes['Vendas'] = '${_vendas.count()}';
    resultado.detalhes['Itens de venda'] = '${_itens.count()}';
  }
}
