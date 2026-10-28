// Gerador determinístico de dados: sempre produz exatamente os mesmos
// produtos, códigos de barras, impostos e vendas, para que o benchmark
// seja comparável entre bancos. Este arquivo é idêntico nos dois projetos.

const int kTotalProdutos = 500;
const int kCodigosPorProduto = 2;
const int kTotalVendas = 100;

final DateTime kDataBaseVendas = DateTime(2026, 1, 1, 8);

class ImpostoSeed {
  const ImpostoSeed({
    required this.icms,
    required this.pis,
    required this.cofins,
    required this.ipi,
  });

  /// Alíquotas em percentual.
  final double icms;
  final double pis;
  final double cofins;
  final double ipi;
}

class ProdutoSeed {
  const ProdutoSeed({
    required this.codigo,
    required this.descricao,
    required this.preco,
    required this.codigosBarras,
    required this.imposto,
  });

  final int codigo;
  final String descricao;
  final double preco;
  final List<String> codigosBarras;
  final ImpostoSeed imposto;
}

class ItemVendaSeed {
  const ItemVendaSeed({required this.codigoProduto, required this.quantidade});

  final int codigoProduto;
  final double quantidade;
}

class VendaSeed {
  const VendaSeed({
    required this.numero,
    required this.data,
    required this.itens,
  });

  final int numero;
  final DateTime data;
  final List<ItemVendaSeed> itens;
}

const List<double> _aliquotasIcms = [0, 7, 12, 18, 25];
const List<double> _aliquotasIpi = [0, 5, 10];

List<ProdutoSeed> gerarProdutos() {
  return List.generate(kTotalProdutos, (i) {
    final codigo = i + 1;
    return ProdutoSeed(
      codigo: codigo,
      descricao: 'PRODUTO ${codigo.toString().padLeft(4, '0')}',
      // Preço entre 5,00 e 99,99, espalhado de forma determinística.
      preco: 5 + ((codigo * 7919) % 9500) / 100,
      codigosBarras: List.generate(
        kCodigosPorProduto,
        (k) => gerarEan13(codigo, k),
      ),
      imposto: ImpostoSeed(
        icms: _aliquotasIcms[codigo % _aliquotasIcms.length],
        pis: codigo.isEven ? 1.65 : 0.65,
        cofins: codigo.isEven ? 7.6 : 3.0,
        ipi: _aliquotasIpi[codigo % _aliquotasIpi.length],
      ),
    );
  });
}

/// 100 vendas com 1 a 5 itens cada (300 itens no total), todos com
/// produtos diferentes. O passo 7 é primo com 500, então os índices
/// nunca se repetem.
List<VendaSeed> gerarVendas() {
  var k = 0;
  return List.generate(kTotalVendas, (v) {
    final quantidadeItens = 1 + v % 5;
    final itens = List.generate(quantidadeItens, (_) {
      final item = ItemVendaSeed(
        codigoProduto: (k * 7) % kTotalProdutos + 1,
        quantidade: (1 + k % 4).toDouble(),
      );
      k++;
      return item;
    });
    return VendaSeed(
      numero: v + 1,
      data: kDataBaseVendas.add(Duration(minutes: v * 5)),
      itens: itens,
    );
  });
}

/// EAN-13 iniciado em 789 (Brasil) com dígito verificador válido.
String gerarEan13(int codigoProduto, int sequencia) {
  final base =
      '789${codigoProduto.toString().padLeft(8, '0')}$sequencia';
  var soma = 0;
  for (var i = 0; i < base.length; i++) {
    soma += int.parse(base[i]) * (i.isEven ? 1 : 3);
  }
  final digito = (10 - soma % 10) % 10;
  return '$base$digito';
}
