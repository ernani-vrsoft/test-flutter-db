// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ImpostosTable extends Impostos with TableInfo<$ImpostosTable, Imposto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImpostosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _icmsMeta = const VerificationMeta('icms');
  @override
  late final GeneratedColumn<double> icms = GeneratedColumn<double>(
    'icms',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pisMeta = const VerificationMeta('pis');
  @override
  late final GeneratedColumn<double> pis = GeneratedColumn<double>(
    'pis',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cofinsMeta = const VerificationMeta('cofins');
  @override
  late final GeneratedColumn<double> cofins = GeneratedColumn<double>(
    'cofins',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ipiMeta = const VerificationMeta('ipi');
  @override
  late final GeneratedColumn<double> ipi = GeneratedColumn<double>(
    'ipi',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, icms, pis, cofins, ipi];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'impostos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Imposto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('icms')) {
      context.handle(
        _icmsMeta,
        icms.isAcceptableOrUnknown(data['icms']!, _icmsMeta),
      );
    } else if (isInserting) {
      context.missing(_icmsMeta);
    }
    if (data.containsKey('pis')) {
      context.handle(
        _pisMeta,
        pis.isAcceptableOrUnknown(data['pis']!, _pisMeta),
      );
    } else if (isInserting) {
      context.missing(_pisMeta);
    }
    if (data.containsKey('cofins')) {
      context.handle(
        _cofinsMeta,
        cofins.isAcceptableOrUnknown(data['cofins']!, _cofinsMeta),
      );
    } else if (isInserting) {
      context.missing(_cofinsMeta);
    }
    if (data.containsKey('ipi')) {
      context.handle(
        _ipiMeta,
        ipi.isAcceptableOrUnknown(data['ipi']!, _ipiMeta),
      );
    } else if (isInserting) {
      context.missing(_ipiMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Imposto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Imposto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      icms: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}icms'],
      )!,
      pis: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pis'],
      )!,
      cofins: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cofins'],
      )!,
      ipi: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ipi'],
      )!,
    );
  }

  @override
  $ImpostosTable createAlias(String alias) {
    return $ImpostosTable(attachedDatabase, alias);
  }
}

class Imposto extends DataClass implements Insertable<Imposto> {
  final int id;
  final double icms;
  final double pis;
  final double cofins;
  final double ipi;
  const Imposto({
    required this.id,
    required this.icms,
    required this.pis,
    required this.cofins,
    required this.ipi,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['icms'] = Variable<double>(icms);
    map['pis'] = Variable<double>(pis);
    map['cofins'] = Variable<double>(cofins);
    map['ipi'] = Variable<double>(ipi);
    return map;
  }

  ImpostosCompanion toCompanion(bool nullToAbsent) {
    return ImpostosCompanion(
      id: Value(id),
      icms: Value(icms),
      pis: Value(pis),
      cofins: Value(cofins),
      ipi: Value(ipi),
    );
  }

  factory Imposto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Imposto(
      id: serializer.fromJson<int>(json['id']),
      icms: serializer.fromJson<double>(json['icms']),
      pis: serializer.fromJson<double>(json['pis']),
      cofins: serializer.fromJson<double>(json['cofins']),
      ipi: serializer.fromJson<double>(json['ipi']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'icms': serializer.toJson<double>(icms),
      'pis': serializer.toJson<double>(pis),
      'cofins': serializer.toJson<double>(cofins),
      'ipi': serializer.toJson<double>(ipi),
    };
  }

  Imposto copyWith({
    int? id,
    double? icms,
    double? pis,
    double? cofins,
    double? ipi,
  }) => Imposto(
    id: id ?? this.id,
    icms: icms ?? this.icms,
    pis: pis ?? this.pis,
    cofins: cofins ?? this.cofins,
    ipi: ipi ?? this.ipi,
  );
  Imposto copyWithCompanion(ImpostosCompanion data) {
    return Imposto(
      id: data.id.present ? data.id.value : this.id,
      icms: data.icms.present ? data.icms.value : this.icms,
      pis: data.pis.present ? data.pis.value : this.pis,
      cofins: data.cofins.present ? data.cofins.value : this.cofins,
      ipi: data.ipi.present ? data.ipi.value : this.ipi,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Imposto(')
          ..write('id: $id, ')
          ..write('icms: $icms, ')
          ..write('pis: $pis, ')
          ..write('cofins: $cofins, ')
          ..write('ipi: $ipi')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, icms, pis, cofins, ipi);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Imposto &&
          other.id == this.id &&
          other.icms == this.icms &&
          other.pis == this.pis &&
          other.cofins == this.cofins &&
          other.ipi == this.ipi);
}

class ImpostosCompanion extends UpdateCompanion<Imposto> {
  final Value<int> id;
  final Value<double> icms;
  final Value<double> pis;
  final Value<double> cofins;
  final Value<double> ipi;
  const ImpostosCompanion({
    this.id = const Value.absent(),
    this.icms = const Value.absent(),
    this.pis = const Value.absent(),
    this.cofins = const Value.absent(),
    this.ipi = const Value.absent(),
  });
  ImpostosCompanion.insert({
    this.id = const Value.absent(),
    required double icms,
    required double pis,
    required double cofins,
    required double ipi,
  }) : icms = Value(icms),
       pis = Value(pis),
       cofins = Value(cofins),
       ipi = Value(ipi);
  static Insertable<Imposto> custom({
    Expression<int>? id,
    Expression<double>? icms,
    Expression<double>? pis,
    Expression<double>? cofins,
    Expression<double>? ipi,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (icms != null) 'icms': icms,
      if (pis != null) 'pis': pis,
      if (cofins != null) 'cofins': cofins,
      if (ipi != null) 'ipi': ipi,
    });
  }

  ImpostosCompanion copyWith({
    Value<int>? id,
    Value<double>? icms,
    Value<double>? pis,
    Value<double>? cofins,
    Value<double>? ipi,
  }) {
    return ImpostosCompanion(
      id: id ?? this.id,
      icms: icms ?? this.icms,
      pis: pis ?? this.pis,
      cofins: cofins ?? this.cofins,
      ipi: ipi ?? this.ipi,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (icms.present) {
      map['icms'] = Variable<double>(icms.value);
    }
    if (pis.present) {
      map['pis'] = Variable<double>(pis.value);
    }
    if (cofins.present) {
      map['cofins'] = Variable<double>(cofins.value);
    }
    if (ipi.present) {
      map['ipi'] = Variable<double>(ipi.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImpostosCompanion(')
          ..write('id: $id, ')
          ..write('icms: $icms, ')
          ..write('pis: $pis, ')
          ..write('cofins: $cofins, ')
          ..write('ipi: $ipi')
          ..write(')'))
        .toString();
  }
}

class $ProdutosTable extends Produtos with TableInfo<$ProdutosTable, Produto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProdutosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<int> codigo = GeneratedColumn<int>(
    'codigo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _descricaoMeta = const VerificationMeta(
    'descricao',
  );
  @override
  late final GeneratedColumn<String> descricao = GeneratedColumn<String>(
    'descricao',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precoMeta = const VerificationMeta('preco');
  @override
  late final GeneratedColumn<double> preco = GeneratedColumn<double>(
    'preco',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _impostoIdMeta = const VerificationMeta(
    'impostoId',
  );
  @override
  late final GeneratedColumn<int> impostoId = GeneratedColumn<int>(
    'imposto_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES impostos (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    codigo,
    descricao,
    preco,
    impostoId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'produtos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Produto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('codigo')) {
      context.handle(
        _codigoMeta,
        codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta),
      );
    } else if (isInserting) {
      context.missing(_codigoMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(
        _descricaoMeta,
        descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta),
      );
    } else if (isInserting) {
      context.missing(_descricaoMeta);
    }
    if (data.containsKey('preco')) {
      context.handle(
        _precoMeta,
        preco.isAcceptableOrUnknown(data['preco']!, _precoMeta),
      );
    } else if (isInserting) {
      context.missing(_precoMeta);
    }
    if (data.containsKey('imposto_id')) {
      context.handle(
        _impostoIdMeta,
        impostoId.isAcceptableOrUnknown(data['imposto_id']!, _impostoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_impostoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Produto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Produto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      codigo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}codigo'],
      )!,
      descricao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descricao'],
      )!,
      preco: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}preco'],
      )!,
      impostoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}imposto_id'],
      )!,
    );
  }

  @override
  $ProdutosTable createAlias(String alias) {
    return $ProdutosTable(attachedDatabase, alias);
  }
}

