// Cálculo dos valores de venda. Idêntico nos dois projetos.
//
// ICMS, PIS e COFINS são "por dentro" (já estão no preço);
// IPI é "por fora" (somado ao total do item).

double arredondar(double valor) => (valor * 100).roundToDouble() / 100;

class CalculoItem {
  const CalculoItem({
    required this.valorBruto,
    required this.valorIcms,
    required this.valorPis,
    required this.valorCofins,
    required this.valorIpi,
    required this.valorTotal,
  });

  final double valorBruto;
  final double valorIcms;
  final double valorPis;
  final double valorCofins;
  final double valorIpi;
  final double valorTotal;
}

CalculoItem calcularItem({
  required double preco,
  required double quantidade,
  required double aliquotaIcms,
  required double aliquotaPis,
  required double aliquotaCofins,
  required double aliquotaIpi,
}) {
  final bruto = arredondar(preco * quantidade);
  final ipi = arredondar(bruto * aliquotaIpi / 100);
  return CalculoItem(
    valorBruto: bruto,
    valorIcms: arredondar(bruto * aliquotaIcms / 100),
    valorPis: arredondar(bruto * aliquotaPis / 100),
    valorCofins: arredondar(bruto * aliquotaCofins / 100),
    valorIpi: ipi,
    valorTotal: arredondar(bruto + ipi),
  );
}

class TotaisVenda {
  double valorBruto = 0;
  double valorIcms = 0;
  double valorPis = 0;
  double valorCofins = 0;
  double valorIpi = 0;
  double valorTotal = 0;

  void somar(CalculoItem item) {
    valorBruto = arredondar(valorBruto + item.valorBruto);
    valorIcms = arredondar(valorIcms + item.valorIcms);
    valorPis = arredondar(valorPis + item.valorPis);
    valorCofins = arredondar(valorCofins + item.valorCofins);
    valorIpi = arredondar(valorIpi + item.valorIpi);
    valorTotal = arredondar(valorTotal + item.valorTotal);
  }
}
