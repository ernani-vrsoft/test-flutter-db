import 'package:objectbox/objectbox.dart';

@Entity()
class Imposto {
  Imposto({
    this.id = 0,
    required this.icms,
    required this.pis,
    required this.cofins,
    required this.ipi,
  });

  @Id()
  int id;

  double icms;
  double pis;
  double cofins;
  double ipi;
}

@Entity()
class Produto {
  Produto({
    this.id = 0,
    required this.codigo,
    required this.descricao,
    required this.preco,
  });

  @Id()
  int id;

  @Unique()
  int codigo;

  String descricao;
  double preco;

  final imposto = ToOne<Imposto>();

  @Backlink('produto')
  final codigosBarras = ToMany<CodigoBarras>();
}

@Entity()
class CodigoBarras {
  CodigoBarras({this.id = 0, required this.codigo});

  @Id()
  int id;

  @Unique()
  String codigo;

  final produto = ToOne<Produto>();
}

@Entity()
class Venda {
  Venda({
    this.id = 0,
    required this.numero,
    required this.data,
    this.valorBruto = 0,
    this.valorIcms = 0,
    this.valorPis = 0,
    this.valorCofins = 0,
    this.valorIpi = 0,
    this.valorTotal = 0,
  });

  @Id()
  int id;

  @Unique()
  int numero;

  @Property(type: PropertyType.date)
  DateTime data;

  double valorBruto;
  double valorIcms;
  double valorPis;
  double valorCofins;
  double valorIpi;
  double valorTotal;

  @Backlink('venda')
  final itens = ToMany<VendaItem>();
}

@Entity()
class VendaItem {
  VendaItem({
    this.id = 0,
    required this.sequencia,
    required this.quantidade,
    required this.precoUnitario,
    required this.valorBruto,
    required this.valorIcms,
    required this.valorPis,
    required this.valorCofins,
    required this.valorIpi,
    required this.valorTotal,
  });

  @Id()
  int id;

  int sequencia;
  double quantidade;
  double precoUnitario;
  double valorBruto;
  double valorIcms;
  double valorPis;
  double valorCofins;
  double valorIpi;
  double valorTotal;

  final venda = ToOne<Venda>();
  final produto = ToOne<Produto>();
}