class Produto extends DataClass implements Insertable<Produto> {
  final int id;
  final int codigo;
  final String descricao;
  final double preco;
  final int impostoId;
  const Produto({
    required this.id,
    required this.codigo,
    required this.descricao,
    required this.preco,
    required this.impostoId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['codigo'] = Variable<int>(codigo);
    map['descricao'] = Variable<String>(descricao);
    map['preco'] = Variable<double>(preco);
    map['imposto_id'] = Variable<int>(impostoId);
    return map;
  }

  ProdutosCompanion toCompanion(bool nullToAbsent) {
    return ProdutosCompanion(
      id: Value(id),
      codigo: Value(codigo),
      descricao: Value(descricao),
      preco: Value(preco),
      impostoId: Value(impostoId),
    );
  }

  factory Produto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Produto(
      id: serializer.fromJson<int>(json['id']),
      codigo: serializer.fromJson<int>(json['codigo']),
      descricao: serializer.fromJson<String>(json['descricao']),
      preco: serializer.fromJson<double>(json['preco']),
      impostoId: serializer.fromJson<int>(json['impostoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'codigo': serializer.toJson<int>(codigo),
      'descricao': serializer.toJson<String>(descricao),
      'preco': serializer.toJson<double>(preco),
      'impostoId': serializer.toJson<int>(impostoId),
    };
  }

  Produto copyWith({
    int? id,
    int? codigo,
    String? descricao,
    double? preco,
    int? impostoId,
  }) => Produto(
    id: id ?? this.id,
    codigo: codigo ?? this.codigo,
    descricao: descricao ?? this.descricao,
    preco: preco ?? this.preco,
    impostoId: impostoId ?? this.impostoId,
  );
  Produto copyWithCompanion(ProdutosCompanion data) {
    return Produto(
      id: data.id.present ? data.id.value : this.id,
      codigo: data.codigo.present ? data.codigo.value : this.codigo,
      descricao: data.descricao.present ? data.descricao.value : this.descricao,
      preco: data.preco.present ? data.preco.value : this.preco,
      impostoId: data.impostoId.present ? data.impostoId.value : this.impostoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Produto(')
          ..write('id: $id, ')
          ..write('codigo: $codigo, ')
          ..write('descricao: $descricao, ')
          ..write('preco: $preco, ')
          ..write('impostoId: $impostoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, codigo, descricao, preco, impostoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Produto &&
          other.id == this.id &&
          other.codigo == this.codigo &&
          other.descricao == this.descricao &&
          other.preco == this.preco &&
          other.impostoId == this.impostoId);
}

class ProdutosCompanion extends UpdateCompanion<Produto> {
  final Value<int> id;
  final Value<int> codigo;
  final Value<String> descricao;
  final Value<double> preco;
  final Value<int> impostoId;
  const ProdutosCompanion({
    this.id = const Value.absent(),
    this.codigo = const Value.absent(),
    this.descricao = const Value.absent(),
    this.preco = const Value.absent(),
    this.impostoId = const Value.absent(),
  });
  ProdutosCompanion.insert({
    this.id = const Value.absent(),
    required int codigo,
    required String descricao,
    required double preco,
    required int impostoId,
  }) : codigo = Value(codigo),
       descricao = Value(descricao),
       preco = Value(preco),
       impostoId = Value(impostoId);
  static Insertable<Produto> custom({
    Expression<int>? id,
    Expression<int>? codigo,
    Expression<String>? descricao,
    Expression<double>? preco,
    Expression<int>? impostoId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (codigo != null) 'codigo': codigo,
      if (descricao != null) 'descricao': descricao,
      if (preco != null) 'preco': preco,
      if (impostoId != null) 'imposto_id': impostoId,
    });
  }

  ProdutosCompanion copyWith({
    Value<int>? id,
    Value<int>? codigo,
    Value<String>? descricao,
    Value<double>? preco,
    Value<int>? impostoId,
  }) {
    return ProdutosCompanion(
      id: id ?? this.id,
      codigo: codigo ?? this.codigo,
      descricao: descricao ?? this.descricao,
      preco: preco ?? this.preco,
      impostoId: impostoId ?? this.impostoId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (preco.present) {
      map['preco'] = Variable<double>(preco.value);
    }
    if (impostoId.present) {
      map['imposto_id'] = Variable<int>(impostoId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProdutosCompanion(')
          ..write('id: $id, ')
          ..write('codigo: $codigo, ')
          ..write('descricao: $descricao, ')
          ..write('preco: $preco, ')
          ..write('impostoId: $impostoId')
          ..write(')'))
        .toString();
  }
}

class $CodigosBarrasTable extends CodigosBarras
    with TableInfo<$CodigosBarrasTable, CodigoBarras> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CodigosBarrasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<String> codigo = GeneratedColumn<String>(
    'codigo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _produtoIdMeta = const VerificationMeta(
    'produtoId',
  );
  @override
  late final GeneratedColumn<int> produtoId = GeneratedColumn<int>(
    'produto_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES produtos (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, codigo, produtoId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'codigos_barras';
  @override
  VerificationContext validateIntegrity(
    Insertable<CodigoBarras> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('codigo')) {
      context.handle(
        _codigoMeta,
        codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta),
      );
    } else if (isInserting) {
      context.missing(_codigoMeta);
    }
    if (data.containsKey('produto_id')) {
      context.handle(
        _produtoIdMeta,
        produtoId.isAcceptableOrUnknown(data['produto_id']!, _produtoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_produtoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CodigoBarras map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CodigoBarras(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      codigo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codigo'],
      )!,
      produtoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}produto_id'],
      )!,
    );
  }

  @override
  $CodigosBarrasTable createAlias(String alias) {
    return $CodigosBarrasTable(attachedDatabase, alias);
  }
}

class CodigoBarras extends DataClass implements Insertable<CodigoBarras> {
  final int id;
  final String codigo;
  final int produtoId;
  const CodigoBarras({
    required this.id,
    required this.codigo,
    required this.produtoId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['codigo'] = Variable<String>(codigo);
    map['produto_id'] = Variable<int>(produtoId);
    return map;
  }

  CodigosBarrasCompanion toCompanion(bool nullToAbsent) {
    return CodigosBarrasCompanion(
      id: Value(id),
      codigo: Value(codigo),
      produtoId: Value(produtoId),
    );
  }

  factory CodigoBarras.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CodigoBarras(
      id: serializer.fromJson<int>(json['id']),
      codigo: serializer.fromJson<String>(json['codigo']),
      produtoId: serializer.fromJson<int>(json['produtoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'codigo': serializer.toJson<String>(codigo),
      'produtoId': serializer.toJson<int>(produtoId),
    };
  }

  CodigoBarras copyWith({int? id, String? codigo, int? produtoId}) =>
      CodigoBarras(
        id: id ?? this.id,
        codigo: codigo ?? this.codigo,
        produtoId: produtoId ?? this.produtoId,
      );
  CodigoBarras copyWithCompanion(CodigosBarrasCompanion data) {
    return CodigoBarras(
      id: data.id.present ? data.id.value : this.id,
      codigo: data.codigo.present ? data.codigo.value : this.codigo,
      produtoId: data.produtoId.present ? data.produtoId.value : this.produtoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CodigoBarras(')
          ..write('id: $id, ')
          ..write('codigo: $codigo, ')
          ..write('produtoId: $produtoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, codigo, produtoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CodigoBarras &&
          other.id == this.id &&
          other.codigo == this.codigo &&
          other.produtoId == this.produtoId);
}

class CodigosBarrasCompanion extends UpdateCompanion<CodigoBarras> {
  final Value<int> id;
  final Value<String> codigo;
  final Value<int> produtoId;
  const CodigosBarrasCompanion({
    this.id = const Value.absent(),
    this.codigo = const Value.absent(),
    this.produtoId = const Value.absent(),
  });
  CodigosBarrasCompanion.insert({
    this.id = const Value.absent(),
    required String codigo,
    required int produtoId,
  }) : codigo = Value(codigo),
       produtoId = Value(produtoId);
  static Insertable<CodigoBarras> custom({
    Expression<int>? id,
    Expression<String>? codigo,
    Expression<int>? produtoId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (codigo != null) 'codigo': codigo,
      if (produtoId != null) 'produto_id': produtoId,
    });
  }

  CodigosBarrasCompanion copyWith({
    Value<int>? id,
    Value<String>? codigo,
    Value<int>? produtoId,
  }) {
    return CodigosBarrasCompanion(
      id: id ?? this.id,
      codigo: codigo ?? this.codigo,
      produtoId: produtoId ?? this.produtoId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (codigo.present) {
      map['codigo'] = Variable<String>(codigo.value);
    }
    if (produtoId.present) {
      map['produto_id'] = Variable<int>(produtoId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CodigosBarrasCompanion(')
          ..write('id: $id, ')
          ..write('codigo: $codigo, ')
          ..write('produtoId: $produtoId')
          ..write(')'))
        .toString();
  }
}

class $VendasTable extends Vendas with TableInfo<$VendasTable, Venda> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VendasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<int> numero = GeneratedColumn<int>(
    'numero',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<DateTime> data = GeneratedColumn<DateTime>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorBrutoMeta = const VerificationMeta(
    'valorBruto',
  );
  @override
  late final GeneratedColumn<double> valorBruto = GeneratedColumn<double>(
    'valor_bruto',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorIcmsMeta = const VerificationMeta(
    'valorIcms',
  );
  @override
  late final GeneratedColumn<double> valorIcms = GeneratedColumn<double>(
    'valor_icms',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorPisMeta = const VerificationMeta(
    'valorPis',
  );
  @override
  late final GeneratedColumn<double> valorPis = GeneratedColumn<double>(
    'valor_pis',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorCofinsMeta = const VerificationMeta(
    'valorCofins',
  );
  @override
  late final GeneratedColumn<double> valorCofins = GeneratedColumn<double>(
    'valor_cofins',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorIpiMeta = const VerificationMeta(
    'valorIpi',
  );
  @override
  late final GeneratedColumn<double> valorIpi = GeneratedColumn<double>(
    'valor_ipi',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorTotalMeta = const VerificationMeta(
    'valorTotal',
  );
  @override
  late final GeneratedColumn<double> valorTotal = GeneratedColumn<double>(
    'valor_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    numero,
    data,
    valorBruto,
    valorIcms,
    valorPis,
    valorCofins,
    valorIpi,
    valorTotal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vendas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Venda> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('numero')) {
      context.handle(
        _numeroMeta,
        numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('valor_bruto')) {
      context.handle(
        _valorBrutoMeta,
        valorBruto.isAcceptableOrUnknown(data['valor_bruto']!, _valorBrutoMeta),
      );
    } else if (isInserting) {
      context.missing(_valorBrutoMeta);
    }
    if (data.containsKey('valor_icms')) {
      context.handle(
        _valorIcmsMeta,
        valorIcms.isAcceptableOrUnknown(data['valor_icms']!, _valorIcmsMeta),
      );
    } else if (isInserting) {
      context.missing(_valorIcmsMeta);
    }
    if (data.containsKey('valor_pis')) {
      context.handle(
        _valorPisMeta,
        valorPis.isAcceptableOrUnknown(data['valor_pis']!, _valorPisMeta),
      );
    } else if (isInserting) {
      context.missing(_valorPisMeta);
    }
    if (data.containsKey('valor_cofins')) {
      context.handle(
        _valorCofinsMeta,
        valorCofins.isAcceptableOrUnknown(
          data['valor_cofins']!,
          _valorCofinsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_valorCofinsMeta);
    }
    if (data.containsKey('valor_ipi')) {
      context.handle(
        _valorIpiMeta,
        valorIpi.isAcceptableOrUnknown(data['valor_ipi']!, _valorIpiMeta),
      );
    } else if (isInserting) {
      context.missing(_valorIpiMeta);
    }
    if (data.containsKey('valor_total')) {
      context.handle(
        _valorTotalMeta,
        valorTotal.isAcceptableOrUnknown(data['valor_total']!, _valorTotalMeta),
      );
    } else if (isInserting) {
      context.missing(_valorTotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Venda map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Venda(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      numero: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}numero'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data'],
      )!,
      valorBruto: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_bruto'],
      )!,
      valorIcms: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_icms'],
      )!,
      valorPis: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_pis'],
      )!,
      valorCofins: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_cofins'],
      )!,
      valorIpi: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_ipi'],
      )!,
      valorTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_total'],
      )!,
    );
  }

  @override
  $VendasTable createAlias(String alias) {
    return $VendasTable(attachedDatabase, alias);
  }
}

class Venda extends DataClass implements Insertable<Venda> {
  final int id;
  final int numero;
  final DateTime data;
  final double valorBruto;
  final double valorIcms;
  final double valorPis;
  final double valorCofins;
  final double valorIpi;
  final double valorTotal;
  const Venda({
    required this.id,
    required this.numero,
    required this.data,
    required this.valorBruto,
    required this.valorIcms,
    required this.valorPis,
    required this.valorCofins,
    required this.valorIpi,
    required this.valorTotal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['numero'] = Variable<int>(numero);
    map['data'] = Variable<DateTime>(data);
    map['valor_bruto'] = Variable<double>(valorBruto);
    map['valor_icms'] = Variable<double>(valorIcms);
    map['valor_pis'] = Variable<double>(valorPis);
    map['valor_cofins'] = Variable<double>(valorCofins);
    map['valor_ipi'] = Variable<double>(valorIpi);
    map['valor_total'] = Variable<double>(valorTotal);
    return map;
  }

  VendasCompanion toCompanion(bool nullToAbsent) {
    return VendasCompanion(
      id: Value(id),
      numero: Value(numero),
      data: Value(data),
      valorBruto: Value(valorBruto),
      valorIcms: Value(valorIcms),
      valorPis: Value(valorPis),
      valorCofins: Value(valorCofins),
      valorIpi: Value(valorIpi),
      valorTotal: Value(valorTotal),
    );
  }

  factory Venda.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Venda(
      id: serializer.fromJson<int>(json['id']),
      numero: serializer.fromJson<int>(json['numero']),
      data: serializer.fromJson<DateTime>(json['data']),
      valorBruto: serializer.fromJson<double>(json['valorBruto']),
      valorIcms: serializer.fromJson<double>(json['valorIcms']),
      valorPis: serializer.fromJson<double>(json['valorPis']),
      valorCofins: serializer.fromJson<double>(json['valorCofins']),
      valorIpi: serializer.fromJson<double>(json['valorIpi']),
      valorTotal: serializer.fromJson<double>(json['valorTotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'numero': serializer.toJson<int>(numero),
      'data': serializer.toJson<DateTime>(data),
      'valorBruto': serializer.toJson<double>(valorBruto),
      'valorIcms': serializer.toJson<double>(valorIcms),
      'valorPis': serializer.toJson<double>(valorPis),
      'valorCofins': serializer.toJson<double>(valorCofins),
      'valorIpi': serializer.toJson<double>(valorIpi),
      'valorTotal': serializer.toJson<double>(valorTotal),
    };
  }

  Venda copyWith({
    int? id,
    int? numero,
    DateTime? data,
    double? valorBruto,
    double? valorIcms,
    double? valorPis,
    double? valorCofins,
    double? valorIpi,
    double? valorTotal,
  }) => Venda(
    id: id ?? this.id,
    numero: numero ?? this.numero,
    data: data ?? this.data,
    valorBruto: valorBruto ?? this.valorBruto,
    valorIcms: valorIcms ?? this.valorIcms,
    valorPis: valorPis ?? this.valorPis,
    valorCofins: valorCofins ?? this.valorCofins,
    valorIpi: valorIpi ?? this.valorIpi,
    valorTotal: valorTotal ?? this.valorTotal,
  );
  Venda copyWithCompanion(VendasCompanion data) {
    return Venda(
      id: data.id.present ? data.id.value : this.id,
      numero: data.numero.present ? data.numero.value : this.numero,
      data: data.data.present ? data.data.value : this.data,
      valorBruto: data.valorBruto.present
          ? data.valorBruto.value
          : this.valorBruto,
      valorIcms: data.valorIcms.present ? data.valorIcms.value : this.valorIcms,
      valorPis: data.valorPis.present ? data.valorPis.value : this.valorPis,
      valorCofins: data.valorCofins.present
          ? data.valorCofins.value
          : this.valorCofins,
      valorIpi: data.valorIpi.present ? data.valorIpi.value : this.valorIpi,
      valorTotal: data.valorTotal.present
          ? data.valorTotal.value
          : this.valorTotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Venda(')
          ..write('id: $id, ')
          ..write('numero: $numero, ')
          ..write('data: $data, ')
          ..write('valorBruto: $valorBruto, ')
          ..write('valorIcms: $valorIcms, ')
          ..write('valorPis: $valorPis, ')
          ..write('valorCofins: $valorCofins, ')
          ..write('valorIpi: $valorIpi, ')
          ..write('valorTotal: $valorTotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    numero,
    data,
    valorBruto,
    valorIcms,
    valorPis,
    valorCofins,
    valorIpi,
    valorTotal,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Venda &&
          other.id == this.id &&
          other.numero == this.numero &&
          other.data == this.data &&
          other.valorBruto == this.valorBruto &&
          other.valorIcms == this.valorIcms &&
          other.valorPis == this.valorPis &&
          other.valorCofins == this.valorCofins &&
          other.valorIpi == this.valorIpi &&
          other.valorTotal == this.valorTotal);
}

class VendasCompanion extends UpdateCompanion<Venda> {
  final Value<int> id;
  final Value<int> numero;
  final Value<DateTime> data;
  final Value<double> valorBruto;
  final Value<double> valorIcms;
  final Value<double> valorPis;
  final Value<double> valorCofins;
  final Value<double> valorIpi;
  final Value<double> valorTotal;
  const VendasCompanion({
    this.id = const Value.absent(),
    this.numero = const Value.absent(),
    this.data = const Value.absent(),
    this.valorBruto = const Value.absent(),
    this.valorIcms = const Value.absent(),
    this.valorPis = const Value.absent(),
    this.valorCofins = const Value.absent(),
    this.valorIpi = const Value.absent(),
    this.valorTotal = const Value.absent(),
  });
  VendasCompanion.insert({
    this.id = const Value.absent(),
    required int numero,
    required DateTime data,
    required double valorBruto,
    required double valorIcms,
    required double valorPis,
    required double valorCofins,
    required double valorIpi,
    required double valorTotal,
  }) : numero = Value(numero),
       data = Value(data),
       valorBruto = Value(valorBruto),
       valorIcms = Value(valorIcms),
       valorPis = Value(valorPis),
       valorCofins = Value(valorCofins),
       valorIpi = Value(valorIpi),
       valorTotal = Value(valorTotal);
  static Insertable<Venda> custom({
    Expression<int>? id,
    Expression<int>? numero,
    Expression<DateTime>? data,
    Expression<double>? valorBruto,
    Expression<double>? valorIcms,
    Expression<double>? valorPis,
    Expression<double>? valorCofins,
    Expression<double>? valorIpi,
    Expression<double>? valorTotal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (numero != null) 'numero': numero,
      if (data != null) 'data': data,
      if (valorBruto != null) 'valor_bruto': valorBruto,
      if (valorIcms != null) 'valor_icms': valorIcms,
      if (valorPis != null) 'valor_pis': valorPis,
      if (valorCofins != null) 'valor_cofins': valorCofins,
      if (valorIpi != null) 'valor_ipi': valorIpi,
      if (valorTotal != null) 'valor_total': valorTotal,
    });
  }

  VendasCompanion copyWith({
    Value<int>? id,
    Value<int>? numero,
    Value<DateTime>? data,
    Value<double>? valorBruto,
    Value<double>? valorIcms,
    Value<double>? valorPis,
    Value<double>? valorCofins,
    Value<double>? valorIpi,
    Value<double>? valorTotal,
  }) {
    return VendasCompanion(
      id: id ?? this.id,
      numero: numero ?? this.numero,
      data: data ?? this.data,
      valorBruto: valorBruto ?? this.valorBruto,
      valorIcms: valorIcms ?? this.valorIcms,
      valorPis: valorPis ?? this.valorPis,
      valorCofins: valorCofins ?? this.valorCofins,
      valorIpi: valorIpi ?? this.valorIpi,
      valorTotal: valorTotal ?? this.valorTotal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (numero.present) {
      map['numero'] = Variable<int>(numero.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    if (valorBruto.present) {
      map['valor_bruto'] = Variable<double>(valorBruto.value);
    }
    if (valorIcms.present) {
      map['valor_icms'] = Variable<double>(valorIcms.value);
    }
    if (valorPis.present) {
      map['valor_pis'] = Variable<double>(valorPis.value);
    }
    if (valorCofins.present) {
      map['valor_cofins'] = Variable<double>(valorCofins.value);
    }
    if (valorIpi.present) {
      map['valor_ipi'] = Variable<double>(valorIpi.value);
    }
    if (valorTotal.present) {
      map['valor_total'] = Variable<double>(valorTotal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VendasCompanion(')
          ..write('id: $id, ')
          ..write('numero: $numero, ')
          ..write('data: $data, ')
          ..write('valorBruto: $valorBruto, ')
          ..write('valorIcms: $valorIcms, ')
          ..write('valorPis: $valorPis, ')
          ..write('valorCofins: $valorCofins, ')
          ..write('valorIpi: $valorIpi, ')
          ..write('valorTotal: $valorTotal')
          ..write(')'))
        .toString();
  }
}

class $VendaItensTable extends VendaItens
    with TableInfo<$VendaItensTable, VendaItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VendaItensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _vendaIdMeta = const VerificationMeta(
    'vendaId',
  );
  @override
  late final GeneratedColumn<int> vendaId = GeneratedColumn<int>(
    'venda_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vendas (id)',
    ),
  );
  static const VerificationMeta _produtoIdMeta = const VerificationMeta(
    'produtoId',
  );
  @override
  late final GeneratedColumn<int> produtoId = GeneratedColumn<int>(
    'produto_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES produtos (id)',
    ),
  );
  static const VerificationMeta _sequenciaMeta = const VerificationMeta(
    'sequencia',
  );
  @override
  late final GeneratedColumn<int> sequencia = GeneratedColumn<int>(
    'sequencia',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantidadeMeta = const VerificationMeta(
    'quantidade',
  );
  @override
  late final GeneratedColumn<double> quantidade = GeneratedColumn<double>(
    'quantidade',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precoUnitarioMeta = const VerificationMeta(
    'precoUnitario',
  );
  @override
  late final GeneratedColumn<double> precoUnitario = GeneratedColumn<double>(
    'preco_unitario',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorBrutoMeta = const VerificationMeta(
    'valorBruto',
  );
  @override
  late final GeneratedColumn<double> valorBruto = GeneratedColumn<double>(
    'valor_bruto',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorIcmsMeta = const VerificationMeta(
    'valorIcms',
  );
  @override
  late final GeneratedColumn<double> valorIcms = GeneratedColumn<double>(
    'valor_icms',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorPisMeta = const VerificationMeta(
    'valorPis',
  );
  @override
  late final GeneratedColumn<double> valorPis = GeneratedColumn<double>(
    'valor_pis',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorCofinsMeta = const VerificationMeta(
    'valorCofins',
  );
  @override
  late final GeneratedColumn<double> valorCofins = GeneratedColumn<double>(
    'valor_cofins',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorIpiMeta = const VerificationMeta(
    'valorIpi',
  );
  @override
  late final GeneratedColumn<double> valorIpi = GeneratedColumn<double>(
    'valor_ipi',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorTotalMeta = const VerificationMeta(
    'valorTotal',
  );
  @override
  late final GeneratedColumn<double> valorTotal = GeneratedColumn<double>(
    'valor_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vendaId,
    produtoId,
    sequencia,
    quantidade,
    precoUnitario,
    valorBruto,
    valorIcms,
    valorPis,
    valorCofins,
    valorIpi,
    valorTotal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'venda_itens';
  @override
  VerificationContext validateIntegrity(
    Insertable<VendaItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('venda_id')) {
      context.handle(
        _vendaIdMeta,
        vendaId.isAcceptableOrUnknown(data['venda_id']!, _vendaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vendaIdMeta);
    }
    if (data.containsKey('produto_id')) {
      context.handle(
        _produtoIdMeta,
        produtoId.isAcceptableOrUnknown(data['produto_id']!, _produtoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_produtoIdMeta);
    }
    if (data.containsKey('sequencia')) {
      context.handle(
        _sequenciaMeta,
        sequencia.isAcceptableOrUnknown(data['sequencia']!, _sequenciaMeta),
      );
    } else if (isInserting) {
      context.missing(_sequenciaMeta);
    }
    if (data.containsKey('quantidade')) {
      context.handle(
        _quantidadeMeta,
        quantidade.isAcceptableOrUnknown(data['quantidade']!, _quantidadeMeta),
      );
    } else if (isInserting) {
      context.missing(_quantidadeMeta);
    }
    if (data.containsKey('preco_unitario')) {
      context.handle(
        _precoUnitarioMeta,
        precoUnitario.isAcceptableOrUnknown(
          data['preco_unitario']!,
          _precoUnitarioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precoUnitarioMeta);
    }
    if (data.containsKey('valor_bruto')) {
      context.handle(
        _valorBrutoMeta,
        valorBruto.isAcceptableOrUnknown(data['valor_bruto']!, _valorBrutoMeta),
      );
    } else if (isInserting) {
      context.missing(_valorBrutoMeta);
    }
    if (data.containsKey('valor_icms')) {
      context.handle(
        _valorIcmsMeta,
        valorIcms.isAcceptableOrUnknown(data['valor_icms']!, _valorIcmsMeta),
      );
    } else if (isInserting) {
      context.missing(_valorIcmsMeta);
    }
    if (data.containsKey('valor_pis')) {
      context.handle(
        _valorPisMeta,
        valorPis.isAcceptableOrUnknown(data['valor_pis']!, _valorPisMeta),
      );
    } else if (isInserting) {
      context.missing(_valorPisMeta);
    }
    if (data.containsKey('valor_cofins')) {
      context.handle(
        _valorCofinsMeta,
        valorCofins.isAcceptableOrUnknown(
          data['valor_cofins']!,
          _valorCofinsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_valorCofinsMeta);
    }
    if (data.containsKey('valor_ipi')) {
      context.handle(
        _valorIpiMeta,
        valorIpi.isAcceptableOrUnknown(data['valor_ipi']!, _valorIpiMeta),
      );
    } else if (isInserting) {
      context.missing(_valorIpiMeta);
    }
    if (data.containsKey('valor_total')) {
      context.handle(
        _valorTotalMeta,
        valorTotal.isAcceptableOrUnknown(data['valor_total']!, _valorTotalMeta),
      );
    } else if (isInserting) {
      context.missing(_valorTotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VendaItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VendaItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      vendaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}venda_id'],
      )!,
      produtoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}produto_id'],
      )!,
      sequencia: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sequencia'],
      )!,
      quantidade: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantidade'],
      )!,
      precoUnitario: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}preco_unitario'],
      )!,
      valorBruto: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_bruto'],
      )!,
      valorIcms: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_icms'],
      )!,
      valorPis: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_pis'],
      )!,
      valorCofins: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_cofins'],
      )!,
      valorIpi: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_ipi'],
      )!,
      valorTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_total'],
      )!,
    );
  }

  @override
  $VendaItensTable createAlias(String alias) {
    return $VendaItensTable(attachedDatabase, alias);
  }
}

class VendaItem extends DataClass implements Insertable<VendaItem> {
  final int id;
  final int vendaId;
  final int produtoId;
  final int sequencia;
  final double quantidade;
  final double precoUnitario;
  final double valorBruto;
  final double valorIcms;
  final double valorPis;
  final double valorCofins;
  final double valorIpi;
  final double valorTotal;
  const VendaItem({
    required this.id,
    required this.vendaId,
    required this.produtoId,
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['venda_id'] = Variable<int>(vendaId);
    map['produto_id'] = Variable<int>(produtoId);
    map['sequencia'] = Variable<int>(sequencia);
    map['quantidade'] = Variable<double>(quantidade);
    map['preco_unitario'] = Variable<double>(precoUnitario);
    map['valor_bruto'] = Variable<double>(valorBruto);
    map['valor_icms'] = Variable<double>(valorIcms);
    map['valor_pis'] = Variable<double>(valorPis);
    map['valor_cofins'] = Variable<double>(valorCofins);
    map['valor_ipi'] = Variable<double>(valorIpi);
    map['valor_total'] = Variable<double>(valorTotal);
    return map;
  }

  VendaItensCompanion toCompanion(bool nullToAbsent) {
    return VendaItensCompanion(
      id: Value(id),
      vendaId: Value(vendaId),
      produtoId: Value(produtoId),
      sequencia: Value(sequencia),
      quantidade: Value(quantidade),
      precoUnitario: Value(precoUnitario),
      valorBruto: Value(valorBruto),
      valorIcms: Value(valorIcms),
      valorPis: Value(valorPis),
      valorCofins: Value(valorCofins),
      valorIpi: Value(valorIpi),
      valorTotal: Value(valorTotal),
    );
  }

  factory VendaItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VendaItem(
      id: serializer.fromJson<int>(json['id']),
      vendaId: serializer.fromJson<int>(json['vendaId']),
      produtoId: serializer.fromJson<int>(json['produtoId']),
      sequencia: serializer.fromJson<int>(json['sequencia']),
      quantidade: serializer.fromJson<double>(json['quantidade']),
      precoUnitario: serializer.fromJson<double>(json['precoUnitario']),
      valorBruto: serializer.fromJson<double>(json['valorBruto']),
      valorIcms: serializer.fromJson<double>(json['valorIcms']),
      valorPis: serializer.fromJson<double>(json['valorPis']),
      valorCofins: serializer.fromJson<double>(json['valorCofins']),
      valorIpi: serializer.fromJson<double>(json['valorIpi']),
      valorTotal: serializer.fromJson<double>(json['valorTotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vendaId': serializer.toJson<int>(vendaId),
      'produtoId': serializer.toJson<int>(produtoId),
      'sequencia': serializer.toJson<int>(sequencia),
      'quantidade': serializer.toJson<double>(quantidade),
      'precoUnitario': serializer.toJson<double>(precoUnitario),
      'valorBruto': serializer.toJson<double>(valorBruto),
      'valorIcms': serializer.toJson<double>(valorIcms),
      'valorPis': serializer.toJson<double>(valorPis),
      'valorCofins': serializer.toJson<double>(valorCofins),
      'valorIpi': serializer.toJson<double>(valorIpi),
      'valorTotal': serializer.toJson<double>(valorTotal),
    };
  }

  VendaItem copyWith({
    int? id,
    int? vendaId,
    int? produtoId,
    int? sequencia,
    double? quantidade,
    double? precoUnitario,
    double? valorBruto,
    double? valorIcms,
    double? valorPis,
    double? valorCofins,
    double? valorIpi,
    double? valorTotal,
  }) => VendaItem(
    id: id ?? this.id,
    vendaId: vendaId ?? this.vendaId,
    produtoId: produtoId ?? this.produtoId,
    sequencia: sequencia ?? this.sequencia,
    quantidade: quantidade ?? this.quantidade,
    precoUnitario: precoUnitario ?? this.precoUnitario,
    valorBruto: valorBruto ?? this.valorBruto,
    valorIcms: valorIcms ?? this.valorIcms,
    valorPis: valorPis ?? this.valorPis,
    valorCofins: valorCofins ?? this.valorCofins,
    valorIpi: valorIpi ?? this.valorIpi,
    valorTotal: valorTotal ?? this.valorTotal,
  );
  VendaItem copyWithCompanion(VendaItensCompanion data) {
    return VendaItem(
      id: data.id.present ? data.id.value : this.id,
      vendaId: data.vendaId.present ? data.vendaId.value : this.vendaId,
      produtoId: data.produtoId.present ? data.produtoId.value : this.produtoId,
      sequencia: data.sequencia.present ? data.sequencia.value : this.sequencia,
      quantidade: data.quantidade.present
          ? data.quantidade.value
          : this.quantidade,
      precoUnitario: data.precoUnitario.present
          ? data.precoUnitario.value
          : this.precoUnitario,
      valorBruto: data.valorBruto.present
          ? data.valorBruto.value
          : this.valorBruto,
      valorIcms: data.valorIcms.present ? data.valorIcms.value : this.valorIcms,
      valorPis: data.valorPis.present ? data.valorPis.value : this.valorPis,
      valorCofins: data.valorCofins.present
          ? data.valorCofins.value
          : this.valorCofins,
      valorIpi: data.valorIpi.present ? data.valorIpi.value : this.valorIpi,
      valorTotal: data.valorTotal.present
          ? data.valorTotal.value
          : this.valorTotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VendaItem(')
          ..write('id: $id, ')
          ..write('vendaId: $vendaId, ')
          ..write('produtoId: $produtoId, ')
          ..write('sequencia: $sequencia, ')
          ..write('quantidade: $quantidade, ')
          ..write('precoUnitario: $precoUnitario, ')
          ..write('valorBruto: $valorBruto, ')
          ..write('valorIcms: $valorIcms, ')
          ..write('valorPis: $valorPis, ')
          ..write('valorCofins: $valorCofins, ')
          ..write('valorIpi: $valorIpi, ')
          ..write('valorTotal: $valorTotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vendaId,
    produtoId,
    sequencia,
    quantidade,
    precoUnitario,
    valorBruto,
    valorIcms,
    valorPis,
    valorCofins,
    valorIpi,
    valorTotal,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VendaItem &&
          other.id == this.id &&
          other.vendaId == this.vendaId &&
          other.produtoId == this.produtoId &&
          other.sequencia == this.sequencia &&
          other.quantidade == this.quantidade &&
          other.precoUnitario == this.precoUnitario &&
          other.valorBruto == this.valorBruto &&
          other.valorIcms == this.valorIcms &&
          other.valorPis == this.valorPis &&
          other.valorCofins == this.valorCofins &&
          other.valorIpi == this.valorIpi &&
          other.valorTotal == this.valorTotal);
}

class VendaItensCompanion extends UpdateCompanion<VendaItem> {
  final Value<int> id;
  final Value<int> vendaId;
  final Value<int> produtoId;
  final Value<int> sequencia;
  final Value<double> quantidade;
  final Value<double> precoUnitario;
  final Value<double> valorBruto;
  final Value<double> valorIcms;
  final Value<double> valorPis;
  final Value<double> valorCofins;
  final Value<double> valorIpi;
  final Value<double> valorTotal;
  const VendaItensCompanion({
    this.id = const Value.absent(),
    this.vendaId = const Value.absent(),
    this.produtoId = const Value.absent(),
    this.sequencia = const Value.absent(),
    this.quantidade = const Value.absent(),
    this.precoUnitario = const Value.absent(),
    this.valorBruto = const Value.absent(),
    this.valorIcms = const Value.absent(),
    this.valorPis = const Value.absent(),
    this.valorCofins = const Value.absent(),
    this.valorIpi = const Value.absent(),
    this.valorTotal = const Value.absent(),
  });
  VendaItensCompanion.insert({
    this.id = const Value.absent(),
    required int vendaId,
    required int produtoId,
    required int sequencia,
    required double quantidade,
    required double precoUnitario,
    required double valorBruto,
    required double valorIcms,
    required double valorPis,
    required double valorCofins,
    required double valorIpi,
    required double valorTotal,
  }) : vendaId = Value(vendaId),
       produtoId = Value(produtoId),
       sequencia = Value(sequencia),
       quantidade = Value(quantidade),
       precoUnitario = Value(precoUnitario),
       valorBruto = Value(valorBruto),
       valorIcms = Value(valorIcms),
       valorPis = Value(valorPis),
       valorCofins = Value(valorCofins),
       valorIpi = Value(valorIpi),
       valorTotal = Value(valorTotal);
  static Insertable<VendaItem> custom({
    Expression<int>? id,
    Expression<int>? vendaId,
    Expression<int>? produtoId,
    Expression<int>? sequencia,
    Expression<double>? quantidade,
    Expression<double>? precoUnitario,
    Expression<double>? valorBruto,
    Expression<double>? valorIcms,
    Expression<double>? valorPis,
    Expression<double>? valorCofins,
    Expression<double>? valorIpi,
    Expression<double>? valorTotal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vendaId != null) 'venda_id': vendaId,
      if (produtoId != null) 'produto_id': produtoId,
      if (sequencia != null) 'sequencia': sequencia,
      if (quantidade != null) 'quantidade': quantidade,
      if (precoUnitario != null) 'preco_unitario': precoUnitario,
      if (valorBruto != null) 'valor_bruto': valorBruto,
      if (valorIcms != null) 'valor_icms': valorIcms,
      if (valorPis != null) 'valor_pis': valorPis,
      if (valorCofins != null) 'valor_cofins': valorCofins,
      if (valorIpi != null) 'valor_ipi': valorIpi,
      if (valorTotal != null) 'valor_total': valorTotal,
    });
  }

  VendaItensCompanion copyWith({
    Value<int>? id,
    Value<int>? vendaId,
    Value<int>? produtoId,
    Value<int>? sequencia,
    Value<double>? quantidade,
    Value<double>? precoUnitario,
    Value<double>? valorBruto,
    Value<double>? valorIcms,
    Value<double>? valorPis,
    Value<double>? valorCofins,
    Value<double>? valorIpi,
    Value<double>? valorTotal,
  }) {
    return VendaItensCompanion(
      id: id ?? this.id,
      vendaId: vendaId ?? this.vendaId,
      produtoId: produtoId ?? this.produtoId,
      sequencia: sequencia ?? this.sequencia,
      quantidade: quantidade ?? this.quantidade,
      precoUnitario: precoUnitario ?? this.precoUnitario,
      valorBruto: valorBruto ?? this.valorBruto,
      valorIcms: valorIcms ?? this.valorIcms,
      valorPis: valorPis ?? this.valorPis,
      valorCofins: valorCofins ?? this.valorCofins,
      valorIpi: valorIpi ?? this.valorIpi,
      valorTotal: valorTotal ?? this.valorTotal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vendaId.present) {
      map['venda_id'] = Variable<int>(vendaId.value);
    }
    if (produtoId.present) {
      map['produto_id'] = Variable<int>(produtoId.value);
    }
    if (sequencia.present) {
      map['sequencia'] = Variable<int>(sequencia.value);
    }
    if (quantidade.present) {
      map['quantidade'] = Variable<double>(quantidade.value);
    }
    if (precoUnitario.present) {
      map['preco_unitario'] = Variable<double>(precoUnitario.value);
    }
    if (valorBruto.present) {
      map['valor_bruto'] = Variable<double>(valorBruto.value);
    }
    if (valorIcms.present) {
      map['valor_icms'] = Variable<double>(valorIcms.value);
    }
    if (valorPis.present) {
      map['valor_pis'] = Variable<double>(valorPis.value);
    }
    if (valorCofins.present) {
      map['valor_cofins'] = Variable<double>(valorCofins.value);
    }
    if (valorIpi.present) {
      map['valor_ipi'] = Variable<double>(valorIpi.value);
    }
    if (valorTotal.present) {
      map['valor_total'] = Variable<double>(valorTotal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VendaItensCompanion(')
          ..write('id: $id, ')
          ..write('vendaId: $vendaId, ')
          ..write('produtoId: $produtoId, ')
          ..write('sequencia: $sequencia, ')
          ..write('quantidade: $quantidade, ')
          ..write('precoUnitario: $precoUnitario, ')
          ..write('valorBruto: $valorBruto, ')
          ..write('valorIcms: $valorIcms, ')
          ..write('valorPis: $valorPis, ')
          ..write('valorCofins: $valorCofins, ')
          ..write('valorIpi: $valorIpi, ')
          ..write('valorTotal: $valorTotal')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ImpostosTable impostos = $ImpostosTable(this);
  late final $ProdutosTable produtos = $ProdutosTable(this);
  late final $CodigosBarrasTable codigosBarras = $CodigosBarrasTable(this);
  late final $VendasTable vendas = $VendasTable(this);
  late final $VendaItensTable vendaItens = $VendaItensTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    impostos,
    produtos,
    codigosBarras,
    vendas,
    vendaItens,
  ];
}

typedef $$ImpostosTableCreateCompanionBuilder =
    ImpostosCompanion Function({
      Value<int> id,
      required double icms,
      required double pis,
      required double cofins,
      required double ipi,
    });
typedef $$ImpostosTableUpdateCompanionBuilder =
    ImpostosCompanion Function({
      Value<int> id,
      Value<double> icms,
      Value<double> pis,
      Value<double> cofins,
      Value<double> ipi,
    });

final class $$ImpostosTableReferences
    extends BaseReferences<_$AppDatabase, $ImpostosTable, Imposto> {
  $$ImpostosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProdutosTable, List<Produto>> _produtosRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.produtos,
    aliasName: 'impostos__id__produtos__imposto_id',
  );

  $$ProdutosTableProcessedTableManager get produtosRefs {
    final manager = $$ProdutosTableTableManager(
      $_db,
      $_db.produtos,
    ).filter((f) => f.impostoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_produtosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ImpostosTableFilterComposer
    extends Composer<_$AppDatabase, $ImpostosTable> {
  $$ImpostosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get icms => $composableBuilder(
    column: $table.icms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pis => $composableBuilder(
    column: $table.pis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cofins => $composableBuilder(
    column: $table.cofins,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ipi => $composableBuilder(
    column: $table.ipi,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> produtosRefs(
    Expression<bool> Function($$ProdutosTableFilterComposer f) f,
  ) {
    final $$ProdutosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.produtos,
      getReferencedColumn: (t) => t.impostoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdutosTableFilterComposer(
            $db: $db,
            $table: $db.produtos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ImpostosTableOrderingComposer
    extends Composer<_$AppDatabase, $ImpostosTable> {
  $$ImpostosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get icms => $composableBuilder(
    column: $table.icms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pis => $composableBuilder(
    column: $table.pis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cofins => $composableBuilder(
    column: $table.cofins,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ipi => $composableBuilder(
    column: $table.ipi,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ImpostosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImpostosTable> {
  $$ImpostosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get icms =>
      $composableBuilder(column: $table.icms, builder: (column) => column);

  GeneratedColumn<double> get pis =>
      $composableBuilder(column: $table.pis, builder: (column) => column);

  GeneratedColumn<double> get cofins =>
      $composableBuilder(column: $table.cofins, builder: (column) => column);

  GeneratedColumn<double> get ipi =>
      $composableBuilder(column: $table.ipi, builder: (column) => column);

  Expression<T> produtosRefs<T extends Object>(
    Expression<T> Function($$ProdutosTableAnnotationComposer a) f,
  ) {
    final $$ProdutosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.produtos,
      getReferencedColumn: (t) => t.impostoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdutosTableAnnotationComposer(
            $db: $db,
            $table: $db.produtos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ImpostosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ImpostosTable,
          Imposto,
          $$ImpostosTableFilterComposer,
          $$ImpostosTableOrderingComposer,
          $$ImpostosTableAnnotationComposer,
          $$ImpostosTableCreateCompanionBuilder,
          $$ImpostosTableUpdateCompanionBuilder,
          (Imposto, $$ImpostosTableReferences),
          Imposto,
          PrefetchHooks Function({bool produtosRefs})
        > {
  $$ImpostosTableTableManager(_$AppDatabase db, $ImpostosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImpostosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImpostosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImpostosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> icms = const Value.absent(),
                Value<double> pis = const Value.absent(),
                Value<double> cofins = const Value.absent(),
                Value<double> ipi = const Value.absent(),
              }) => ImpostosCompanion(
                id: id,
                icms: icms,
                pis: pis,
                cofins: cofins,
                ipi: ipi,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double icms,
                required double pis,
                required double cofins,
                required double ipi,
              }) => ImpostosCompanion.insert(
                id: id,
                icms: icms,
                pis: pis,
                cofins: cofins,
                ipi: ipi,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ImpostosTable, Imposto>(table),
                  $$ImpostosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({produtosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (produtosRefs) db.produtos],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (produtosRefs)
                    await $_getPrefetchedDataByColumns<
                      Imposto,
                      $ImpostosTable,
                      Produto,
                      $ProdutosTable
                    >(
                      currentTable: table,
                      referencedTable: $$ImpostosTableReferences
                          ._produtosRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ImpostosTableReferences(db, table, p0).produtosRefs,
                      currentColumn: 'id',
                      referencedColumn: 'imposto_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ImpostosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ImpostosTable,
      Imposto,
      $$ImpostosTableFilterComposer,
      $$ImpostosTableOrderingComposer,
      $$ImpostosTableAnnotationComposer,
      $$ImpostosTableCreateCompanionBuilder,
      $$ImpostosTableUpdateCompanionBuilder,
      (Imposto, $$ImpostosTableReferences),
      Imposto,
      PrefetchHooks Function({bool produtosRefs})
    >;
typedef $$ProdutosTableCreateCompanionBuilder =
    ProdutosCompanion Function({
      Value<int> id,
      required int codigo,
      required String descricao,
      required double preco,
      required int impostoId,
    });
typedef $$ProdutosTableUpdateCompanionBuilder =
    ProdutosCompanion Function({
      Value<int> id,
      Value<int> codigo,
      Value<String> descricao,
      Value<double> preco,
      Value<int> impostoId,
    });

final class $$ProdutosTableReferences
    extends BaseReferences<_$AppDatabase, $ProdutosTable, Produto> {
  $$ProdutosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ImpostosTable _impostoIdTable(_$AppDatabase db) =>
      db.impostos.createAlias('produtos__imposto_id__impostos__id');

  $$ImpostosTableProcessedTableManager get impostoId {
    final $_column = $_itemColumn<int>('imposto_id')!;

    final manager = $$ImpostosTableTableManager(
      $_db,
      $_db.impostos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_impostoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CodigosBarrasTable, List<CodigoBarras>>
  _codigosBarrasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.codigosBarras,
    aliasName: 'produtos__id__codigos_barras__produto_id',
  );

  $$CodigosBarrasTableProcessedTableManager get codigosBarrasRefs {
    final manager = $$CodigosBarrasTableTableManager(
      $_db,
      $_db.codigosBarras,
    ).filter((f) => f.produtoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_codigosBarrasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VendaItensTable, List<VendaItem>>
  _vendaItensRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vendaItens,
    aliasName: 'produtos__id__venda_itens__produto_id',
  );

  $$VendaItensTableProcessedTableManager get vendaItensRefs {
    final manager = $$VendaItensTableTableManager(
      $_db,
      $_db.vendaItens,
    ).filter((f) => f.produtoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_vendaItensRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProdutosTableFilterComposer
    extends Composer<_$AppDatabase, $ProdutosTable> {
  $$ProdutosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get codigo => $composableBuilder(
    column: $table.codigo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descricao => $composableBuilder(
    column: $table.descricao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get preco => $composableBuilder(
    column: $table.preco,
    builder: (column) => ColumnFilters(column),
  );

  $$ImpostosTableFilterComposer get impostoId {
    final $$ImpostosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.impostoId,
      referencedTable: $db.impostos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImpostosTableFilterComposer(
            $db: $db,
            $table: $db.impostos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> codigosBarrasRefs(
    Expression<bool> Function($$CodigosBarrasTableFilterComposer f) f,
  ) {
    final $$CodigosBarrasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.codigosBarras,
      getReferencedColumn: (t) => t.produtoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodigosBarrasTableFilterComposer(
            $db: $db,
            $table: $db.codigosBarras,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> vendaItensRefs(
    Expression<bool> Function($$VendaItensTableFilterComposer f) f,
  ) {
    final $$VendaItensTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vendaItens,
      getReferencedColumn: (t) => t.produtoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendaItensTableFilterComposer(
            $db: $db,
            $table: $db.vendaItens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProdutosTableOrderingComposer
    extends Composer<_$AppDatabase, $ProdutosTable> {
  $$ProdutosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get codigo => $composableBuilder(
    column: $table.codigo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descricao => $composableBuilder(
    column: $table.descricao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get preco => $composableBuilder(
    column: $table.preco,
    builder: (column) => ColumnOrderings(column),
  );

  $$ImpostosTableOrderingComposer get impostoId {
    final $$ImpostosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.impostoId,
      referencedTable: $db.impostos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImpostosTableOrderingComposer(
            $db: $db,
            $table: $db.impostos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProdutosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProdutosTable> {
  $$ProdutosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get codigo =>
      $composableBuilder(column: $table.codigo, builder: (column) => column);

  GeneratedColumn<String> get descricao =>
      $composableBuilder(column: $table.descricao, builder: (column) => column);

  GeneratedColumn<double> get preco =>
      $composableBuilder(column: $table.preco, builder: (column) => column);

  $$ImpostosTableAnnotationComposer get impostoId {
    final $$ImpostosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.impostoId,
      referencedTable: $db.impostos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImpostosTableAnnotationComposer(
            $db: $db,
            $table: $db.impostos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> codigosBarrasRefs<T extends Object>(
    Expression<T> Function($$CodigosBarrasTableAnnotationComposer a) f,
  ) {
    final $$CodigosBarrasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.codigosBarras,
      getReferencedColumn: (t) => t.produtoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodigosBarrasTableAnnotationComposer(
            $db: $db,
            $table: $db.codigosBarras,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> vendaItensRefs<T extends Object>(
    Expression<T> Function($$VendaItensTableAnnotationComposer a) f,
  ) {
    final $$VendaItensTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vendaItens,
      getReferencedColumn: (t) => t.produtoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendaItensTableAnnotationComposer(
            $db: $db,
            $table: $db.vendaItens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProdutosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProdutosTable,
          Produto,
          $$ProdutosTableFilterComposer,
          $$ProdutosTableOrderingComposer,
          $$ProdutosTableAnnotationComposer,
          $$ProdutosTableCreateCompanionBuilder,
          $$ProdutosTableUpdateCompanionBuilder,
          (Produto, $$ProdutosTableReferences),
          Produto,
          PrefetchHooks Function({
            bool impostoId,
            bool codigosBarrasRefs,
            bool vendaItensRefs,
          })
        > {
  $$ProdutosTableTableManager(_$AppDatabase db, $ProdutosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProdutosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProdutosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProdutosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> codigo = const Value.absent(),
                Value<String> descricao = const Value.absent(),
                Value<double> preco = const Value.absent(),
                Value<int> impostoId = const Value.absent(),
              }) => ProdutosCompanion(
                id: id,
                codigo: codigo,
                descricao: descricao,
                preco: preco,
                impostoId: impostoId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int codigo,
                required String descricao,
                required double preco,
                required int impostoId,
              }) => ProdutosCompanion.insert(
                id: id,
                codigo: codigo,
                descricao: descricao,
                preco: preco,
                impostoId: impostoId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProdutosTable, Produto>(table),
                  $$ProdutosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                impostoId = false,
                codigosBarrasRefs = false,
                vendaItensRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (codigosBarrasRefs) db.codigosBarras,
                    if (vendaItensRefs) db.vendaItens,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (impostoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.impostoId,
                                    referencedTable: $$ProdutosTableReferences
                                        ._impostoIdTable(db),
                                    referencedColumn: $$ProdutosTableReferences
                                        ._impostoIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (codigosBarrasRefs)
                        await $_getPrefetchedDataByColumns<
                          Produto,
                          $ProdutosTable,
                          CodigoBarras,
                          $CodigosBarrasTable
                        >(
                          currentTable: table,
                          referencedTable: $$ProdutosTableReferences
                              ._codigosBarrasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProdutosTableReferences(
                                db,
                                table,
                                p0,
                              ).codigosBarrasRefs,
                          currentColumn: 'id',
                          referencedColumn: 'produto_id',
                          typedResults: items,
                        ),
                      if (vendaItensRefs)
                        await $_getPrefetchedDataByColumns<
                          Produto,
                          $ProdutosTable,
                          VendaItem,
                          $VendaItensTable
                        >(
                          currentTable: table,
                          referencedTable: $$ProdutosTableReferences
                              ._vendaItensRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProdutosTableReferences(
                                db,
                                table,
                                p0,
                              ).vendaItensRefs,
                          currentColumn: 'id',
                          referencedColumn: 'produto_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProdutosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProdutosTable,
      Produto,
      $$ProdutosTableFilterComposer,
      $$ProdutosTableOrderingComposer,
      $$ProdutosTableAnnotationComposer,
      $$ProdutosTableCreateCompanionBuilder,
      $$ProdutosTableUpdateCompanionBuilder,
      (Produto, $$ProdutosTableReferences),
      Produto,
      PrefetchHooks Function({
        bool impostoId,
        bool codigosBarrasRefs,
        bool vendaItensRefs,
      })
    >;
typedef $$CodigosBarrasTableCreateCompanionBuilder =
    CodigosBarrasCompanion Function({
      Value<int> id,
      required String codigo,
      required int produtoId,
    });
typedef $$CodigosBarrasTableUpdateCompanionBuilder =
    CodigosBarrasCompanion Function({
      Value<int> id,
      Value<String> codigo,
      Value<int> produtoId,
    });

final class $$CodigosBarrasTableReferences
    extends BaseReferences<_$AppDatabase, $CodigosBarrasTable, CodigoBarras> {
  $$CodigosBarrasTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProdutosTable _produtoIdTable(_$AppDatabase db) =>
      db.produtos.createAlias('codigos_barras__produto_id__produtos__id');

  $$ProdutosTableProcessedTableManager get produtoId {
    final $_column = $_itemColumn<int>('produto_id')!;

    final manager = $$ProdutosTableTableManager(
      $_db,
      $_db.produtos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_produtoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CodigosBarrasTableFilterComposer
    extends Composer<_$AppDatabase, $CodigosBarrasTable> {
  $$CodigosBarrasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codigo => $composableBuilder(
    column: $table.codigo,
    builder: (column) => ColumnFilters(column),
  );

  $$ProdutosTableFilterComposer get produtoId {
    final $$ProdutosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.produtoId,
      referencedTable: $db.produtos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdutosTableFilterComposer(
            $db: $db,
            $table: $db.produtos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CodigosBarrasTableOrderingComposer
    extends Composer<_$AppDatabase, $CodigosBarrasTable> {
  $$CodigosBarrasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codigo => $composableBuilder(
    column: $table.codigo,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProdutosTableOrderingComposer get produtoId {
    final $$ProdutosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.produtoId,
      referencedTable: $db.produtos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdutosTableOrderingComposer(
            $db: $db,
            $table: $db.produtos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CodigosBarrasTableAnnotationComposer
    extends Composer<_$AppDatabase, $CodigosBarrasTable> {
  $$CodigosBarrasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get codigo =>
      $composableBuilder(column: $table.codigo, builder: (column) => column);

  $$ProdutosTableAnnotationComposer get produtoId {
    final $$ProdutosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.produtoId,
      referencedTable: $db.produtos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdutosTableAnnotationComposer(
            $db: $db,
            $table: $db.produtos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CodigosBarrasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CodigosBarrasTable,
          CodigoBarras,
          $$CodigosBarrasTableFilterComposer,
          $$CodigosBarrasTableOrderingComposer,
          $$CodigosBarrasTableAnnotationComposer,
          $$CodigosBarrasTableCreateCompanionBuilder,
          $$CodigosBarrasTableUpdateCompanionBuilder,
          (CodigoBarras, $$CodigosBarrasTableReferences),
          CodigoBarras,
          PrefetchHooks Function({bool produtoId})
        > {
  $$CodigosBarrasTableTableManager(_$AppDatabase db, $CodigosBarrasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CodigosBarrasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CodigosBarrasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CodigosBarrasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> codigo = const Value.absent(),
                Value<int> produtoId = const Value.absent(),
              }) => CodigosBarrasCompanion(
                id: id,
                codigo: codigo,
                produtoId: produtoId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String codigo,
                required int produtoId,
              }) => CodigosBarrasCompanion.insert(
                id: id,
                codigo: codigo,
                produtoId: produtoId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CodigosBarrasTable, CodigoBarras>(table),
                  $$CodigosBarrasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({produtoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (produtoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.produtoId,
                                referencedTable: $$CodigosBarrasTableReferences
                                    ._produtoIdTable(db),
                                referencedColumn: $$CodigosBarrasTableReferences
                                    ._produtoIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CodigosBarrasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CodigosBarrasTable,
      CodigoBarras,
      $$CodigosBarrasTableFilterComposer,
      $$CodigosBarrasTableOrderingComposer,
      $$CodigosBarrasTableAnnotationComposer,
      $$CodigosBarrasTableCreateCompanionBuilder,
      $$CodigosBarrasTableUpdateCompanionBuilder,
      (CodigoBarras, $$CodigosBarrasTableReferences),
      CodigoBarras,
      PrefetchHooks Function({bool produtoId})
    >;
typedef $$VendasTableCreateCompanionBuilder =
    VendasCompanion Function({
      Value<int> id,
      required int numero,
      required DateTime data,
      required double valorBruto,
      required double valorIcms,
      required double valorPis,
      required double valorCofins,
      required double valorIpi,
      required double valorTotal,
    });
typedef $$VendasTableUpdateCompanionBuilder =
    VendasCompanion Function({
      Value<int> id,
      Value<int> numero,
      Value<DateTime> data,
      Value<double> valorBruto,
      Value<double> valorIcms,
      Value<double> valorPis,
      Value<double> valorCofins,
      Value<double> valorIpi,
      Value<double> valorTotal,
    });

final class $$VendasTableReferences
    extends BaseReferences<_$AppDatabase, $VendasTable, Venda> {
  $$VendasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VendaItensTable, List<VendaItem>>
  _vendaItensRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vendaItens,
    aliasName: 'vendas__id__venda_itens__venda_id',
  );

  $$VendaItensTableProcessedTableManager get vendaItensRefs {
    final manager = $$VendaItensTableTableManager(
      $_db,
      $_db.vendaItens,
    ).filter((f) => f.vendaId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_vendaItensRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VendasTableFilterComposer
    extends Composer<_$AppDatabase, $VendasTable> {
  $$VendasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorBruto => $composableBuilder(
    column: $table.valorBruto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorIcms => $composableBuilder(
    column: $table.valorIcms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorPis => $composableBuilder(
    column: $table.valorPis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorCofins => $composableBuilder(
    column: $table.valorCofins,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorIpi => $composableBuilder(
    column: $table.valorIpi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorTotal => $composableBuilder(
    column: $table.valorTotal,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> vendaItensRefs(
    Expression<bool> Function($$VendaItensTableFilterComposer f) f,
  ) {
    final $$VendaItensTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vendaItens,
      getReferencedColumn: (t) => t.vendaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendaItensTableFilterComposer(
            $db: $db,
            $table: $db.vendaItens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VendasTableOrderingComposer
    extends Composer<_$AppDatabase, $VendasTable> {
  $$VendasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorBruto => $composableBuilder(
    column: $table.valorBruto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorIcms => $composableBuilder(
    column: $table.valorIcms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorPis => $composableBuilder(
    column: $table.valorPis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorCofins => $composableBuilder(
    column: $table.valorCofins,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorIpi => $composableBuilder(
    column: $table.valorIpi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorTotal => $composableBuilder(
    column: $table.valorTotal,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VendasTableAnnotationComposer
    extends Composer<_$AppDatabase, $VendasTable> {
  $$VendasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  GeneratedColumn<DateTime> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<double> get valorBruto => $composableBuilder(
    column: $table.valorBruto,
    builder: (column) => column,
  );

  GeneratedColumn<double> get valorIcms =>
      $composableBuilder(column: $table.valorIcms, builder: (column) => column);

  GeneratedColumn<double> get valorPis =>
      $composableBuilder(column: $table.valorPis, builder: (column) => column);

  GeneratedColumn<double> get valorCofins => $composableBuilder(
    column: $table.valorCofins,
    builder: (column) => column,
  );

  GeneratedColumn<double> get valorIpi =>
      $composableBuilder(column: $table.valorIpi, builder: (column) => column);

  GeneratedColumn<double> get valorTotal => $composableBuilder(
    column: $table.valorTotal,
    builder: (column) => column,
  );

  Expression<T> vendaItensRefs<T extends Object>(
    Expression<T> Function($$VendaItensTableAnnotationComposer a) f,
  ) {
    final $$VendaItensTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vendaItens,
      getReferencedColumn: (t) => t.vendaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendaItensTableAnnotationComposer(
            $db: $db,
            $table: $db.vendaItens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VendasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VendasTable,
          Venda,
          $$VendasTableFilterComposer,
          $$VendasTableOrderingComposer,
          $$VendasTableAnnotationComposer,
          $$VendasTableCreateCompanionBuilder,
          $$VendasTableUpdateCompanionBuilder,
          (Venda, $$VendasTableReferences),
          Venda,
          PrefetchHooks Function({bool vendaItensRefs})
        > {
  $$VendasTableTableManager(_$AppDatabase db, $VendasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VendasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VendasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VendasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> numero = const Value.absent(),
                Value<DateTime> data = const Value.absent(),
                Value<double> valorBruto = const Value.absent(),
                Value<double> valorIcms = const Value.absent(),
                Value<double> valorPis = const Value.absent(),
                Value<double> valorCofins = const Value.absent(),
                Value<double> valorIpi = const Value.absent(),
                Value<double> valorTotal = const Value.absent(),
              }) => VendasCompanion(
                id: id,
                numero: numero,
                data: data,
                valorBruto: valorBruto,
                valorIcms: valorIcms,
                valorPis: valorPis,
                valorCofins: valorCofins,
                valorIpi: valorIpi,
                valorTotal: valorTotal,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int numero,
                required DateTime data,
                required double valorBruto,
                required double valorIcms,
                required double valorPis,
                required double valorCofins,
                required double valorIpi,
                required double valorTotal,
              }) => VendasCompanion.insert(
                id: id,
                numero: numero,
                data: data,
                valorBruto: valorBruto,
                valorIcms: valorIcms,
                valorPis: valorPis,
                valorCofins: valorCofins,
                valorIpi: valorIpi,
                valorTotal: valorTotal,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$VendasTable, Venda>(table),
                  $$VendasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({vendaItensRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (vendaItensRefs) db.vendaItens],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (vendaItensRefs)
                    await $_getPrefetchedDataByColumns<
                      Venda,
                      $VendasTable,
                      VendaItem,
                      $VendaItensTable
                    >(
                      currentTable: table,
                      referencedTable: $$VendasTableReferences
                          ._vendaItensRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$VendasTableReferences(db, table, p0).vendaItensRefs,
                      currentColumn: 'id',
                      referencedColumn: 'venda_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$VendasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VendasTable,
      Venda,
      $$VendasTableFilterComposer,
      $$VendasTableOrderingComposer,
      $$VendasTableAnnotationComposer,
      $$VendasTableCreateCompanionBuilder,
      $$VendasTableUpdateCompanionBuilder,
      (Venda, $$VendasTableReferences),
      Venda,
      PrefetchHooks Function({bool vendaItensRefs})
    >;
typedef $$VendaItensTableCreateCompanionBuilder =
    VendaItensCompanion Function({
      Value<int> id,
      required int vendaId,
      required int produtoId,
      required int sequencia,
      required double quantidade,
      required double precoUnitario,
      required double valorBruto,
      required double valorIcms,
      required double valorPis,
      required double valorCofins,
      required double valorIpi,
      required double valorTotal,
    });
typedef $$VendaItensTableUpdateCompanionBuilder =
    VendaItensCompanion Function({
      Value<int> id,
      Value<int> vendaId,
      Value<int> produtoId,
      Value<int> sequencia,
      Value<double> quantidade,
      Value<double> precoUnitario,
      Value<double> valorBruto,
      Value<double> valorIcms,
      Value<double> valorPis,
      Value<double> valorCofins,
      Value<double> valorIpi,
      Value<double> valorTotal,
    });

final class $$VendaItensTableReferences
    extends BaseReferences<_$AppDatabase, $VendaItensTable, VendaItem> {
  $$VendaItensTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VendasTable _vendaIdTable(_$AppDatabase db) =>
      db.vendas.createAlias('venda_itens__venda_id__vendas__id');

  $$VendasTableProcessedTableManager get vendaId {
    final $_column = $_itemColumn<int>('venda_id')!;

    final manager = $$VendasTableTableManager(
      $_db,
      $_db.vendas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vendaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProdutosTable _produtoIdTable(_$AppDatabase db) =>
      db.produtos.createAlias('venda_itens__produto_id__produtos__id');

  $$ProdutosTableProcessedTableManager get produtoId {
    final $_column = $_itemColumn<int>('produto_id')!;

    final manager = $$ProdutosTableTableManager(
      $_db,
      $_db.produtos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_produtoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VendaItensTableFilterComposer
    extends Composer<_$AppDatabase, $VendaItensTable> {
  $$VendaItensTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sequencia => $composableBuilder(
    column: $table.sequencia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantidade => $composableBuilder(
    column: $table.quantidade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precoUnitario => $composableBuilder(
    column: $table.precoUnitario,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorBruto => $composableBuilder(
    column: $table.valorBruto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorIcms => $composableBuilder(
    column: $table.valorIcms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorPis => $composableBuilder(
    column: $table.valorPis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorCofins => $composableBuilder(
    column: $table.valorCofins,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorIpi => $composableBuilder(
    column: $table.valorIpi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorTotal => $composableBuilder(
    column: $table.valorTotal,
    builder: (column) => ColumnFilters(column),
  );

  $$VendasTableFilterComposer get vendaId {
    final $$VendasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vendaId,
      referencedTable: $db.vendas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendasTableFilterComposer(
            $db: $db,
            $table: $db.vendas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProdutosTableFilterComposer get produtoId {
    final $$ProdutosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.produtoId,
      referencedTable: $db.produtos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdutosTableFilterComposer(
            $db: $db,
            $table: $db.produtos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VendaItensTableOrderingComposer
    extends Composer<_$AppDatabase, $VendaItensTable> {
  $$VendaItensTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sequencia => $composableBuilder(
    column: $table.sequencia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantidade => $composableBuilder(
    column: $table.quantidade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precoUnitario => $composableBuilder(
    column: $table.precoUnitario,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorBruto => $composableBuilder(
    column: $table.valorBruto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorIcms => $composableBuilder(
    column: $table.valorIcms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorPis => $composableBuilder(
    column: $table.valorPis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorCofins => $composableBuilder(
    column: $table.valorCofins,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorIpi => $composableBuilder(
    column: $table.valorIpi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorTotal => $composableBuilder(
    column: $table.valorTotal,
    builder: (column) => ColumnOrderings(column),
  );

  $$VendasTableOrderingComposer get vendaId {
    final $$VendasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vendaId,
      referencedTable: $db.vendas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendasTableOrderingComposer(
            $db: $db,
            $table: $db.vendas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProdutosTableOrderingComposer get produtoId {
    final $$ProdutosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.produtoId,
      referencedTable: $db.produtos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdutosTableOrderingComposer(
            $db: $db,
            $table: $db.produtos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VendaItensTableAnnotationComposer
    extends Composer<_$AppDatabase, $VendaItensTable> {
  $$VendaItensTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sequencia =>
      $composableBuilder(column: $table.sequencia, builder: (column) => column);

  GeneratedColumn<double> get quantidade => $composableBuilder(
    column: $table.quantidade,
    builder: (column) => column,
  );

  GeneratedColumn<double> get precoUnitario => $composableBuilder(
    column: $table.precoUnitario,
    builder: (column) => column,
  );

  GeneratedColumn<double> get valorBruto => $composableBuilder(
    column: $table.valorBruto,
    builder: (column) => column,
  );

  GeneratedColumn<double> get valorIcms =>
      $composableBuilder(column: $table.valorIcms, builder: (column) => column);

  GeneratedColumn<double> get valorPis =>
      $composableBuilder(column: $table.valorPis, builder: (column) => column);

  GeneratedColumn<double> get valorCofins => $composableBuilder(
    column: $table.valorCofins,
    builder: (column) => column,
  );

  GeneratedColumn<double> get valorIpi =>
      $composableBuilder(column: $table.valorIpi, builder: (column) => column);

  GeneratedColumn<double> get valorTotal => $composableBuilder(
    column: $table.valorTotal,
    builder: (column) => column,
  );

  $$VendasTableAnnotationComposer get vendaId {
    final $$VendasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vendaId,
      referencedTable: $db.vendas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendasTableAnnotationComposer(
            $db: $db,
            $table: $db.vendas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProdutosTableAnnotationComposer get produtoId {
    final $$ProdutosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.produtoId,
      referencedTable: $db.produtos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdutosTableAnnotationComposer(
            $db: $db,
            $table: $db.produtos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VendaItensTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VendaItensTable,
          VendaItem,
          $$VendaItensTableFilterComposer,
          $$VendaItensTableOrderingComposer,
          $$VendaItensTableAnnotationComposer,
          $$VendaItensTableCreateCompanionBuilder,
          $$VendaItensTableUpdateCompanionBuilder,
          (VendaItem, $$VendaItensTableReferences),
          VendaItem,
          PrefetchHooks Function({bool vendaId, bool produtoId})
        > {
  $$VendaItensTableTableManager(_$AppDatabase db, $VendaItensTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VendaItensTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VendaItensTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VendaItensTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> vendaId = const Value.absent(),
                Value<int> produtoId = const Value.absent(),
                Value<int> sequencia = const Value.absent(),
                Value<double> quantidade = const Value.absent(),
                Value<double> precoUnitario = const Value.absent(),
                Value<double> valorBruto = const Value.absent(),
                Value<double> valorIcms = const Value.absent(),
                Value<double> valorPis = const Value.absent(),
                Value<double> valorCofins = const Value.absent(),
                Value<double> valorIpi = const Value.absent(),
                Value<double> valorTotal = const Value.absent(),
              }) => VendaItensCompanion(
                id: id,
                vendaId: vendaId,
                produtoId: produtoId,
                sequencia: sequencia,
                quantidade: quantidade,
                precoUnitario: precoUnitario,
                valorBruto: valorBruto,
                valorIcms: valorIcms,
                valorPis: valorPis,
                valorCofins: valorCofins,
                valorIpi: valorIpi,
                valorTotal: valorTotal,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int vendaId,
                required int produtoId,
                required int sequencia,
                required double quantidade,
                required double precoUnitario,
                required double valorBruto,
                required double valorIcms,
                required double valorPis,
                required double valorCofins,
                required double valorIpi,
                required double valorTotal,
              }) => VendaItensCompanion.insert(
                id: id,
                vendaId: vendaId,
                produtoId: produtoId,
                sequencia: sequencia,
                quantidade: quantidade,
                precoUnitario: precoUnitario,
                valorBruto: valorBruto,
                valorIcms: valorIcms,
                valorPis: valorPis,
                valorCofins: valorCofins,
                valorIpi: valorIpi,
                valorTotal: valorTotal,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$VendaItensTable, VendaItem>(table),
                  $$VendaItensTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({vendaId = false, produtoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (vendaId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.vendaId,
                                referencedTable: $$VendaItensTableReferences
                                    ._vendaIdTable(db),
                                referencedColumn: $$VendaItensTableReferences
                                    ._vendaIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (produtoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.produtoId,
                                referencedTable: $$VendaItensTableReferences
                                    ._produtoIdTable(db),
                                referencedColumn: $$VendaItensTableReferences
                                    ._produtoIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VendaItensTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VendaItensTable,
      VendaItem,
      $$VendaItensTableFilterComposer,
      $$VendaItensTableOrderingComposer,
      $$VendaItensTableAnnotationComposer,
      $$VendaItensTableCreateCompanionBuilder,
      $$VendaItensTableUpdateCompanionBuilder,
      (VendaItem, $$VendaItensTableReferences),
      VendaItem,
      PrefetchHooks Function({bool vendaId, bool produtoId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ImpostosTableTableManager get impostos =>
      $$ImpostosTableTableManager(_db, _db.impostos);
  $$ProdutosTableTableManager get produtos =>
      $$ProdutosTableTableManager(_db, _db.produtos);
  $$CodigosBarrasTableTableManager get codigosBarras =>
      $$CodigosBarrasTableTableManager(_db, _db.codigosBarras);
  $$VendasTableTableManager get vendas =>
      $$VendasTableTableManager(_db, _db.vendas);
  $$VendaItensTableTableManager get vendaItens =>
      $$VendaItensTableTableManager(_db, _db.vendaItens);
}
