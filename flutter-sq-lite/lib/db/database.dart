import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DataClassName('Imposto')
class Impostos extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get icms => real()();
  RealColumn get pis => real()();
  RealColumn get cofins => real()();
  RealColumn get ipi => real()();
}

@DataClassName('Produto')
class Produtos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get codigo => integer().unique()();
  TextColumn get descricao => text()();
  RealColumn get preco => real()();
  IntColumn get impostoId => integer().references(Impostos, #id)();
}

@DataClassName('CodigoBarras')
class CodigosBarras extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get codigo => text().unique()();
  IntColumn get produtoId => integer().references(Produtos, #id)();
}

@DataClassName('Venda')
class Vendas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get numero => integer().unique()();
  DateTimeColumn get data => dateTime()();
  RealColumn get valorBruto => real()();
  RealColumn get valorIcms => real()();
  RealColumn get valorPis => real()();
  RealColumn get valorCofins => real()();
  RealColumn get valorIpi => real()();
  RealColumn get valorTotal => real()();
}

@DataClassName('VendaItem')
class VendaItens extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get vendaId => integer().references(Vendas, #id)();
  IntColumn get produtoId => integer().references(Produtos, #id)();
  IntColumn get sequencia => integer()();
  RealColumn get quantidade => real()();
  RealColumn get precoUnitario => real()();
  RealColumn get valorBruto => real()();
  RealColumn get valorIcms => real()();
  RealColumn get valorPis => real()();
  RealColumn get valorCofins => real()();
  RealColumn get valorIpi => real()();
  RealColumn get valorTotal => real()();
}

@DriftDatabase(
  tables: [Impostos, Produtos, CodigosBarras, Vendas, VendaItens],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  /// Abre o banco na mesma isolate da UI (igual ao ObjectBox),
  /// para a comparação não incluir custo de comunicação entre isolates.
  static Future<AppDatabase> abrir() async {
    final dir = await getApplicationSupportDirectory();
    final arquivo = File(p.join(dir.path, 'sqlite', 'benchmark.db'));
    await arquivo.parent.create(recursive: true);
    return AppDatabase(NativeDatabase(arquivo));
  }

  // Incrementar ao alterar tabelas e tratar a mudança em onUpgrade.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          // Exemplo: if (from < 2) await m.addColumn(produtos, produtos.novaColuna);
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
