// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MomentMoodPacksTable extends MomentMoodPacks
    with TableInfo<$MomentMoodPacksTable, MomentMoodPack> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentMoodPacksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isBuiltInMeta = const VerificationMeta(
    'isBuiltIn',
  );
  @override
  late final GeneratedColumn<bool> isBuiltIn = GeneratedColumn<bool>(
    'is_built_in',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_built_in" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    description,
    isBuiltIn,
    isEnabled,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moment_mood_packs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MomentMoodPack> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_built_in')) {
      context.handle(
        _isBuiltInMeta,
        isBuiltIn.isAcceptableOrUnknown(data['is_built_in']!, _isBuiltInMeta),
      );
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MomentMoodPack map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentMoodPack(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isBuiltIn: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_built_in'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MomentMoodPacksTable createAlias(String alias) {
    return $MomentMoodPacksTable(attachedDatabase, alias);
  }
}

class MomentMoodPack extends DataClass implements Insertable<MomentMoodPack> {
  final String id;
  final String code;
  final String name;
  final String? description;
  final bool isBuiltIn;
  final bool isEnabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MomentMoodPack({
    required this.id,
    required this.code,
    required this.name,
    this.description,
    required this.isBuiltIn,
    required this.isEnabled,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_built_in'] = Variable<bool>(isBuiltIn);
    map['is_enabled'] = Variable<bool>(isEnabled);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MomentMoodPacksCompanion toCompanion(bool nullToAbsent) {
    return MomentMoodPacksCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isBuiltIn: Value(isBuiltIn),
      isEnabled: Value(isEnabled),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MomentMoodPack.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentMoodPack(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      isBuiltIn: serializer.fromJson<bool>(json['isBuiltIn']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'isBuiltIn': serializer.toJson<bool>(isBuiltIn),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MomentMoodPack copyWith({
    String? id,
    String? code,
    String? name,
    Value<String?> description = const Value.absent(),
    bool? isBuiltIn,
    bool? isEnabled,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => MomentMoodPack(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    isBuiltIn: isBuiltIn ?? this.isBuiltIn,
    isEnabled: isEnabled ?? this.isEnabled,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MomentMoodPack copyWithCompanion(MomentMoodPacksCompanion data) {
    return MomentMoodPack(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      isBuiltIn: data.isBuiltIn.present ? data.isBuiltIn.value : this.isBuiltIn,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentMoodPack(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isBuiltIn: $isBuiltIn, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    name,
    description,
    isBuiltIn,
    isEnabled,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentMoodPack &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.isBuiltIn == this.isBuiltIn &&
          other.isEnabled == this.isEnabled &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MomentMoodPacksCompanion extends UpdateCompanion<MomentMoodPack> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> isBuiltIn;
  final Value<bool> isEnabled;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MomentMoodPacksCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isBuiltIn = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentMoodPacksCompanion.insert({
    required String id,
    required String code,
    required String name,
    this.description = const Value.absent(),
    this.isBuiltIn = const Value.absent(),
    this.isEnabled = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<MomentMoodPack> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isBuiltIn,
    Expression<bool>? isEnabled,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isBuiltIn != null) 'is_built_in': isBuiltIn,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentMoodPacksCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String?>? description,
    Value<bool>? isBuiltIn,
    Value<bool>? isEnabled,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MomentMoodPacksCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      isBuiltIn: isBuiltIn ?? this.isBuiltIn,
      isEnabled: isEnabled ?? this.isEnabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isBuiltIn.present) {
      map['is_built_in'] = Variable<bool>(isBuiltIn.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentMoodPacksCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isBuiltIn: $isBuiltIn, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MomentMoodsTable extends MomentMoods
    with TableInfo<$MomentMoodsTable, MomentMood> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentMoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moodPackIdMeta = const VerificationMeta(
    'moodPackId',
  );
  @override
  late final GeneratedColumn<String> moodPackId = GeneratedColumn<String>(
    'mood_pack_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES moment_mood_packs (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedColumn<String> emoji = GeneratedColumn<String>(
    'emoji',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDefaultMeta = const VerificationMeta(
    'isDefault',
  );
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    moodPackId,
    name,
    emoji,
    key,
    colorHex,
    isDefault,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moment_moods';
  @override
  VerificationContext validateIntegrity(
    Insertable<MomentMood> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('mood_pack_id')) {
      context.handle(
        _moodPackIdMeta,
        moodPackId.isAcceptableOrUnknown(
          data['mood_pack_id']!,
          _moodPackIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_moodPackIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('emoji')) {
      context.handle(
        _emojiMeta,
        emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta),
      );
    } else if (isInserting) {
      context.missing(_emojiMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _isDefaultMeta,
        isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {moodPackId, key},
    {moodPackId, code},
  ];
  @override
  MomentMood map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentMood(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      moodPackId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mood_pack_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      emoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      ),
      isDefault: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_default'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MomentMoodsTable createAlias(String alias) {
    return $MomentMoodsTable(attachedDatabase, alias);
  }
}

class MomentMood extends DataClass implements Insertable<MomentMood> {
  final String id;
  final String code;
  final String moodPackId;
  final String name;
  final String emoji;
  final String key;
  final String? colorHex;
  final bool isDefault;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MomentMood({
    required this.id,
    required this.code,
    required this.moodPackId,
    required this.name,
    required this.emoji,
    required this.key,
    this.colorHex,
    required this.isDefault,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['mood_pack_id'] = Variable<String>(moodPackId);
    map['name'] = Variable<String>(name);
    map['emoji'] = Variable<String>(emoji);
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    map['is_default'] = Variable<bool>(isDefault);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MomentMoodsCompanion toCompanion(bool nullToAbsent) {
    return MomentMoodsCompanion(
      id: Value(id),
      code: Value(code),
      moodPackId: Value(moodPackId),
      name: Value(name),
      emoji: Value(emoji),
      key: Value(key),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
      isDefault: Value(isDefault),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MomentMood.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentMood(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      moodPackId: serializer.fromJson<String>(json['moodPackId']),
      name: serializer.fromJson<String>(json['name']),
      emoji: serializer.fromJson<String>(json['emoji']),
      key: serializer.fromJson<String>(json['key']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'moodPackId': serializer.toJson<String>(moodPackId),
      'name': serializer.toJson<String>(name),
      'emoji': serializer.toJson<String>(emoji),
      'key': serializer.toJson<String>(key),
      'colorHex': serializer.toJson<String?>(colorHex),
      'isDefault': serializer.toJson<bool>(isDefault),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MomentMood copyWith({
    String? id,
    String? code,
    String? moodPackId,
    String? name,
    String? emoji,
    String? key,
    Value<String?> colorHex = const Value.absent(),
    bool? isDefault,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => MomentMood(
    id: id ?? this.id,
    code: code ?? this.code,
    moodPackId: moodPackId ?? this.moodPackId,
    name: name ?? this.name,
    emoji: emoji ?? this.emoji,
    key: key ?? this.key,
    colorHex: colorHex.present ? colorHex.value : this.colorHex,
    isDefault: isDefault ?? this.isDefault,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MomentMood copyWithCompanion(MomentMoodsCompanion data) {
    return MomentMood(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      moodPackId: data.moodPackId.present
          ? data.moodPackId.value
          : this.moodPackId,
      name: data.name.present ? data.name.value : this.name,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      key: data.key.present ? data.key.value : this.key,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentMood(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('moodPackId: $moodPackId, ')
          ..write('name: $name, ')
          ..write('emoji: $emoji, ')
          ..write('key: $key, ')
          ..write('colorHex: $colorHex, ')
          ..write('isDefault: $isDefault, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    moodPackId,
    name,
    emoji,
    key,
    colorHex,
    isDefault,
    isArchived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentMood &&
          other.id == this.id &&
          other.code == this.code &&
          other.moodPackId == this.moodPackId &&
          other.name == this.name &&
          other.emoji == this.emoji &&
          other.key == this.key &&
          other.colorHex == this.colorHex &&
          other.isDefault == this.isDefault &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MomentMoodsCompanion extends UpdateCompanion<MomentMood> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> moodPackId;
  final Value<String> name;
  final Value<String> emoji;
  final Value<String> key;
  final Value<String?> colorHex;
  final Value<bool> isDefault;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MomentMoodsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.moodPackId = const Value.absent(),
    this.name = const Value.absent(),
    this.emoji = const Value.absent(),
    this.key = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentMoodsCompanion.insert({
    required String id,
    required String code,
    required String moodPackId,
    required String name,
    required String emoji,
    required String key,
    this.colorHex = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       moodPackId = Value(moodPackId),
       name = Value(name),
       emoji = Value(emoji),
       key = Value(key),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<MomentMood> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? moodPackId,
    Expression<String>? name,
    Expression<String>? emoji,
    Expression<String>? key,
    Expression<String>? colorHex,
    Expression<bool>? isDefault,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (moodPackId != null) 'mood_pack_id': moodPackId,
      if (name != null) 'name': name,
      if (emoji != null) 'emoji': emoji,
      if (key != null) 'key': key,
      if (colorHex != null) 'color_hex': colorHex,
      if (isDefault != null) 'is_default': isDefault,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentMoodsCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? moodPackId,
    Value<String>? name,
    Value<String>? emoji,
    Value<String>? key,
    Value<String?>? colorHex,
    Value<bool>? isDefault,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MomentMoodsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      moodPackId: moodPackId ?? this.moodPackId,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      key: key ?? this.key,
      colorHex: colorHex ?? this.colorHex,
      isDefault: isDefault ?? this.isDefault,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (moodPackId.present) {
      map['mood_pack_id'] = Variable<String>(moodPackId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentMoodsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('moodPackId: $moodPackId, ')
          ..write('name: $name, ')
          ..write('emoji: $emoji, ')
          ..write('key: $key, ')
          ..write('colorHex: $colorHex, ')
          ..write('isDefault: $isDefault, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MomentTonePacksTable extends MomentTonePacks
    with TableInfo<$MomentTonePacksTable, MomentTonePack> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentTonePacksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isBuiltInMeta = const VerificationMeta(
    'isBuiltIn',
  );
  @override
  late final GeneratedColumn<bool> isBuiltIn = GeneratedColumn<bool>(
    'is_built_in',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_built_in" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    description,
    isBuiltIn,
    isEnabled,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moment_tone_packs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MomentTonePack> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_built_in')) {
      context.handle(
        _isBuiltInMeta,
        isBuiltIn.isAcceptableOrUnknown(data['is_built_in']!, _isBuiltInMeta),
      );
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MomentTonePack map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentTonePack(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isBuiltIn: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_built_in'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MomentTonePacksTable createAlias(String alias) {
    return $MomentTonePacksTable(attachedDatabase, alias);
  }
}

class MomentTonePack extends DataClass implements Insertable<MomentTonePack> {
  final String id;
  final String code;
  final String name;
  final String? description;
  final bool isBuiltIn;
  final bool isEnabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MomentTonePack({
    required this.id,
    required this.code,
    required this.name,
    this.description,
    required this.isBuiltIn,
    required this.isEnabled,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_built_in'] = Variable<bool>(isBuiltIn);
    map['is_enabled'] = Variable<bool>(isEnabled);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MomentTonePacksCompanion toCompanion(bool nullToAbsent) {
    return MomentTonePacksCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isBuiltIn: Value(isBuiltIn),
      isEnabled: Value(isEnabled),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MomentTonePack.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentTonePack(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      isBuiltIn: serializer.fromJson<bool>(json['isBuiltIn']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'isBuiltIn': serializer.toJson<bool>(isBuiltIn),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MomentTonePack copyWith({
    String? id,
    String? code,
    String? name,
    Value<String?> description = const Value.absent(),
    bool? isBuiltIn,
    bool? isEnabled,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => MomentTonePack(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    isBuiltIn: isBuiltIn ?? this.isBuiltIn,
    isEnabled: isEnabled ?? this.isEnabled,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MomentTonePack copyWithCompanion(MomentTonePacksCompanion data) {
    return MomentTonePack(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      isBuiltIn: data.isBuiltIn.present ? data.isBuiltIn.value : this.isBuiltIn,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentTonePack(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isBuiltIn: $isBuiltIn, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    name,
    description,
    isBuiltIn,
    isEnabled,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentTonePack &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.isBuiltIn == this.isBuiltIn &&
          other.isEnabled == this.isEnabled &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MomentTonePacksCompanion extends UpdateCompanion<MomentTonePack> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> isBuiltIn;
  final Value<bool> isEnabled;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MomentTonePacksCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isBuiltIn = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentTonePacksCompanion.insert({
    required String id,
    required String code,
    required String name,
    this.description = const Value.absent(),
    this.isBuiltIn = const Value.absent(),
    this.isEnabled = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<MomentTonePack> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isBuiltIn,
    Expression<bool>? isEnabled,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isBuiltIn != null) 'is_built_in': isBuiltIn,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentTonePacksCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String?>? description,
    Value<bool>? isBuiltIn,
    Value<bool>? isEnabled,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MomentTonePacksCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      isBuiltIn: isBuiltIn ?? this.isBuiltIn,
      isEnabled: isEnabled ?? this.isEnabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isBuiltIn.present) {
      map['is_built_in'] = Variable<bool>(isBuiltIn.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentTonePacksCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isBuiltIn: $isBuiltIn, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MomentTonesTable extends MomentTones
    with TableInfo<$MomentTonesTable, MomentTone> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentTonesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tonePackIdMeta = const VerificationMeta(
    'tonePackId',
  );
  @override
  late final GeneratedColumn<String> tonePackId = GeneratedColumn<String>(
    'tone_pack_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES moment_tone_packs (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lightColorHexMeta = const VerificationMeta(
    'lightColorHex',
  );
  @override
  late final GeneratedColumn<String> lightColorHex = GeneratedColumn<String>(
    'light_color_hex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _darkColorHexMeta = const VerificationMeta(
    'darkColorHex',
  );
  @override
  late final GeneratedColumn<String> darkColorHex = GeneratedColumn<String>(
    'dark_color_hex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isDefaultMeta = const VerificationMeta(
    'isDefault',
  );
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    tonePackId,
    name,
    key,
    lightColorHex,
    darkColorHex,
    sortOrder,
    isDefault,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moment_tones';
  @override
  VerificationContext validateIntegrity(
    Insertable<MomentTone> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('tone_pack_id')) {
      context.handle(
        _tonePackIdMeta,
        tonePackId.isAcceptableOrUnknown(
          data['tone_pack_id']!,
          _tonePackIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tonePackIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('light_color_hex')) {
      context.handle(
        _lightColorHexMeta,
        lightColorHex.isAcceptableOrUnknown(
          data['light_color_hex']!,
          _lightColorHexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lightColorHexMeta);
    }
    if (data.containsKey('dark_color_hex')) {
      context.handle(
        _darkColorHexMeta,
        darkColorHex.isAcceptableOrUnknown(
          data['dark_color_hex']!,
          _darkColorHexMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _isDefaultMeta,
        isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {tonePackId, key},
    {tonePackId, code},
  ];
  @override
  MomentTone map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentTone(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      tonePackId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tone_pack_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      lightColorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}light_color_hex'],
      )!,
      darkColorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dark_color_hex'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      isDefault: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_default'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MomentTonesTable createAlias(String alias) {
    return $MomentTonesTable(attachedDatabase, alias);
  }
}

class MomentTone extends DataClass implements Insertable<MomentTone> {
  final String id;
  final String code;
  final String tonePackId;
  final String name;
  final String key;
  final String lightColorHex;
  final String? darkColorHex;
  final int sortOrder;
  final bool isDefault;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MomentTone({
    required this.id,
    required this.code,
    required this.tonePackId,
    required this.name,
    required this.key,
    required this.lightColorHex,
    this.darkColorHex,
    required this.sortOrder,
    required this.isDefault,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['tone_pack_id'] = Variable<String>(tonePackId);
    map['name'] = Variable<String>(name);
    map['key'] = Variable<String>(key);
    map['light_color_hex'] = Variable<String>(lightColorHex);
    if (!nullToAbsent || darkColorHex != null) {
      map['dark_color_hex'] = Variable<String>(darkColorHex);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_default'] = Variable<bool>(isDefault);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MomentTonesCompanion toCompanion(bool nullToAbsent) {
    return MomentTonesCompanion(
      id: Value(id),
      code: Value(code),
      tonePackId: Value(tonePackId),
      name: Value(name),
      key: Value(key),
      lightColorHex: Value(lightColorHex),
      darkColorHex: darkColorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(darkColorHex),
      sortOrder: Value(sortOrder),
      isDefault: Value(isDefault),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MomentTone.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentTone(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      tonePackId: serializer.fromJson<String>(json['tonePackId']),
      name: serializer.fromJson<String>(json['name']),
      key: serializer.fromJson<String>(json['key']),
      lightColorHex: serializer.fromJson<String>(json['lightColorHex']),
      darkColorHex: serializer.fromJson<String?>(json['darkColorHex']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'tonePackId': serializer.toJson<String>(tonePackId),
      'name': serializer.toJson<String>(name),
      'key': serializer.toJson<String>(key),
      'lightColorHex': serializer.toJson<String>(lightColorHex),
      'darkColorHex': serializer.toJson<String?>(darkColorHex),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isDefault': serializer.toJson<bool>(isDefault),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MomentTone copyWith({
    String? id,
    String? code,
    String? tonePackId,
    String? name,
    String? key,
    String? lightColorHex,
    Value<String?> darkColorHex = const Value.absent(),
    int? sortOrder,
    bool? isDefault,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => MomentTone(
    id: id ?? this.id,
    code: code ?? this.code,
    tonePackId: tonePackId ?? this.tonePackId,
    name: name ?? this.name,
    key: key ?? this.key,
    lightColorHex: lightColorHex ?? this.lightColorHex,
    darkColorHex: darkColorHex.present ? darkColorHex.value : this.darkColorHex,
    sortOrder: sortOrder ?? this.sortOrder,
    isDefault: isDefault ?? this.isDefault,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MomentTone copyWithCompanion(MomentTonesCompanion data) {
    return MomentTone(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      tonePackId: data.tonePackId.present
          ? data.tonePackId.value
          : this.tonePackId,
      name: data.name.present ? data.name.value : this.name,
      key: data.key.present ? data.key.value : this.key,
      lightColorHex: data.lightColorHex.present
          ? data.lightColorHex.value
          : this.lightColorHex,
      darkColorHex: data.darkColorHex.present
          ? data.darkColorHex.value
          : this.darkColorHex,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentTone(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('tonePackId: $tonePackId, ')
          ..write('name: $name, ')
          ..write('key: $key, ')
          ..write('lightColorHex: $lightColorHex, ')
          ..write('darkColorHex: $darkColorHex, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isDefault: $isDefault, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    tonePackId,
    name,
    key,
    lightColorHex,
    darkColorHex,
    sortOrder,
    isDefault,
    isArchived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentTone &&
          other.id == this.id &&
          other.code == this.code &&
          other.tonePackId == this.tonePackId &&
          other.name == this.name &&
          other.key == this.key &&
          other.lightColorHex == this.lightColorHex &&
          other.darkColorHex == this.darkColorHex &&
          other.sortOrder == this.sortOrder &&
          other.isDefault == this.isDefault &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MomentTonesCompanion extends UpdateCompanion<MomentTone> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> tonePackId;
  final Value<String> name;
  final Value<String> key;
  final Value<String> lightColorHex;
  final Value<String?> darkColorHex;
  final Value<int> sortOrder;
  final Value<bool> isDefault;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MomentTonesCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.tonePackId = const Value.absent(),
    this.name = const Value.absent(),
    this.key = const Value.absent(),
    this.lightColorHex = const Value.absent(),
    this.darkColorHex = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentTonesCompanion.insert({
    required String id,
    required String code,
    required String tonePackId,
    required String name,
    required String key,
    required String lightColorHex,
    this.darkColorHex = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       tonePackId = Value(tonePackId),
       name = Value(name),
       key = Value(key),
       lightColorHex = Value(lightColorHex),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<MomentTone> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? tonePackId,
    Expression<String>? name,
    Expression<String>? key,
    Expression<String>? lightColorHex,
    Expression<String>? darkColorHex,
    Expression<int>? sortOrder,
    Expression<bool>? isDefault,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (tonePackId != null) 'tone_pack_id': tonePackId,
      if (name != null) 'name': name,
      if (key != null) 'key': key,
      if (lightColorHex != null) 'light_color_hex': lightColorHex,
      if (darkColorHex != null) 'dark_color_hex': darkColorHex,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isDefault != null) 'is_default': isDefault,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentTonesCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? tonePackId,
    Value<String>? name,
    Value<String>? key,
    Value<String>? lightColorHex,
    Value<String?>? darkColorHex,
    Value<int>? sortOrder,
    Value<bool>? isDefault,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MomentTonesCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      tonePackId: tonePackId ?? this.tonePackId,
      name: name ?? this.name,
      key: key ?? this.key,
      lightColorHex: lightColorHex ?? this.lightColorHex,
      darkColorHex: darkColorHex ?? this.darkColorHex,
      sortOrder: sortOrder ?? this.sortOrder,
      isDefault: isDefault ?? this.isDefault,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (tonePackId.present) {
      map['tone_pack_id'] = Variable<String>(tonePackId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (lightColorHex.present) {
      map['light_color_hex'] = Variable<String>(lightColorHex.value);
    }
    if (darkColorHex.present) {
      map['dark_color_hex'] = Variable<String>(darkColorHex.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentTonesCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('tonePackId: $tonePackId, ')
          ..write('name: $name, ')
          ..write('key: $key, ')
          ..write('lightColorHex: $lightColorHex, ')
          ..write('darkColorHex: $darkColorHex, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isDefault: $isDefault, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MomentsTable extends Moments with TableInfo<$MomentsTable, Moment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverAssetIdMeta = const VerificationMeta(
    'coverAssetId',
  );
  @override
  late final GeneratedColumn<String> coverAssetId = GeneratedColumn<String>(
    'cover_asset_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moodIdMeta = const VerificationMeta('moodId');
  @override
  late final GeneratedColumn<String> moodId = GeneratedColumn<String>(
    'mood_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES moment_moods (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _momentDateMeta = const VerificationMeta(
    'momentDate',
  );
  @override
  late final GeneratedColumn<DateTime> momentDate = GeneratedColumn<DateTime>(
    'moment_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationNameMeta = const VerificationMeta(
    'locationName',
  );
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
    'location_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isPinnedMeta = const VerificationMeta(
    'isPinned',
  );
  @override
  late final GeneratedColumn<bool> isPinned = GeneratedColumn<bool>(
    'is_pinned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pinned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isHiddenFromWidgetMeta =
      const VerificationMeta('isHiddenFromWidget');
  @override
  late final GeneratedColumn<bool> isHiddenFromWidget = GeneratedColumn<bool>(
    'is_hidden_from_widget',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_hidden_from_widget" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isLockedMeta = const VerificationMeta(
    'isLocked',
  );
  @override
  late final GeneratedColumn<bool> isLocked = GeneratedColumn<bool>(
    'is_locked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_locked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isSensitiveMeta = const VerificationMeta(
    'isSensitive',
  );
  @override
  late final GeneratedColumn<bool> isSensitive = GeneratedColumn<bool>(
    'is_sensitive',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sensitive" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _toneIdMeta = const VerificationMeta('toneId');
  @override
  late final GeneratedColumn<String> toneId = GeneratedColumn<String>(
    'tone_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES moment_tones (id) ON DELETE SET NULL',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    note,
    coverAssetId,
    moodId,
    momentDate,
    createdAt,
    updatedAt,
    deletedAt,
    latitude,
    longitude,
    locationName,
    address,
    city,
    country,
    isFavorite,
    isPinned,
    isHiddenFromWidget,
    deviceId,
    schemaVersion,
    isLocked,
    isSensitive,
    toneId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Moment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('cover_asset_id')) {
      context.handle(
        _coverAssetIdMeta,
        coverAssetId.isAcceptableOrUnknown(
          data['cover_asset_id']!,
          _coverAssetIdMeta,
        ),
      );
    }
    if (data.containsKey('mood_id')) {
      context.handle(
        _moodIdMeta,
        moodId.isAcceptableOrUnknown(data['mood_id']!, _moodIdMeta),
      );
    }
    if (data.containsKey('moment_date')) {
      context.handle(
        _momentDateMeta,
        momentDate.isAcceptableOrUnknown(data['moment_date']!, _momentDateMeta),
      );
    } else if (isInserting) {
      context.missing(_momentDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('location_name')) {
      context.handle(
        _locationNameMeta,
        locationName.isAcceptableOrUnknown(
          data['location_name']!,
          _locationNameMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('is_pinned')) {
      context.handle(
        _isPinnedMeta,
        isPinned.isAcceptableOrUnknown(data['is_pinned']!, _isPinnedMeta),
      );
    }
    if (data.containsKey('is_hidden_from_widget')) {
      context.handle(
        _isHiddenFromWidgetMeta,
        isHiddenFromWidget.isAcceptableOrUnknown(
          data['is_hidden_from_widget']!,
          _isHiddenFromWidgetMeta,
        ),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    }
    if (data.containsKey('is_locked')) {
      context.handle(
        _isLockedMeta,
        isLocked.isAcceptableOrUnknown(data['is_locked']!, _isLockedMeta),
      );
    }
    if (data.containsKey('is_sensitive')) {
      context.handle(
        _isSensitiveMeta,
        isSensitive.isAcceptableOrUnknown(
          data['is_sensitive']!,
          _isSensitiveMeta,
        ),
      );
    }
    if (data.containsKey('tone_id')) {
      context.handle(
        _toneIdMeta,
        toneId.isAcceptableOrUnknown(data['tone_id']!, _toneIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Moment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Moment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      coverAssetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_asset_id'],
      ),
      moodId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mood_id'],
      ),
      momentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}moment_date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      locationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_name'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      isPinned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pinned'],
      )!,
      isHiddenFromWidget: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_hidden_from_widget'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      isLocked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_locked'],
      )!,
      isSensitive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sensitive'],
      )!,
      toneId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tone_id'],
      ),
    );
  }

  @override
  $MomentsTable createAlias(String alias) {
    return $MomentsTable(attachedDatabase, alias);
  }
}

class Moment extends DataClass implements Insertable<Moment> {
  final String id;
  final String? title;
  final String? note;
  final String? coverAssetId;
  final String? moodId;
  final DateTime momentDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final double? latitude;
  final double? longitude;
  final String? locationName;
  final String? address;
  final String? city;
  final String? country;
  final bool isFavorite;
  final bool isPinned;
  final bool isHiddenFromWidget;
  final String deviceId;
  final int schemaVersion;
  final bool isLocked;
  final bool isSensitive;
  final String? toneId;
  const Moment({
    required this.id,
    this.title,
    this.note,
    this.coverAssetId,
    this.moodId,
    required this.momentDate,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.latitude,
    this.longitude,
    this.locationName,
    this.address,
    this.city,
    this.country,
    required this.isFavorite,
    required this.isPinned,
    required this.isHiddenFromWidget,
    required this.deviceId,
    required this.schemaVersion,
    required this.isLocked,
    required this.isSensitive,
    this.toneId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || coverAssetId != null) {
      map['cover_asset_id'] = Variable<String>(coverAssetId);
    }
    if (!nullToAbsent || moodId != null) {
      map['mood_id'] = Variable<String>(moodId);
    }
    map['moment_date'] = Variable<DateTime>(momentDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String>(locationName);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['is_pinned'] = Variable<bool>(isPinned);
    map['is_hidden_from_widget'] = Variable<bool>(isHiddenFromWidget);
    map['device_id'] = Variable<String>(deviceId);
    map['schema_version'] = Variable<int>(schemaVersion);
    map['is_locked'] = Variable<bool>(isLocked);
    map['is_sensitive'] = Variable<bool>(isSensitive);
    if (!nullToAbsent || toneId != null) {
      map['tone_id'] = Variable<String>(toneId);
    }
    return map;
  }

  MomentsCompanion toCompanion(bool nullToAbsent) {
    return MomentsCompanion(
      id: Value(id),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      coverAssetId: coverAssetId == null && nullToAbsent
          ? const Value.absent()
          : Value(coverAssetId),
      moodId: moodId == null && nullToAbsent
          ? const Value.absent()
          : Value(moodId),
      momentDate: Value(momentDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      locationName: locationName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationName),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      isFavorite: Value(isFavorite),
      isPinned: Value(isPinned),
      isHiddenFromWidget: Value(isHiddenFromWidget),
      deviceId: Value(deviceId),
      schemaVersion: Value(schemaVersion),
      isLocked: Value(isLocked),
      isSensitive: Value(isSensitive),
      toneId: toneId == null && nullToAbsent
          ? const Value.absent()
          : Value(toneId),
    );
  }

  factory Moment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Moment(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      note: serializer.fromJson<String?>(json['note']),
      coverAssetId: serializer.fromJson<String?>(json['coverAssetId']),
      moodId: serializer.fromJson<String?>(json['moodId']),
      momentDate: serializer.fromJson<DateTime>(json['momentDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      locationName: serializer.fromJson<String?>(json['locationName']),
      address: serializer.fromJson<String?>(json['address']),
      city: serializer.fromJson<String?>(json['city']),
      country: serializer.fromJson<String?>(json['country']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      isPinned: serializer.fromJson<bool>(json['isPinned']),
      isHiddenFromWidget: serializer.fromJson<bool>(json['isHiddenFromWidget']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      isLocked: serializer.fromJson<bool>(json['isLocked']),
      isSensitive: serializer.fromJson<bool>(json['isSensitive']),
      toneId: serializer.fromJson<String?>(json['toneId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String?>(title),
      'note': serializer.toJson<String?>(note),
      'coverAssetId': serializer.toJson<String?>(coverAssetId),
      'moodId': serializer.toJson<String?>(moodId),
      'momentDate': serializer.toJson<DateTime>(momentDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'locationName': serializer.toJson<String?>(locationName),
      'address': serializer.toJson<String?>(address),
      'city': serializer.toJson<String?>(city),
      'country': serializer.toJson<String?>(country),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'isPinned': serializer.toJson<bool>(isPinned),
      'isHiddenFromWidget': serializer.toJson<bool>(isHiddenFromWidget),
      'deviceId': serializer.toJson<String>(deviceId),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'isLocked': serializer.toJson<bool>(isLocked),
      'isSensitive': serializer.toJson<bool>(isSensitive),
      'toneId': serializer.toJson<String?>(toneId),
    };
  }

  Moment copyWith({
    String? id,
    Value<String?> title = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<String?> coverAssetId = const Value.absent(),
    Value<String?> moodId = const Value.absent(),
    DateTime? momentDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    Value<String?> locationName = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<String?> country = const Value.absent(),
    bool? isFavorite,
    bool? isPinned,
    bool? isHiddenFromWidget,
    String? deviceId,
    int? schemaVersion,
    bool? isLocked,
    bool? isSensitive,
    Value<String?> toneId = const Value.absent(),
  }) => Moment(
    id: id ?? this.id,
    title: title.present ? title.value : this.title,
    note: note.present ? note.value : this.note,
    coverAssetId: coverAssetId.present ? coverAssetId.value : this.coverAssetId,
    moodId: moodId.present ? moodId.value : this.moodId,
    momentDate: momentDate ?? this.momentDate,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    locationName: locationName.present ? locationName.value : this.locationName,
    address: address.present ? address.value : this.address,
    city: city.present ? city.value : this.city,
    country: country.present ? country.value : this.country,
    isFavorite: isFavorite ?? this.isFavorite,
    isPinned: isPinned ?? this.isPinned,
    isHiddenFromWidget: isHiddenFromWidget ?? this.isHiddenFromWidget,
    deviceId: deviceId ?? this.deviceId,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    isLocked: isLocked ?? this.isLocked,
    isSensitive: isSensitive ?? this.isSensitive,
    toneId: toneId.present ? toneId.value : this.toneId,
  );
  Moment copyWithCompanion(MomentsCompanion data) {
    return Moment(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      note: data.note.present ? data.note.value : this.note,
      coverAssetId: data.coverAssetId.present
          ? data.coverAssetId.value
          : this.coverAssetId,
      moodId: data.moodId.present ? data.moodId.value : this.moodId,
      momentDate: data.momentDate.present
          ? data.momentDate.value
          : this.momentDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      locationName: data.locationName.present
          ? data.locationName.value
          : this.locationName,
      address: data.address.present ? data.address.value : this.address,
      city: data.city.present ? data.city.value : this.city,
      country: data.country.present ? data.country.value : this.country,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      isPinned: data.isPinned.present ? data.isPinned.value : this.isPinned,
      isHiddenFromWidget: data.isHiddenFromWidget.present
          ? data.isHiddenFromWidget.value
          : this.isHiddenFromWidget,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      isLocked: data.isLocked.present ? data.isLocked.value : this.isLocked,
      isSensitive: data.isSensitive.present
          ? data.isSensitive.value
          : this.isSensitive,
      toneId: data.toneId.present ? data.toneId.value : this.toneId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Moment(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('coverAssetId: $coverAssetId, ')
          ..write('moodId: $moodId, ')
          ..write('momentDate: $momentDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('locationName: $locationName, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isPinned: $isPinned, ')
          ..write('isHiddenFromWidget: $isHiddenFromWidget, ')
          ..write('deviceId: $deviceId, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('isLocked: $isLocked, ')
          ..write('isSensitive: $isSensitive, ')
          ..write('toneId: $toneId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    title,
    note,
    coverAssetId,
    moodId,
    momentDate,
    createdAt,
    updatedAt,
    deletedAt,
    latitude,
    longitude,
    locationName,
    address,
    city,
    country,
    isFavorite,
    isPinned,
    isHiddenFromWidget,
    deviceId,
    schemaVersion,
    isLocked,
    isSensitive,
    toneId,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Moment &&
          other.id == this.id &&
          other.title == this.title &&
          other.note == this.note &&
          other.coverAssetId == this.coverAssetId &&
          other.moodId == this.moodId &&
          other.momentDate == this.momentDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.locationName == this.locationName &&
          other.address == this.address &&
          other.city == this.city &&
          other.country == this.country &&
          other.isFavorite == this.isFavorite &&
          other.isPinned == this.isPinned &&
          other.isHiddenFromWidget == this.isHiddenFromWidget &&
          other.deviceId == this.deviceId &&
          other.schemaVersion == this.schemaVersion &&
          other.isLocked == this.isLocked &&
          other.isSensitive == this.isSensitive &&
          other.toneId == this.toneId);
}

class MomentsCompanion extends UpdateCompanion<Moment> {
  final Value<String> id;
  final Value<String?> title;
  final Value<String?> note;
  final Value<String?> coverAssetId;
  final Value<String?> moodId;
  final Value<DateTime> momentDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<String?> locationName;
  final Value<String?> address;
  final Value<String?> city;
  final Value<String?> country;
  final Value<bool> isFavorite;
  final Value<bool> isPinned;
  final Value<bool> isHiddenFromWidget;
  final Value<String> deviceId;
  final Value<int> schemaVersion;
  final Value<bool> isLocked;
  final Value<bool> isSensitive;
  final Value<String?> toneId;
  final Value<int> rowid;
  const MomentsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.note = const Value.absent(),
    this.coverAssetId = const Value.absent(),
    this.moodId = const Value.absent(),
    this.momentDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.locationName = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.isHiddenFromWidget = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.isLocked = const Value.absent(),
    this.isSensitive = const Value.absent(),
    this.toneId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentsCompanion.insert({
    required String id,
    this.title = const Value.absent(),
    this.note = const Value.absent(),
    this.coverAssetId = const Value.absent(),
    this.moodId = const Value.absent(),
    required DateTime momentDate,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.locationName = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.isHiddenFromWidget = const Value.absent(),
    required String deviceId,
    this.schemaVersion = const Value.absent(),
    this.isLocked = const Value.absent(),
    this.isSensitive = const Value.absent(),
    this.toneId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       momentDate = Value(momentDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       deviceId = Value(deviceId);
  static Insertable<Moment> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? note,
    Expression<String>? coverAssetId,
    Expression<String>? moodId,
    Expression<DateTime>? momentDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? locationName,
    Expression<String>? address,
    Expression<String>? city,
    Expression<String>? country,
    Expression<bool>? isFavorite,
    Expression<bool>? isPinned,
    Expression<bool>? isHiddenFromWidget,
    Expression<String>? deviceId,
    Expression<int>? schemaVersion,
    Expression<bool>? isLocked,
    Expression<bool>? isSensitive,
    Expression<String>? toneId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (note != null) 'note': note,
      if (coverAssetId != null) 'cover_asset_id': coverAssetId,
      if (moodId != null) 'mood_id': moodId,
      if (momentDate != null) 'moment_date': momentDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (locationName != null) 'location_name': locationName,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (isPinned != null) 'is_pinned': isPinned,
      if (isHiddenFromWidget != null)
        'is_hidden_from_widget': isHiddenFromWidget,
      if (deviceId != null) 'device_id': deviceId,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (isLocked != null) 'is_locked': isLocked,
      if (isSensitive != null) 'is_sensitive': isSensitive,
      if (toneId != null) 'tone_id': toneId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentsCompanion copyWith({
    Value<String>? id,
    Value<String?>? title,
    Value<String?>? note,
    Value<String?>? coverAssetId,
    Value<String?>? moodId,
    Value<DateTime>? momentDate,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<String?>? locationName,
    Value<String?>? address,
    Value<String?>? city,
    Value<String?>? country,
    Value<bool>? isFavorite,
    Value<bool>? isPinned,
    Value<bool>? isHiddenFromWidget,
    Value<String>? deviceId,
    Value<int>? schemaVersion,
    Value<bool>? isLocked,
    Value<bool>? isSensitive,
    Value<String?>? toneId,
    Value<int>? rowid,
  }) {
    return MomentsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      coverAssetId: coverAssetId ?? this.coverAssetId,
      moodId: moodId ?? this.moodId,
      momentDate: momentDate ?? this.momentDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      locationName: locationName ?? this.locationName,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      isFavorite: isFavorite ?? this.isFavorite,
      isPinned: isPinned ?? this.isPinned,
      isHiddenFromWidget: isHiddenFromWidget ?? this.isHiddenFromWidget,
      deviceId: deviceId ?? this.deviceId,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      isLocked: isLocked ?? this.isLocked,
      isSensitive: isSensitive ?? this.isSensitive,
      toneId: toneId ?? this.toneId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (coverAssetId.present) {
      map['cover_asset_id'] = Variable<String>(coverAssetId.value);
    }
    if (moodId.present) {
      map['mood_id'] = Variable<String>(moodId.value);
    }
    if (momentDate.present) {
      map['moment_date'] = Variable<DateTime>(momentDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<bool>(isPinned.value);
    }
    if (isHiddenFromWidget.present) {
      map['is_hidden_from_widget'] = Variable<bool>(isHiddenFromWidget.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (isLocked.present) {
      map['is_locked'] = Variable<bool>(isLocked.value);
    }
    if (isSensitive.present) {
      map['is_sensitive'] = Variable<bool>(isSensitive.value);
    }
    if (toneId.present) {
      map['tone_id'] = Variable<String>(toneId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('coverAssetId: $coverAssetId, ')
          ..write('moodId: $moodId, ')
          ..write('momentDate: $momentDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('locationName: $locationName, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isPinned: $isPinned, ')
          ..write('isHiddenFromWidget: $isHiddenFromWidget, ')
          ..write('deviceId: $deviceId, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('isLocked: $isLocked, ')
          ..write('isSensitive: $isSensitive, ')
          ..write('toneId: $toneId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MomentAssetsTable extends MomentAssets
    with TableInfo<$MomentAssetsTable, MomentAsset> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentAssetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _momentIdMeta = const VerificationMeta(
    'momentId',
  );
  @override
  late final GeneratedColumn<String> momentId = GeneratedColumn<String>(
    'moment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES moments (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thumbnailPathMeta = const VerificationMeta(
    'thumbnailPath',
  );
  @override
  late final GeneratedColumn<String> thumbnailPath = GeneratedColumn<String>(
    'thumbnail_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileSizeMeta = const VerificationMeta(
    'fileSize',
  );
  @override
  late final GeneratedColumn<int> fileSize = GeneratedColumn<int>(
    'file_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMsMeta = const VerificationMeta(
    'durationMs',
  );
  @override
  late final GeneratedColumn<int> durationMs = GeneratedColumn<int>(
    'duration_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _capturedAtMeta = const VerificationMeta(
    'capturedAt',
  );
  @override
  late final GeneratedColumn<DateTime> capturedAt = GeneratedColumn<DateTime>(
    'captured_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isEncryptedMeta = const VerificationMeta(
    'isEncrypted',
  );
  @override
  late final GeneratedColumn<bool> isEncrypted = GeneratedColumn<bool>(
    'is_encrypted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_encrypted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _encryptionVersionMeta = const VerificationMeta(
    'encryptionVersion',
  );
  @override
  late final GeneratedColumn<int> encryptionVersion = GeneratedColumn<int>(
    'encryption_version',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checksumMeta = const VerificationMeta(
    'checksum',
  );
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
    'checksum',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    momentId,
    type,
    path,
    thumbnailPath,
    width,
    height,
    fileSize,
    sortOrder,
    durationMs,
    capturedAt,
    mimeType,
    createdAt,
    updatedAt,
    deletedAt,
    isEncrypted,
    encryptionVersion,
    checksum,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moment_assets';
  @override
  VerificationContext validateIntegrity(
    Insertable<MomentAsset> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('moment_id')) {
      context.handle(
        _momentIdMeta,
        momentId.isAcceptableOrUnknown(data['moment_id']!, _momentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_momentIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('thumbnail_path')) {
      context.handle(
        _thumbnailPathMeta,
        thumbnailPath.isAcceptableOrUnknown(
          data['thumbnail_path']!,
          _thumbnailPathMeta,
        ),
      );
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    } else if (isInserting) {
      context.missing(_widthMeta);
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('file_size')) {
      context.handle(
        _fileSizeMeta,
        fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta),
      );
    } else if (isInserting) {
      context.missing(_fileSizeMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
        _durationMsMeta,
        durationMs.isAcceptableOrUnknown(data['duration_ms']!, _durationMsMeta),
      );
    }
    if (data.containsKey('captured_at')) {
      context.handle(
        _capturedAtMeta,
        capturedAt.isAcceptableOrUnknown(data['captured_at']!, _capturedAtMeta),
      );
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('is_encrypted')) {
      context.handle(
        _isEncryptedMeta,
        isEncrypted.isAcceptableOrUnknown(
          data['is_encrypted']!,
          _isEncryptedMeta,
        ),
      );
    }
    if (data.containsKey('encryption_version')) {
      context.handle(
        _encryptionVersionMeta,
        encryptionVersion.isAcceptableOrUnknown(
          data['encryption_version']!,
          _encryptionVersionMeta,
        ),
      );
    }
    if (data.containsKey('checksum')) {
      context.handle(
        _checksumMeta,
        checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MomentAsset map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentAsset(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      momentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}moment_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      thumbnailPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_path'],
      ),
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      )!,
      fileSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      durationMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_ms'],
      ),
      capturedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}captured_at'],
      ),
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      isEncrypted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_encrypted'],
      )!,
      encryptionVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}encryption_version'],
      ),
      checksum: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checksum'],
      ),
    );
  }

  @override
  $MomentAssetsTable createAlias(String alias) {
    return $MomentAssetsTable(attachedDatabase, alias);
  }
}

class MomentAsset extends DataClass implements Insertable<MomentAsset> {
  final String id;
  final String momentId;
  final String type;
  final String path;
  final String? thumbnailPath;
  final int width;
  final int height;
  final int fileSize;
  final int sortOrder;
  final int? durationMs;
  final DateTime? capturedAt;
  final String? mimeType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool isEncrypted;
  final int? encryptionVersion;
  final String? checksum;
  const MomentAsset({
    required this.id,
    required this.momentId,
    required this.type,
    required this.path,
    this.thumbnailPath,
    required this.width,
    required this.height,
    required this.fileSize,
    required this.sortOrder,
    this.durationMs,
    this.capturedAt,
    this.mimeType,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isEncrypted,
    this.encryptionVersion,
    this.checksum,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['moment_id'] = Variable<String>(momentId);
    map['type'] = Variable<String>(type);
    map['path'] = Variable<String>(path);
    if (!nullToAbsent || thumbnailPath != null) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath);
    }
    map['width'] = Variable<int>(width);
    map['height'] = Variable<int>(height);
    map['file_size'] = Variable<int>(fileSize);
    map['sort_order'] = Variable<int>(sortOrder);
    if (!nullToAbsent || durationMs != null) {
      map['duration_ms'] = Variable<int>(durationMs);
    }
    if (!nullToAbsent || capturedAt != null) {
      map['captured_at'] = Variable<DateTime>(capturedAt);
    }
    if (!nullToAbsent || mimeType != null) {
      map['mime_type'] = Variable<String>(mimeType);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['is_encrypted'] = Variable<bool>(isEncrypted);
    if (!nullToAbsent || encryptionVersion != null) {
      map['encryption_version'] = Variable<int>(encryptionVersion);
    }
    if (!nullToAbsent || checksum != null) {
      map['checksum'] = Variable<String>(checksum);
    }
    return map;
  }

  MomentAssetsCompanion toCompanion(bool nullToAbsent) {
    return MomentAssetsCompanion(
      id: Value(id),
      momentId: Value(momentId),
      type: Value(type),
      path: Value(path),
      thumbnailPath: thumbnailPath == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailPath),
      width: Value(width),
      height: Value(height),
      fileSize: Value(fileSize),
      sortOrder: Value(sortOrder),
      durationMs: durationMs == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMs),
      capturedAt: capturedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(capturedAt),
      mimeType: mimeType == null && nullToAbsent
          ? const Value.absent()
          : Value(mimeType),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      isEncrypted: Value(isEncrypted),
      encryptionVersion: encryptionVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(encryptionVersion),
      checksum: checksum == null && nullToAbsent
          ? const Value.absent()
          : Value(checksum),
    );
  }

  factory MomentAsset.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentAsset(
      id: serializer.fromJson<String>(json['id']),
      momentId: serializer.fromJson<String>(json['momentId']),
      type: serializer.fromJson<String>(json['type']),
      path: serializer.fromJson<String>(json['path']),
      thumbnailPath: serializer.fromJson<String?>(json['thumbnailPath']),
      width: serializer.fromJson<int>(json['width']),
      height: serializer.fromJson<int>(json['height']),
      fileSize: serializer.fromJson<int>(json['fileSize']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      durationMs: serializer.fromJson<int?>(json['durationMs']),
      capturedAt: serializer.fromJson<DateTime?>(json['capturedAt']),
      mimeType: serializer.fromJson<String?>(json['mimeType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      isEncrypted: serializer.fromJson<bool>(json['isEncrypted']),
      encryptionVersion: serializer.fromJson<int?>(json['encryptionVersion']),
      checksum: serializer.fromJson<String?>(json['checksum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'momentId': serializer.toJson<String>(momentId),
      'type': serializer.toJson<String>(type),
      'path': serializer.toJson<String>(path),
      'thumbnailPath': serializer.toJson<String?>(thumbnailPath),
      'width': serializer.toJson<int>(width),
      'height': serializer.toJson<int>(height),
      'fileSize': serializer.toJson<int>(fileSize),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'durationMs': serializer.toJson<int?>(durationMs),
      'capturedAt': serializer.toJson<DateTime?>(capturedAt),
      'mimeType': serializer.toJson<String?>(mimeType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'isEncrypted': serializer.toJson<bool>(isEncrypted),
      'encryptionVersion': serializer.toJson<int?>(encryptionVersion),
      'checksum': serializer.toJson<String?>(checksum),
    };
  }

  MomentAsset copyWith({
    String? id,
    String? momentId,
    String? type,
    String? path,
    Value<String?> thumbnailPath = const Value.absent(),
    int? width,
    int? height,
    int? fileSize,
    int? sortOrder,
    Value<int?> durationMs = const Value.absent(),
    Value<DateTime?> capturedAt = const Value.absent(),
    Value<String?> mimeType = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    bool? isEncrypted,
    Value<int?> encryptionVersion = const Value.absent(),
    Value<String?> checksum = const Value.absent(),
  }) => MomentAsset(
    id: id ?? this.id,
    momentId: momentId ?? this.momentId,
    type: type ?? this.type,
    path: path ?? this.path,
    thumbnailPath: thumbnailPath.present
        ? thumbnailPath.value
        : this.thumbnailPath,
    width: width ?? this.width,
    height: height ?? this.height,
    fileSize: fileSize ?? this.fileSize,
    sortOrder: sortOrder ?? this.sortOrder,
    durationMs: durationMs.present ? durationMs.value : this.durationMs,
    capturedAt: capturedAt.present ? capturedAt.value : this.capturedAt,
    mimeType: mimeType.present ? mimeType.value : this.mimeType,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    isEncrypted: isEncrypted ?? this.isEncrypted,
    encryptionVersion: encryptionVersion.present
        ? encryptionVersion.value
        : this.encryptionVersion,
    checksum: checksum.present ? checksum.value : this.checksum,
  );
  MomentAsset copyWithCompanion(MomentAssetsCompanion data) {
    return MomentAsset(
      id: data.id.present ? data.id.value : this.id,
      momentId: data.momentId.present ? data.momentId.value : this.momentId,
      type: data.type.present ? data.type.value : this.type,
      path: data.path.present ? data.path.value : this.path,
      thumbnailPath: data.thumbnailPath.present
          ? data.thumbnailPath.value
          : this.thumbnailPath,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      durationMs: data.durationMs.present
          ? data.durationMs.value
          : this.durationMs,
      capturedAt: data.capturedAt.present
          ? data.capturedAt.value
          : this.capturedAt,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      isEncrypted: data.isEncrypted.present
          ? data.isEncrypted.value
          : this.isEncrypted,
      encryptionVersion: data.encryptionVersion.present
          ? data.encryptionVersion.value
          : this.encryptionVersion,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentAsset(')
          ..write('id: $id, ')
          ..write('momentId: $momentId, ')
          ..write('type: $type, ')
          ..write('path: $path, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('fileSize: $fileSize, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('durationMs: $durationMs, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('mimeType: $mimeType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('isEncrypted: $isEncrypted, ')
          ..write('encryptionVersion: $encryptionVersion, ')
          ..write('checksum: $checksum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    momentId,
    type,
    path,
    thumbnailPath,
    width,
    height,
    fileSize,
    sortOrder,
    durationMs,
    capturedAt,
    mimeType,
    createdAt,
    updatedAt,
    deletedAt,
    isEncrypted,
    encryptionVersion,
    checksum,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentAsset &&
          other.id == this.id &&
          other.momentId == this.momentId &&
          other.type == this.type &&
          other.path == this.path &&
          other.thumbnailPath == this.thumbnailPath &&
          other.width == this.width &&
          other.height == this.height &&
          other.fileSize == this.fileSize &&
          other.sortOrder == this.sortOrder &&
          other.durationMs == this.durationMs &&
          other.capturedAt == this.capturedAt &&
          other.mimeType == this.mimeType &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.isEncrypted == this.isEncrypted &&
          other.encryptionVersion == this.encryptionVersion &&
          other.checksum == this.checksum);
}

class MomentAssetsCompanion extends UpdateCompanion<MomentAsset> {
  final Value<String> id;
  final Value<String> momentId;
  final Value<String> type;
  final Value<String> path;
  final Value<String?> thumbnailPath;
  final Value<int> width;
  final Value<int> height;
  final Value<int> fileSize;
  final Value<int> sortOrder;
  final Value<int?> durationMs;
  final Value<DateTime?> capturedAt;
  final Value<String?> mimeType;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> isEncrypted;
  final Value<int?> encryptionVersion;
  final Value<String?> checksum;
  final Value<int> rowid;
  const MomentAssetsCompanion({
    this.id = const Value.absent(),
    this.momentId = const Value.absent(),
    this.type = const Value.absent(),
    this.path = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.capturedAt = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.isEncrypted = const Value.absent(),
    this.encryptionVersion = const Value.absent(),
    this.checksum = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentAssetsCompanion.insert({
    required String id,
    required String momentId,
    required String type,
    required String path,
    this.thumbnailPath = const Value.absent(),
    required int width,
    required int height,
    required int fileSize,
    required int sortOrder,
    this.durationMs = const Value.absent(),
    this.capturedAt = const Value.absent(),
    this.mimeType = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.isEncrypted = const Value.absent(),
    this.encryptionVersion = const Value.absent(),
    this.checksum = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       momentId = Value(momentId),
       type = Value(type),
       path = Value(path),
       width = Value(width),
       height = Value(height),
       fileSize = Value(fileSize),
       sortOrder = Value(sortOrder),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<MomentAsset> custom({
    Expression<String>? id,
    Expression<String>? momentId,
    Expression<String>? type,
    Expression<String>? path,
    Expression<String>? thumbnailPath,
    Expression<int>? width,
    Expression<int>? height,
    Expression<int>? fileSize,
    Expression<int>? sortOrder,
    Expression<int>? durationMs,
    Expression<DateTime>? capturedAt,
    Expression<String>? mimeType,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? isEncrypted,
    Expression<int>? encryptionVersion,
    Expression<String>? checksum,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (momentId != null) 'moment_id': momentId,
      if (type != null) 'type': type,
      if (path != null) 'path': path,
      if (thumbnailPath != null) 'thumbnail_path': thumbnailPath,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (fileSize != null) 'file_size': fileSize,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (durationMs != null) 'duration_ms': durationMs,
      if (capturedAt != null) 'captured_at': capturedAt,
      if (mimeType != null) 'mime_type': mimeType,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (isEncrypted != null) 'is_encrypted': isEncrypted,
      if (encryptionVersion != null) 'encryption_version': encryptionVersion,
      if (checksum != null) 'checksum': checksum,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentAssetsCompanion copyWith({
    Value<String>? id,
    Value<String>? momentId,
    Value<String>? type,
    Value<String>? path,
    Value<String?>? thumbnailPath,
    Value<int>? width,
    Value<int>? height,
    Value<int>? fileSize,
    Value<int>? sortOrder,
    Value<int?>? durationMs,
    Value<DateTime?>? capturedAt,
    Value<String?>? mimeType,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<bool>? isEncrypted,
    Value<int?>? encryptionVersion,
    Value<String?>? checksum,
    Value<int>? rowid,
  }) {
    return MomentAssetsCompanion(
      id: id ?? this.id,
      momentId: momentId ?? this.momentId,
      type: type ?? this.type,
      path: path ?? this.path,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      width: width ?? this.width,
      height: height ?? this.height,
      fileSize: fileSize ?? this.fileSize,
      sortOrder: sortOrder ?? this.sortOrder,
      durationMs: durationMs ?? this.durationMs,
      capturedAt: capturedAt ?? this.capturedAt,
      mimeType: mimeType ?? this.mimeType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      isEncrypted: isEncrypted ?? this.isEncrypted,
      encryptionVersion: encryptionVersion ?? this.encryptionVersion,
      checksum: checksum ?? this.checksum,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (momentId.present) {
      map['moment_id'] = Variable<String>(momentId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (thumbnailPath.present) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (durationMs.present) {
      map['duration_ms'] = Variable<int>(durationMs.value);
    }
    if (capturedAt.present) {
      map['captured_at'] = Variable<DateTime>(capturedAt.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (isEncrypted.present) {
      map['is_encrypted'] = Variable<bool>(isEncrypted.value);
    }
    if (encryptionVersion.present) {
      map['encryption_version'] = Variable<int>(encryptionVersion.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentAssetsCompanion(')
          ..write('id: $id, ')
          ..write('momentId: $momentId, ')
          ..write('type: $type, ')
          ..write('path: $path, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('fileSize: $fileSize, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('durationMs: $durationMs, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('mimeType: $mimeType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('isEncrypted: $isEncrypted, ')
          ..write('encryptionVersion: $encryptionVersion, ')
          ..write('checksum: $checksum, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MomentTagsTable extends MomentTags
    with TableInfo<$MomentTagsTable, MomentTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _normalizedNameMeta = const VerificationMeta(
    'normalizedName',
  );
  @override
  late final GeneratedColumn<String> normalizedName = GeneratedColumn<String>(
    'normalized_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _groupKeyMeta = const VerificationMeta(
    'groupKey',
  );
  @override
  late final GeneratedColumn<String> groupKey = GeneratedColumn<String>(
    'group_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usageCountMeta = const VerificationMeta(
    'usageCount',
  );
  @override
  late final GeneratedColumn<int> usageCount = GeneratedColumn<int>(
    'usage_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    normalizedName,
    colorHex,
    groupKey,
    usageCount,
    createdAt,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moment_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<MomentTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('normalized_name')) {
      context.handle(
        _normalizedNameMeta,
        normalizedName.isAcceptableOrUnknown(
          data['normalized_name']!,
          _normalizedNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_normalizedNameMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    }
    if (data.containsKey('group_key')) {
      context.handle(
        _groupKeyMeta,
        groupKey.isAcceptableOrUnknown(data['group_key']!, _groupKeyMeta),
      );
    }
    if (data.containsKey('usage_count')) {
      context.handle(
        _usageCountMeta,
        usageCount.isAcceptableOrUnknown(data['usage_count']!, _usageCountMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MomentTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentTag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      normalizedName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}normalized_name'],
      )!,
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      ),
      groupKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_key'],
      ),
      usageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usage_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $MomentTagsTable createAlias(String alias) {
    return $MomentTagsTable(attachedDatabase, alias);
  }
}

class MomentTag extends DataClass implements Insertable<MomentTag> {
  final String id;
  final String name;
  final String normalizedName;
  final String? colorHex;
  final String? groupKey;
  final int usageCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const MomentTag({
    required this.id,
    required this.name,
    required this.normalizedName,
    this.colorHex,
    this.groupKey,
    required this.usageCount,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['normalized_name'] = Variable<String>(normalizedName);
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    if (!nullToAbsent || groupKey != null) {
      map['group_key'] = Variable<String>(groupKey);
    }
    map['usage_count'] = Variable<int>(usageCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  MomentTagsCompanion toCompanion(bool nullToAbsent) {
    return MomentTagsCompanion(
      id: Value(id),
      name: Value(name),
      normalizedName: Value(normalizedName),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
      groupKey: groupKey == null && nullToAbsent
          ? const Value.absent()
          : Value(groupKey),
      usageCount: Value(usageCount),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory MomentTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentTag(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      normalizedName: serializer.fromJson<String>(json['normalizedName']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      groupKey: serializer.fromJson<String?>(json['groupKey']),
      usageCount: serializer.fromJson<int>(json['usageCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'normalizedName': serializer.toJson<String>(normalizedName),
      'colorHex': serializer.toJson<String?>(colorHex),
      'groupKey': serializer.toJson<String?>(groupKey),
      'usageCount': serializer.toJson<int>(usageCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  MomentTag copyWith({
    String? id,
    String? name,
    String? normalizedName,
    Value<String?> colorHex = const Value.absent(),
    Value<String?> groupKey = const Value.absent(),
    int? usageCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => MomentTag(
    id: id ?? this.id,
    name: name ?? this.name,
    normalizedName: normalizedName ?? this.normalizedName,
    colorHex: colorHex.present ? colorHex.value : this.colorHex,
    groupKey: groupKey.present ? groupKey.value : this.groupKey,
    usageCount: usageCount ?? this.usageCount,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  MomentTag copyWithCompanion(MomentTagsCompanion data) {
    return MomentTag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      normalizedName: data.normalizedName.present
          ? data.normalizedName.value
          : this.normalizedName,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      groupKey: data.groupKey.present ? data.groupKey.value : this.groupKey,
      usageCount: data.usageCount.present
          ? data.usageCount.value
          : this.usageCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentTag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('normalizedName: $normalizedName, ')
          ..write('colorHex: $colorHex, ')
          ..write('groupKey: $groupKey, ')
          ..write('usageCount: $usageCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    normalizedName,
    colorHex,
    groupKey,
    usageCount,
    createdAt,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentTag &&
          other.id == this.id &&
          other.name == this.name &&
          other.normalizedName == this.normalizedName &&
          other.colorHex == this.colorHex &&
          other.groupKey == this.groupKey &&
          other.usageCount == this.usageCount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class MomentTagsCompanion extends UpdateCompanion<MomentTag> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> normalizedName;
  final Value<String?> colorHex;
  final Value<String?> groupKey;
  final Value<int> usageCount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const MomentTagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.normalizedName = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.groupKey = const Value.absent(),
    this.usageCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentTagsCompanion.insert({
    required String id,
    required String name,
    required String normalizedName,
    this.colorHex = const Value.absent(),
    this.groupKey = const Value.absent(),
    this.usageCount = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       normalizedName = Value(normalizedName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<MomentTag> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? normalizedName,
    Expression<String>? colorHex,
    Expression<String>? groupKey,
    Expression<int>? usageCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (normalizedName != null) 'normalized_name': normalizedName,
      if (colorHex != null) 'color_hex': colorHex,
      if (groupKey != null) 'group_key': groupKey,
      if (usageCount != null) 'usage_count': usageCount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentTagsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? normalizedName,
    Value<String?>? colorHex,
    Value<String?>? groupKey,
    Value<int>? usageCount,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return MomentTagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      normalizedName: normalizedName ?? this.normalizedName,
      colorHex: colorHex ?? this.colorHex,
      groupKey: groupKey ?? this.groupKey,
      usageCount: usageCount ?? this.usageCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (normalizedName.present) {
      map['normalized_name'] = Variable<String>(normalizedName.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (groupKey.present) {
      map['group_key'] = Variable<String>(groupKey.value);
    }
    if (usageCount.present) {
      map['usage_count'] = Variable<int>(usageCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentTagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('normalizedName: $normalizedName, ')
          ..write('colorHex: $colorHex, ')
          ..write('groupKey: $groupKey, ')
          ..write('usageCount: $usageCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MomentTagLinksTable extends MomentTagLinks
    with TableInfo<$MomentTagLinksTable, MomentTagLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentTagLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _momentIdMeta = const VerificationMeta(
    'momentId',
  );
  @override
  late final GeneratedColumn<String> momentId = GeneratedColumn<String>(
    'moment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES moments (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES moment_tags (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [momentId, tagId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moment_tag_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<MomentTagLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('moment_id')) {
      context.handle(
        _momentIdMeta,
        momentId.isAcceptableOrUnknown(data['moment_id']!, _momentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_momentIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {momentId, tagId};
  @override
  MomentTagLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentTagLink(
      momentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}moment_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MomentTagLinksTable createAlias(String alias) {
    return $MomentTagLinksTable(attachedDatabase, alias);
  }
}

class MomentTagLink extends DataClass implements Insertable<MomentTagLink> {
  final String momentId;
  final String tagId;
  final DateTime createdAt;
  const MomentTagLink({
    required this.momentId,
    required this.tagId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['moment_id'] = Variable<String>(momentId);
    map['tag_id'] = Variable<String>(tagId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MomentTagLinksCompanion toCompanion(bool nullToAbsent) {
    return MomentTagLinksCompanion(
      momentId: Value(momentId),
      tagId: Value(tagId),
      createdAt: Value(createdAt),
    );
  }

  factory MomentTagLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentTagLink(
      momentId: serializer.fromJson<String>(json['momentId']),
      tagId: serializer.fromJson<String>(json['tagId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'momentId': serializer.toJson<String>(momentId),
      'tagId': serializer.toJson<String>(tagId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MomentTagLink copyWith({
    String? momentId,
    String? tagId,
    DateTime? createdAt,
  }) => MomentTagLink(
    momentId: momentId ?? this.momentId,
    tagId: tagId ?? this.tagId,
    createdAt: createdAt ?? this.createdAt,
  );
  MomentTagLink copyWithCompanion(MomentTagLinksCompanion data) {
    return MomentTagLink(
      momentId: data.momentId.present ? data.momentId.value : this.momentId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentTagLink(')
          ..write('momentId: $momentId, ')
          ..write('tagId: $tagId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(momentId, tagId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentTagLink &&
          other.momentId == this.momentId &&
          other.tagId == this.tagId &&
          other.createdAt == this.createdAt);
}

class MomentTagLinksCompanion extends UpdateCompanion<MomentTagLink> {
  final Value<String> momentId;
  final Value<String> tagId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MomentTagLinksCompanion({
    this.momentId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentTagLinksCompanion.insert({
    required String momentId,
    required String tagId,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : momentId = Value(momentId),
       tagId = Value(tagId),
       createdAt = Value(createdAt);
  static Insertable<MomentTagLink> custom({
    Expression<String>? momentId,
    Expression<String>? tagId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (momentId != null) 'moment_id': momentId,
      if (tagId != null) 'tag_id': tagId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentTagLinksCompanion copyWith({
    Value<String>? momentId,
    Value<String>? tagId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return MomentTagLinksCompanion(
      momentId: momentId ?? this.momentId,
      tagId: tagId ?? this.tagId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (momentId.present) {
      map['moment_id'] = Variable<String>(momentId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentTagLinksCompanion(')
          ..write('momentId: $momentId, ')
          ..write('tagId: $tagId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MomentCollectionsTable extends MomentCollections
    with TableInfo<$MomentCollectionsTable, MomentCollection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentCollectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverAssetIdMeta = const VerificationMeta(
    'coverAssetId',
  );
  @override
  late final GeneratedColumn<String> coverAssetId = GeneratedColumn<String>(
    'cover_asset_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isPinnedMeta = const VerificationMeta(
    'isPinned',
  );
  @override
  late final GeneratedColumn<bool> isPinned = GeneratedColumn<bool>(
    'is_pinned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pinned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isLockedMeta = const VerificationMeta(
    'isLocked',
  );
  @override
  late final GeneratedColumn<bool> isLocked = GeneratedColumn<bool>(
    'is_locked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_locked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    coverAssetId,
    sortOrder,
    isPinned,
    isLocked,
    createdAt,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moment_collections';
  @override
  VerificationContext validateIntegrity(
    Insertable<MomentCollection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('cover_asset_id')) {
      context.handle(
        _coverAssetIdMeta,
        coverAssetId.isAcceptableOrUnknown(
          data['cover_asset_id']!,
          _coverAssetIdMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('is_pinned')) {
      context.handle(
        _isPinnedMeta,
        isPinned.isAcceptableOrUnknown(data['is_pinned']!, _isPinnedMeta),
      );
    }
    if (data.containsKey('is_locked')) {
      context.handle(
        _isLockedMeta,
        isLocked.isAcceptableOrUnknown(data['is_locked']!, _isLockedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MomentCollection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentCollection(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      coverAssetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_asset_id'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      isPinned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pinned'],
      )!,
      isLocked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_locked'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $MomentCollectionsTable createAlias(String alias) {
    return $MomentCollectionsTable(attachedDatabase, alias);
  }
}

class MomentCollection extends DataClass
    implements Insertable<MomentCollection> {
  final String id;
  final String name;
  final String? description;
  final String? coverAssetId;
  final int sortOrder;
  final bool isPinned;
  final bool isLocked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const MomentCollection({
    required this.id,
    required this.name,
    this.description,
    this.coverAssetId,
    required this.sortOrder,
    required this.isPinned,
    required this.isLocked,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || coverAssetId != null) {
      map['cover_asset_id'] = Variable<String>(coverAssetId);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_pinned'] = Variable<bool>(isPinned);
    map['is_locked'] = Variable<bool>(isLocked);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  MomentCollectionsCompanion toCompanion(bool nullToAbsent) {
    return MomentCollectionsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      coverAssetId: coverAssetId == null && nullToAbsent
          ? const Value.absent()
          : Value(coverAssetId),
      sortOrder: Value(sortOrder),
      isPinned: Value(isPinned),
      isLocked: Value(isLocked),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory MomentCollection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentCollection(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      coverAssetId: serializer.fromJson<String?>(json['coverAssetId']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isPinned: serializer.fromJson<bool>(json['isPinned']),
      isLocked: serializer.fromJson<bool>(json['isLocked']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'coverAssetId': serializer.toJson<String?>(coverAssetId),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isPinned': serializer.toJson<bool>(isPinned),
      'isLocked': serializer.toJson<bool>(isLocked),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  MomentCollection copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> coverAssetId = const Value.absent(),
    int? sortOrder,
    bool? isPinned,
    bool? isLocked,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => MomentCollection(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    coverAssetId: coverAssetId.present ? coverAssetId.value : this.coverAssetId,
    sortOrder: sortOrder ?? this.sortOrder,
    isPinned: isPinned ?? this.isPinned,
    isLocked: isLocked ?? this.isLocked,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  MomentCollection copyWithCompanion(MomentCollectionsCompanion data) {
    return MomentCollection(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      coverAssetId: data.coverAssetId.present
          ? data.coverAssetId.value
          : this.coverAssetId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isPinned: data.isPinned.present ? data.isPinned.value : this.isPinned,
      isLocked: data.isLocked.present ? data.isLocked.value : this.isLocked,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentCollection(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('coverAssetId: $coverAssetId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isPinned: $isPinned, ')
          ..write('isLocked: $isLocked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    coverAssetId,
    sortOrder,
    isPinned,
    isLocked,
    createdAt,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentCollection &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.coverAssetId == this.coverAssetId &&
          other.sortOrder == this.sortOrder &&
          other.isPinned == this.isPinned &&
          other.isLocked == this.isLocked &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class MomentCollectionsCompanion extends UpdateCompanion<MomentCollection> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> coverAssetId;
  final Value<int> sortOrder;
  final Value<bool> isPinned;
  final Value<bool> isLocked;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const MomentCollectionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.coverAssetId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.isLocked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentCollectionsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.coverAssetId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.isLocked = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<MomentCollection> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? coverAssetId,
    Expression<int>? sortOrder,
    Expression<bool>? isPinned,
    Expression<bool>? isLocked,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (coverAssetId != null) 'cover_asset_id': coverAssetId,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isPinned != null) 'is_pinned': isPinned,
      if (isLocked != null) 'is_locked': isLocked,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentCollectionsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? coverAssetId,
    Value<int>? sortOrder,
    Value<bool>? isPinned,
    Value<bool>? isLocked,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return MomentCollectionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      coverAssetId: coverAssetId ?? this.coverAssetId,
      sortOrder: sortOrder ?? this.sortOrder,
      isPinned: isPinned ?? this.isPinned,
      isLocked: isLocked ?? this.isLocked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (coverAssetId.present) {
      map['cover_asset_id'] = Variable<String>(coverAssetId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<bool>(isPinned.value);
    }
    if (isLocked.present) {
      map['is_locked'] = Variable<bool>(isLocked.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentCollectionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('coverAssetId: $coverAssetId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isPinned: $isPinned, ')
          ..write('isLocked: $isLocked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MomentCollectionItemsTable extends MomentCollectionItems
    with TableInfo<$MomentCollectionItemsTable, MomentCollectionItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentCollectionItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _collectionIdMeta = const VerificationMeta(
    'collectionId',
  );
  @override
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
    'collection_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES moment_collections (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _momentIdMeta = const VerificationMeta(
    'momentId',
  );
  @override
  late final GeneratedColumn<String> momentId = GeneratedColumn<String>(
    'moment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES moments (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    collectionId,
    momentId,
    sortOrder,
    addedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moment_collection_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<MomentCollectionItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('collection_id')) {
      context.handle(
        _collectionIdMeta,
        collectionId.isAcceptableOrUnknown(
          data['collection_id']!,
          _collectionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('moment_id')) {
      context.handle(
        _momentIdMeta,
        momentId.isAcceptableOrUnknown(data['moment_id']!, _momentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_momentIdMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {collectionId, momentId};
  @override
  MomentCollectionItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentCollectionItem(
      collectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}collection_id'],
      )!,
      momentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}moment_id'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $MomentCollectionItemsTable createAlias(String alias) {
    return $MomentCollectionItemsTable(attachedDatabase, alias);
  }
}

class MomentCollectionItem extends DataClass
    implements Insertable<MomentCollectionItem> {
  final String collectionId;
  final String momentId;
  final int sortOrder;
  final DateTime addedAt;
  const MomentCollectionItem({
    required this.collectionId,
    required this.momentId,
    required this.sortOrder,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['collection_id'] = Variable<String>(collectionId);
    map['moment_id'] = Variable<String>(momentId);
    map['sort_order'] = Variable<int>(sortOrder);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  MomentCollectionItemsCompanion toCompanion(bool nullToAbsent) {
    return MomentCollectionItemsCompanion(
      collectionId: Value(collectionId),
      momentId: Value(momentId),
      sortOrder: Value(sortOrder),
      addedAt: Value(addedAt),
    );
  }

  factory MomentCollectionItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentCollectionItem(
      collectionId: serializer.fromJson<String>(json['collectionId']),
      momentId: serializer.fromJson<String>(json['momentId']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'collectionId': serializer.toJson<String>(collectionId),
      'momentId': serializer.toJson<String>(momentId),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  MomentCollectionItem copyWith({
    String? collectionId,
    String? momentId,
    int? sortOrder,
    DateTime? addedAt,
  }) => MomentCollectionItem(
    collectionId: collectionId ?? this.collectionId,
    momentId: momentId ?? this.momentId,
    sortOrder: sortOrder ?? this.sortOrder,
    addedAt: addedAt ?? this.addedAt,
  );
  MomentCollectionItem copyWithCompanion(MomentCollectionItemsCompanion data) {
    return MomentCollectionItem(
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      momentId: data.momentId.present ? data.momentId.value : this.momentId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentCollectionItem(')
          ..write('collectionId: $collectionId, ')
          ..write('momentId: $momentId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(collectionId, momentId, sortOrder, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentCollectionItem &&
          other.collectionId == this.collectionId &&
          other.momentId == this.momentId &&
          other.sortOrder == this.sortOrder &&
          other.addedAt == this.addedAt);
}

class MomentCollectionItemsCompanion
    extends UpdateCompanion<MomentCollectionItem> {
  final Value<String> collectionId;
  final Value<String> momentId;
  final Value<int> sortOrder;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const MomentCollectionItemsCompanion({
    this.collectionId = const Value.absent(),
    this.momentId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentCollectionItemsCompanion.insert({
    required String collectionId,
    required String momentId,
    this.sortOrder = const Value.absent(),
    required DateTime addedAt,
    this.rowid = const Value.absent(),
  }) : collectionId = Value(collectionId),
       momentId = Value(momentId),
       addedAt = Value(addedAt);
  static Insertable<MomentCollectionItem> custom({
    Expression<String>? collectionId,
    Expression<String>? momentId,
    Expression<int>? sortOrder,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (collectionId != null) 'collection_id': collectionId,
      if (momentId != null) 'moment_id': momentId,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentCollectionItemsCompanion copyWith({
    Value<String>? collectionId,
    Value<String>? momentId,
    Value<int>? sortOrder,
    Value<DateTime>? addedAt,
    Value<int>? rowid,
  }) {
    return MomentCollectionItemsCompanion(
      collectionId: collectionId ?? this.collectionId,
      momentId: momentId ?? this.momentId,
      sortOrder: sortOrder ?? this.sortOrder,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (momentId.present) {
      map['moment_id'] = Variable<String>(momentId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentCollectionItemsCompanion(')
          ..write('collectionId: $collectionId, ')
          ..write('momentId: $momentId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MomentWidgetConfigsTable extends MomentWidgetConfigs
    with TableInfo<$MomentWidgetConfigsTable, MomentWidgetConfig> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MomentWidgetConfigsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fixedMomentIdMeta = const VerificationMeta(
    'fixedMomentId',
  );
  @override
  late final GeneratedColumn<String> fixedMomentId = GeneratedColumn<String>(
    'fixed_moment_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES moments (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _excludeSensitiveMeta = const VerificationMeta(
    'excludeSensitive',
  );
  @override
  late final GeneratedColumn<bool> excludeSensitive = GeneratedColumn<bool>(
    'exclude_sensitive',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("exclude_sensitive" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _excludeHiddenFromWidgetMeta =
      const VerificationMeta('excludeHiddenFromWidget');
  @override
  late final GeneratedColumn<bool> excludeHiddenFromWidget =
      GeneratedColumn<bool>(
        'exclude_hidden_from_widget',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("exclude_hidden_from_widget" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  static const VerificationMeta _includeDeletedMeta = const VerificationMeta(
    'includeDeleted',
  );
  @override
  late final GeneratedColumn<bool> includeDeleted = GeneratedColumn<bool>(
    'include_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("include_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mode,
    fixedMomentId,
    excludeSensitive,
    excludeHiddenFromWidget,
    includeDeleted,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moment_widget_configs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MomentWidgetConfig> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
        _modeMeta,
        mode.isAcceptableOrUnknown(data['mode']!, _modeMeta),
      );
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('fixed_moment_id')) {
      context.handle(
        _fixedMomentIdMeta,
        fixedMomentId.isAcceptableOrUnknown(
          data['fixed_moment_id']!,
          _fixedMomentIdMeta,
        ),
      );
    }
    if (data.containsKey('exclude_sensitive')) {
      context.handle(
        _excludeSensitiveMeta,
        excludeSensitive.isAcceptableOrUnknown(
          data['exclude_sensitive']!,
          _excludeSensitiveMeta,
        ),
      );
    }
    if (data.containsKey('exclude_hidden_from_widget')) {
      context.handle(
        _excludeHiddenFromWidgetMeta,
        excludeHiddenFromWidget.isAcceptableOrUnknown(
          data['exclude_hidden_from_widget']!,
          _excludeHiddenFromWidgetMeta,
        ),
      );
    }
    if (data.containsKey('include_deleted')) {
      context.handle(
        _includeDeletedMeta,
        includeDeleted.isAcceptableOrUnknown(
          data['include_deleted']!,
          _includeDeletedMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MomentWidgetConfig map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MomentWidgetConfig(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode'],
      )!,
      fixedMomentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fixed_moment_id'],
      ),
      excludeSensitive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}exclude_sensitive'],
      )!,
      excludeHiddenFromWidget: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}exclude_hidden_from_widget'],
      )!,
      includeDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}include_deleted'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MomentWidgetConfigsTable createAlias(String alias) {
    return $MomentWidgetConfigsTable(attachedDatabase, alias);
  }
}

class MomentWidgetConfig extends DataClass
    implements Insertable<MomentWidgetConfig> {
  final String id;
  final String mode;
  final String? fixedMomentId;
  final bool excludeSensitive;
  final bool excludeHiddenFromWidget;
  final bool includeDeleted;
  final DateTime updatedAt;
  const MomentWidgetConfig({
    required this.id,
    required this.mode,
    this.fixedMomentId,
    required this.excludeSensitive,
    required this.excludeHiddenFromWidget,
    required this.includeDeleted,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mode'] = Variable<String>(mode);
    if (!nullToAbsent || fixedMomentId != null) {
      map['fixed_moment_id'] = Variable<String>(fixedMomentId);
    }
    map['exclude_sensitive'] = Variable<bool>(excludeSensitive);
    map['exclude_hidden_from_widget'] = Variable<bool>(excludeHiddenFromWidget);
    map['include_deleted'] = Variable<bool>(includeDeleted);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MomentWidgetConfigsCompanion toCompanion(bool nullToAbsent) {
    return MomentWidgetConfigsCompanion(
      id: Value(id),
      mode: Value(mode),
      fixedMomentId: fixedMomentId == null && nullToAbsent
          ? const Value.absent()
          : Value(fixedMomentId),
      excludeSensitive: Value(excludeSensitive),
      excludeHiddenFromWidget: Value(excludeHiddenFromWidget),
      includeDeleted: Value(includeDeleted),
      updatedAt: Value(updatedAt),
    );
  }

  factory MomentWidgetConfig.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MomentWidgetConfig(
      id: serializer.fromJson<String>(json['id']),
      mode: serializer.fromJson<String>(json['mode']),
      fixedMomentId: serializer.fromJson<String?>(json['fixedMomentId']),
      excludeSensitive: serializer.fromJson<bool>(json['excludeSensitive']),
      excludeHiddenFromWidget: serializer.fromJson<bool>(
        json['excludeHiddenFromWidget'],
      ),
      includeDeleted: serializer.fromJson<bool>(json['includeDeleted']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mode': serializer.toJson<String>(mode),
      'fixedMomentId': serializer.toJson<String?>(fixedMomentId),
      'excludeSensitive': serializer.toJson<bool>(excludeSensitive),
      'excludeHiddenFromWidget': serializer.toJson<bool>(
        excludeHiddenFromWidget,
      ),
      'includeDeleted': serializer.toJson<bool>(includeDeleted),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MomentWidgetConfig copyWith({
    String? id,
    String? mode,
    Value<String?> fixedMomentId = const Value.absent(),
    bool? excludeSensitive,
    bool? excludeHiddenFromWidget,
    bool? includeDeleted,
    DateTime? updatedAt,
  }) => MomentWidgetConfig(
    id: id ?? this.id,
    mode: mode ?? this.mode,
    fixedMomentId: fixedMomentId.present
        ? fixedMomentId.value
        : this.fixedMomentId,
    excludeSensitive: excludeSensitive ?? this.excludeSensitive,
    excludeHiddenFromWidget:
        excludeHiddenFromWidget ?? this.excludeHiddenFromWidget,
    includeDeleted: includeDeleted ?? this.includeDeleted,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MomentWidgetConfig copyWithCompanion(MomentWidgetConfigsCompanion data) {
    return MomentWidgetConfig(
      id: data.id.present ? data.id.value : this.id,
      mode: data.mode.present ? data.mode.value : this.mode,
      fixedMomentId: data.fixedMomentId.present
          ? data.fixedMomentId.value
          : this.fixedMomentId,
      excludeSensitive: data.excludeSensitive.present
          ? data.excludeSensitive.value
          : this.excludeSensitive,
      excludeHiddenFromWidget: data.excludeHiddenFromWidget.present
          ? data.excludeHiddenFromWidget.value
          : this.excludeHiddenFromWidget,
      includeDeleted: data.includeDeleted.present
          ? data.includeDeleted.value
          : this.includeDeleted,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MomentWidgetConfig(')
          ..write('id: $id, ')
          ..write('mode: $mode, ')
          ..write('fixedMomentId: $fixedMomentId, ')
          ..write('excludeSensitive: $excludeSensitive, ')
          ..write('excludeHiddenFromWidget: $excludeHiddenFromWidget, ')
          ..write('includeDeleted: $includeDeleted, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    mode,
    fixedMomentId,
    excludeSensitive,
    excludeHiddenFromWidget,
    includeDeleted,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MomentWidgetConfig &&
          other.id == this.id &&
          other.mode == this.mode &&
          other.fixedMomentId == this.fixedMomentId &&
          other.excludeSensitive == this.excludeSensitive &&
          other.excludeHiddenFromWidget == this.excludeHiddenFromWidget &&
          other.includeDeleted == this.includeDeleted &&
          other.updatedAt == this.updatedAt);
}

class MomentWidgetConfigsCompanion extends UpdateCompanion<MomentWidgetConfig> {
  final Value<String> id;
  final Value<String> mode;
  final Value<String?> fixedMomentId;
  final Value<bool> excludeSensitive;
  final Value<bool> excludeHiddenFromWidget;
  final Value<bool> includeDeleted;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MomentWidgetConfigsCompanion({
    this.id = const Value.absent(),
    this.mode = const Value.absent(),
    this.fixedMomentId = const Value.absent(),
    this.excludeSensitive = const Value.absent(),
    this.excludeHiddenFromWidget = const Value.absent(),
    this.includeDeleted = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MomentWidgetConfigsCompanion.insert({
    required String id,
    required String mode,
    this.fixedMomentId = const Value.absent(),
    this.excludeSensitive = const Value.absent(),
    this.excludeHiddenFromWidget = const Value.absent(),
    this.includeDeleted = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       mode = Value(mode),
       updatedAt = Value(updatedAt);
  static Insertable<MomentWidgetConfig> custom({
    Expression<String>? id,
    Expression<String>? mode,
    Expression<String>? fixedMomentId,
    Expression<bool>? excludeSensitive,
    Expression<bool>? excludeHiddenFromWidget,
    Expression<bool>? includeDeleted,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mode != null) 'mode': mode,
      if (fixedMomentId != null) 'fixed_moment_id': fixedMomentId,
      if (excludeSensitive != null) 'exclude_sensitive': excludeSensitive,
      if (excludeHiddenFromWidget != null)
        'exclude_hidden_from_widget': excludeHiddenFromWidget,
      if (includeDeleted != null) 'include_deleted': includeDeleted,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MomentWidgetConfigsCompanion copyWith({
    Value<String>? id,
    Value<String>? mode,
    Value<String?>? fixedMomentId,
    Value<bool>? excludeSensitive,
    Value<bool>? excludeHiddenFromWidget,
    Value<bool>? includeDeleted,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MomentWidgetConfigsCompanion(
      id: id ?? this.id,
      mode: mode ?? this.mode,
      fixedMomentId: fixedMomentId ?? this.fixedMomentId,
      excludeSensitive: excludeSensitive ?? this.excludeSensitive,
      excludeHiddenFromWidget:
          excludeHiddenFromWidget ?? this.excludeHiddenFromWidget,
      includeDeleted: includeDeleted ?? this.includeDeleted,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (fixedMomentId.present) {
      map['fixed_moment_id'] = Variable<String>(fixedMomentId.value);
    }
    if (excludeSensitive.present) {
      map['exclude_sensitive'] = Variable<bool>(excludeSensitive.value);
    }
    if (excludeHiddenFromWidget.present) {
      map['exclude_hidden_from_widget'] = Variable<bool>(
        excludeHiddenFromWidget.value,
      );
    }
    if (includeDeleted.present) {
      map['include_deleted'] = Variable<bool>(includeDeleted.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MomentWidgetConfigsCompanion(')
          ..write('id: $id, ')
          ..write('mode: $mode, ')
          ..write('fixedMomentId: $fixedMomentId, ')
          ..write('excludeSensitive: $excludeSensitive, ')
          ..write('excludeHiddenFromWidget: $excludeHiddenFromWidget, ')
          ..write('includeDeleted: $includeDeleted, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const AppSetting({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith({String? key, String? value, DateTime? updatedAt}) =>
      AppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MomentMoodPacksTable momentMoodPacks = $MomentMoodPacksTable(
    this,
  );
  late final $MomentMoodsTable momentMoods = $MomentMoodsTable(this);
  late final $MomentTonePacksTable momentTonePacks = $MomentTonePacksTable(
    this,
  );
  late final $MomentTonesTable momentTones = $MomentTonesTable(this);
  late final $MomentsTable moments = $MomentsTable(this);
  late final $MomentAssetsTable momentAssets = $MomentAssetsTable(this);
  late final $MomentTagsTable momentTags = $MomentTagsTable(this);
  late final $MomentTagLinksTable momentTagLinks = $MomentTagLinksTable(this);
  late final $MomentCollectionsTable momentCollections =
      $MomentCollectionsTable(this);
  late final $MomentCollectionItemsTable momentCollectionItems =
      $MomentCollectionItemsTable(this);
  late final $MomentWidgetConfigsTable momentWidgetConfigs =
      $MomentWidgetConfigsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    momentMoodPacks,
    momentMoods,
    momentTonePacks,
    momentTones,
    moments,
    momentAssets,
    momentTags,
    momentTagLinks,
    momentCollections,
    momentCollectionItems,
    momentWidgetConfigs,
    appSettings,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'moment_moods',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('moments', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'moment_tones',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('moments', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'moments',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('moment_assets', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'moments',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('moment_tag_links', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'moment_tags',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('moment_tag_links', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'moment_collections',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('moment_collection_items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'moments',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('moment_collection_items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'moments',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('moment_widget_configs', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$MomentMoodPacksTableCreateCompanionBuilder =
    MomentMoodPacksCompanion Function({
      required String id,
      required String code,
      required String name,
      Value<String?> description,
      Value<bool> isBuiltIn,
      Value<bool> isEnabled,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$MomentMoodPacksTableUpdateCompanionBuilder =
    MomentMoodPacksCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> name,
      Value<String?> description,
      Value<bool> isBuiltIn,
      Value<bool> isEnabled,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$MomentMoodPacksTableReferences
    extends
        BaseReferences<_$AppDatabase, $MomentMoodPacksTable, MomentMoodPack> {
  $$MomentMoodPacksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$MomentMoodsTable, List<MomentMood>>
  _momentMoodsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.momentMoods,
    aliasName: $_aliasNameGenerator(
      db.momentMoodPacks.id,
      db.momentMoods.moodPackId,
    ),
  );

  $$MomentMoodsTableProcessedTableManager get momentMoodsRefs {
    final manager = $$MomentMoodsTableTableManager(
      $_db,
      $_db.momentMoods,
    ).filter((f) => f.moodPackId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_momentMoodsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MomentMoodPacksTableFilterComposer
    extends Composer<_$AppDatabase, $MomentMoodPacksTable> {
  $$MomentMoodPacksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBuiltIn => $composableBuilder(
    column: $table.isBuiltIn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> momentMoodsRefs(
    Expression<bool> Function($$MomentMoodsTableFilterComposer f) f,
  ) {
    final $$MomentMoodsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.momentMoods,
      getReferencedColumn: (t) => t.moodPackId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentMoodsTableFilterComposer(
            $db: $db,
            $table: $db.momentMoods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentMoodPacksTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentMoodPacksTable> {
  $$MomentMoodPacksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBuiltIn => $composableBuilder(
    column: $table.isBuiltIn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MomentMoodPacksTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentMoodPacksTable> {
  $$MomentMoodPacksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isBuiltIn =>
      $composableBuilder(column: $table.isBuiltIn, builder: (column) => column);

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> momentMoodsRefs<T extends Object>(
    Expression<T> Function($$MomentMoodsTableAnnotationComposer a) f,
  ) {
    final $$MomentMoodsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.momentMoods,
      getReferencedColumn: (t) => t.moodPackId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentMoodsTableAnnotationComposer(
            $db: $db,
            $table: $db.momentMoods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentMoodPacksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentMoodPacksTable,
          MomentMoodPack,
          $$MomentMoodPacksTableFilterComposer,
          $$MomentMoodPacksTableOrderingComposer,
          $$MomentMoodPacksTableAnnotationComposer,
          $$MomentMoodPacksTableCreateCompanionBuilder,
          $$MomentMoodPacksTableUpdateCompanionBuilder,
          (MomentMoodPack, $$MomentMoodPacksTableReferences),
          MomentMoodPack,
          PrefetchHooks Function({bool momentMoodsRefs})
        > {
  $$MomentMoodPacksTableTableManager(
    _$AppDatabase db,
    $MomentMoodPacksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MomentMoodPacksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MomentMoodPacksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MomentMoodPacksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isBuiltIn = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentMoodPacksCompanion(
                id: id,
                code: code,
                name: name,
                description: description,
                isBuiltIn: isBuiltIn,
                isEnabled: isEnabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<bool> isBuiltIn = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => MomentMoodPacksCompanion.insert(
                id: id,
                code: code,
                name: name,
                description: description,
                isBuiltIn: isBuiltIn,
                isEnabled: isEnabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MomentMoodPacksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({momentMoodsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (momentMoodsRefs) db.momentMoods],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (momentMoodsRefs)
                    await $_getPrefetchedData<
                      MomentMoodPack,
                      $MomentMoodPacksTable,
                      MomentMood
                    >(
                      currentTable: table,
                      referencedTable: $$MomentMoodPacksTableReferences
                          ._momentMoodsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MomentMoodPacksTableReferences(
                            db,
                            table,
                            p0,
                          ).momentMoodsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.moodPackId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MomentMoodPacksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentMoodPacksTable,
      MomentMoodPack,
      $$MomentMoodPacksTableFilterComposer,
      $$MomentMoodPacksTableOrderingComposer,
      $$MomentMoodPacksTableAnnotationComposer,
      $$MomentMoodPacksTableCreateCompanionBuilder,
      $$MomentMoodPacksTableUpdateCompanionBuilder,
      (MomentMoodPack, $$MomentMoodPacksTableReferences),
      MomentMoodPack,
      PrefetchHooks Function({bool momentMoodsRefs})
    >;
typedef $$MomentMoodsTableCreateCompanionBuilder =
    MomentMoodsCompanion Function({
      required String id,
      required String code,
      required String moodPackId,
      required String name,
      required String emoji,
      required String key,
      Value<String?> colorHex,
      Value<bool> isDefault,
      Value<bool> isArchived,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$MomentMoodsTableUpdateCompanionBuilder =
    MomentMoodsCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> moodPackId,
      Value<String> name,
      Value<String> emoji,
      Value<String> key,
      Value<String?> colorHex,
      Value<bool> isDefault,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$MomentMoodsTableReferences
    extends BaseReferences<_$AppDatabase, $MomentMoodsTable, MomentMood> {
  $$MomentMoodsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MomentMoodPacksTable _moodPackIdTable(_$AppDatabase db) =>
      db.momentMoodPacks.createAlias(
        $_aliasNameGenerator(db.momentMoods.moodPackId, db.momentMoodPacks.id),
      );

  $$MomentMoodPacksTableProcessedTableManager get moodPackId {
    final $_column = $_itemColumn<String>('mood_pack_id')!;

    final manager = $$MomentMoodPacksTableTableManager(
      $_db,
      $_db.momentMoodPacks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_moodPackIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MomentsTable, List<Moment>> _momentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.moments,
    aliasName: $_aliasNameGenerator(db.momentMoods.id, db.moments.moodId),
  );

  $$MomentsTableProcessedTableManager get momentsRefs {
    final manager = $$MomentsTableTableManager(
      $_db,
      $_db.moments,
    ).filter((f) => f.moodId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_momentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MomentMoodsTableFilterComposer
    extends Composer<_$AppDatabase, $MomentMoodsTable> {
  $$MomentMoodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MomentMoodPacksTableFilterComposer get moodPackId {
    final $$MomentMoodPacksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moodPackId,
      referencedTable: $db.momentMoodPacks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentMoodPacksTableFilterComposer(
            $db: $db,
            $table: $db.momentMoodPacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> momentsRefs(
    Expression<bool> Function($$MomentsTableFilterComposer f) f,
  ) {
    final $$MomentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.moodId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableFilterComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentMoodsTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentMoodsTable> {
  $$MomentMoodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MomentMoodPacksTableOrderingComposer get moodPackId {
    final $$MomentMoodPacksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moodPackId,
      referencedTable: $db.momentMoodPacks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentMoodPacksTableOrderingComposer(
            $db: $db,
            $table: $db.momentMoodPacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentMoodsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentMoodsTable> {
  $$MomentMoodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MomentMoodPacksTableAnnotationComposer get moodPackId {
    final $$MomentMoodPacksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moodPackId,
      referencedTable: $db.momentMoodPacks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentMoodPacksTableAnnotationComposer(
            $db: $db,
            $table: $db.momentMoodPacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> momentsRefs<T extends Object>(
    Expression<T> Function($$MomentsTableAnnotationComposer a) f,
  ) {
    final $$MomentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.moodId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableAnnotationComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentMoodsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentMoodsTable,
          MomentMood,
          $$MomentMoodsTableFilterComposer,
          $$MomentMoodsTableOrderingComposer,
          $$MomentMoodsTableAnnotationComposer,
          $$MomentMoodsTableCreateCompanionBuilder,
          $$MomentMoodsTableUpdateCompanionBuilder,
          (MomentMood, $$MomentMoodsTableReferences),
          MomentMood,
          PrefetchHooks Function({bool moodPackId, bool momentsRefs})
        > {
  $$MomentMoodsTableTableManager(_$AppDatabase db, $MomentMoodsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MomentMoodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MomentMoodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MomentMoodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> moodPackId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> emoji = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String?> colorHex = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentMoodsCompanion(
                id: id,
                code: code,
                moodPackId: moodPackId,
                name: name,
                emoji: emoji,
                key: key,
                colorHex: colorHex,
                isDefault: isDefault,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String moodPackId,
                required String name,
                required String emoji,
                required String key,
                Value<String?> colorHex = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => MomentMoodsCompanion.insert(
                id: id,
                code: code,
                moodPackId: moodPackId,
                name: name,
                emoji: emoji,
                key: key,
                colorHex: colorHex,
                isDefault: isDefault,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MomentMoodsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({moodPackId = false, momentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (momentsRefs) db.moments],
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
                    if (moodPackId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.moodPackId,
                                referencedTable: $$MomentMoodsTableReferences
                                    ._moodPackIdTable(db),
                                referencedColumn: $$MomentMoodsTableReferences
                                    ._moodPackIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (momentsRefs)
                    await $_getPrefetchedData<
                      MomentMood,
                      $MomentMoodsTable,
                      Moment
                    >(
                      currentTable: table,
                      referencedTable: $$MomentMoodsTableReferences
                          ._momentsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MomentMoodsTableReferences(
                            db,
                            table,
                            p0,
                          ).momentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.moodId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MomentMoodsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentMoodsTable,
      MomentMood,
      $$MomentMoodsTableFilterComposer,
      $$MomentMoodsTableOrderingComposer,
      $$MomentMoodsTableAnnotationComposer,
      $$MomentMoodsTableCreateCompanionBuilder,
      $$MomentMoodsTableUpdateCompanionBuilder,
      (MomentMood, $$MomentMoodsTableReferences),
      MomentMood,
      PrefetchHooks Function({bool moodPackId, bool momentsRefs})
    >;
typedef $$MomentTonePacksTableCreateCompanionBuilder =
    MomentTonePacksCompanion Function({
      required String id,
      required String code,
      required String name,
      Value<String?> description,
      Value<bool> isBuiltIn,
      Value<bool> isEnabled,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$MomentTonePacksTableUpdateCompanionBuilder =
    MomentTonePacksCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> name,
      Value<String?> description,
      Value<bool> isBuiltIn,
      Value<bool> isEnabled,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$MomentTonePacksTableReferences
    extends
        BaseReferences<_$AppDatabase, $MomentTonePacksTable, MomentTonePack> {
  $$MomentTonePacksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$MomentTonesTable, List<MomentTone>>
  _momentTonesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.momentTones,
    aliasName: $_aliasNameGenerator(
      db.momentTonePacks.id,
      db.momentTones.tonePackId,
    ),
  );

  $$MomentTonesTableProcessedTableManager get momentTonesRefs {
    final manager = $$MomentTonesTableTableManager(
      $_db,
      $_db.momentTones,
    ).filter((f) => f.tonePackId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_momentTonesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MomentTonePacksTableFilterComposer
    extends Composer<_$AppDatabase, $MomentTonePacksTable> {
  $$MomentTonePacksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBuiltIn => $composableBuilder(
    column: $table.isBuiltIn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> momentTonesRefs(
    Expression<bool> Function($$MomentTonesTableFilterComposer f) f,
  ) {
    final $$MomentTonesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.momentTones,
      getReferencedColumn: (t) => t.tonePackId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTonesTableFilterComposer(
            $db: $db,
            $table: $db.momentTones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentTonePacksTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentTonePacksTable> {
  $$MomentTonePacksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBuiltIn => $composableBuilder(
    column: $table.isBuiltIn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MomentTonePacksTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentTonePacksTable> {
  $$MomentTonePacksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isBuiltIn =>
      $composableBuilder(column: $table.isBuiltIn, builder: (column) => column);

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> momentTonesRefs<T extends Object>(
    Expression<T> Function($$MomentTonesTableAnnotationComposer a) f,
  ) {
    final $$MomentTonesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.momentTones,
      getReferencedColumn: (t) => t.tonePackId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTonesTableAnnotationComposer(
            $db: $db,
            $table: $db.momentTones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentTonePacksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentTonePacksTable,
          MomentTonePack,
          $$MomentTonePacksTableFilterComposer,
          $$MomentTonePacksTableOrderingComposer,
          $$MomentTonePacksTableAnnotationComposer,
          $$MomentTonePacksTableCreateCompanionBuilder,
          $$MomentTonePacksTableUpdateCompanionBuilder,
          (MomentTonePack, $$MomentTonePacksTableReferences),
          MomentTonePack,
          PrefetchHooks Function({bool momentTonesRefs})
        > {
  $$MomentTonePacksTableTableManager(
    _$AppDatabase db,
    $MomentTonePacksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MomentTonePacksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MomentTonePacksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MomentTonePacksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isBuiltIn = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentTonePacksCompanion(
                id: id,
                code: code,
                name: name,
                description: description,
                isBuiltIn: isBuiltIn,
                isEnabled: isEnabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<bool> isBuiltIn = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => MomentTonePacksCompanion.insert(
                id: id,
                code: code,
                name: name,
                description: description,
                isBuiltIn: isBuiltIn,
                isEnabled: isEnabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MomentTonePacksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({momentTonesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (momentTonesRefs) db.momentTones],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (momentTonesRefs)
                    await $_getPrefetchedData<
                      MomentTonePack,
                      $MomentTonePacksTable,
                      MomentTone
                    >(
                      currentTable: table,
                      referencedTable: $$MomentTonePacksTableReferences
                          ._momentTonesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MomentTonePacksTableReferences(
                            db,
                            table,
                            p0,
                          ).momentTonesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tonePackId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MomentTonePacksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentTonePacksTable,
      MomentTonePack,
      $$MomentTonePacksTableFilterComposer,
      $$MomentTonePacksTableOrderingComposer,
      $$MomentTonePacksTableAnnotationComposer,
      $$MomentTonePacksTableCreateCompanionBuilder,
      $$MomentTonePacksTableUpdateCompanionBuilder,
      (MomentTonePack, $$MomentTonePacksTableReferences),
      MomentTonePack,
      PrefetchHooks Function({bool momentTonesRefs})
    >;
typedef $$MomentTonesTableCreateCompanionBuilder =
    MomentTonesCompanion Function({
      required String id,
      required String code,
      required String tonePackId,
      required String name,
      required String key,
      required String lightColorHex,
      Value<String?> darkColorHex,
      Value<int> sortOrder,
      Value<bool> isDefault,
      Value<bool> isArchived,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$MomentTonesTableUpdateCompanionBuilder =
    MomentTonesCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> tonePackId,
      Value<String> name,
      Value<String> key,
      Value<String> lightColorHex,
      Value<String?> darkColorHex,
      Value<int> sortOrder,
      Value<bool> isDefault,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$MomentTonesTableReferences
    extends BaseReferences<_$AppDatabase, $MomentTonesTable, MomentTone> {
  $$MomentTonesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MomentTonePacksTable _tonePackIdTable(_$AppDatabase db) =>
      db.momentTonePacks.createAlias(
        $_aliasNameGenerator(db.momentTones.tonePackId, db.momentTonePacks.id),
      );

  $$MomentTonePacksTableProcessedTableManager get tonePackId {
    final $_column = $_itemColumn<String>('tone_pack_id')!;

    final manager = $$MomentTonePacksTableTableManager(
      $_db,
      $_db.momentTonePacks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tonePackIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MomentsTable, List<Moment>> _momentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.moments,
    aliasName: $_aliasNameGenerator(db.momentTones.id, db.moments.toneId),
  );

  $$MomentsTableProcessedTableManager get momentsRefs {
    final manager = $$MomentsTableTableManager(
      $_db,
      $_db.moments,
    ).filter((f) => f.toneId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_momentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MomentTonesTableFilterComposer
    extends Composer<_$AppDatabase, $MomentTonesTable> {
  $$MomentTonesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lightColorHex => $composableBuilder(
    column: $table.lightColorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get darkColorHex => $composableBuilder(
    column: $table.darkColorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MomentTonePacksTableFilterComposer get tonePackId {
    final $$MomentTonePacksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tonePackId,
      referencedTable: $db.momentTonePacks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTonePacksTableFilterComposer(
            $db: $db,
            $table: $db.momentTonePacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> momentsRefs(
    Expression<bool> Function($$MomentsTableFilterComposer f) f,
  ) {
    final $$MomentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.toneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableFilterComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentTonesTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentTonesTable> {
  $$MomentTonesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lightColorHex => $composableBuilder(
    column: $table.lightColorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get darkColorHex => $composableBuilder(
    column: $table.darkColorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MomentTonePacksTableOrderingComposer get tonePackId {
    final $$MomentTonePacksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tonePackId,
      referencedTable: $db.momentTonePacks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTonePacksTableOrderingComposer(
            $db: $db,
            $table: $db.momentTonePacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentTonesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentTonesTable> {
  $$MomentTonesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get lightColorHex => $composableBuilder(
    column: $table.lightColorHex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get darkColorHex => $composableBuilder(
    column: $table.darkColorHex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MomentTonePacksTableAnnotationComposer get tonePackId {
    final $$MomentTonePacksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tonePackId,
      referencedTable: $db.momentTonePacks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTonePacksTableAnnotationComposer(
            $db: $db,
            $table: $db.momentTonePacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> momentsRefs<T extends Object>(
    Expression<T> Function($$MomentsTableAnnotationComposer a) f,
  ) {
    final $$MomentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.toneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableAnnotationComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentTonesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentTonesTable,
          MomentTone,
          $$MomentTonesTableFilterComposer,
          $$MomentTonesTableOrderingComposer,
          $$MomentTonesTableAnnotationComposer,
          $$MomentTonesTableCreateCompanionBuilder,
          $$MomentTonesTableUpdateCompanionBuilder,
          (MomentTone, $$MomentTonesTableReferences),
          MomentTone,
          PrefetchHooks Function({bool tonePackId, bool momentsRefs})
        > {
  $$MomentTonesTableTableManager(_$AppDatabase db, $MomentTonesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MomentTonesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MomentTonesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MomentTonesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> tonePackId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> lightColorHex = const Value.absent(),
                Value<String?> darkColorHex = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentTonesCompanion(
                id: id,
                code: code,
                tonePackId: tonePackId,
                name: name,
                key: key,
                lightColorHex: lightColorHex,
                darkColorHex: darkColorHex,
                sortOrder: sortOrder,
                isDefault: isDefault,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String tonePackId,
                required String name,
                required String key,
                required String lightColorHex,
                Value<String?> darkColorHex = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => MomentTonesCompanion.insert(
                id: id,
                code: code,
                tonePackId: tonePackId,
                name: name,
                key: key,
                lightColorHex: lightColorHex,
                darkColorHex: darkColorHex,
                sortOrder: sortOrder,
                isDefault: isDefault,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MomentTonesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tonePackId = false, momentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (momentsRefs) db.moments],
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
                    if (tonePackId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tonePackId,
                                referencedTable: $$MomentTonesTableReferences
                                    ._tonePackIdTable(db),
                                referencedColumn: $$MomentTonesTableReferences
                                    ._tonePackIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (momentsRefs)
                    await $_getPrefetchedData<
                      MomentTone,
                      $MomentTonesTable,
                      Moment
                    >(
                      currentTable: table,
                      referencedTable: $$MomentTonesTableReferences
                          ._momentsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MomentTonesTableReferences(
                            db,
                            table,
                            p0,
                          ).momentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.toneId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MomentTonesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentTonesTable,
      MomentTone,
      $$MomentTonesTableFilterComposer,
      $$MomentTonesTableOrderingComposer,
      $$MomentTonesTableAnnotationComposer,
      $$MomentTonesTableCreateCompanionBuilder,
      $$MomentTonesTableUpdateCompanionBuilder,
      (MomentTone, $$MomentTonesTableReferences),
      MomentTone,
      PrefetchHooks Function({bool tonePackId, bool momentsRefs})
    >;
typedef $$MomentsTableCreateCompanionBuilder =
    MomentsCompanion Function({
      required String id,
      Value<String?> title,
      Value<String?> note,
      Value<String?> coverAssetId,
      Value<String?> moodId,
      required DateTime momentDate,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<String?> locationName,
      Value<String?> address,
      Value<String?> city,
      Value<String?> country,
      Value<bool> isFavorite,
      Value<bool> isPinned,
      Value<bool> isHiddenFromWidget,
      required String deviceId,
      Value<int> schemaVersion,
      Value<bool> isLocked,
      Value<bool> isSensitive,
      Value<String?> toneId,
      Value<int> rowid,
    });
typedef $$MomentsTableUpdateCompanionBuilder =
    MomentsCompanion Function({
      Value<String> id,
      Value<String?> title,
      Value<String?> note,
      Value<String?> coverAssetId,
      Value<String?> moodId,
      Value<DateTime> momentDate,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<String?> locationName,
      Value<String?> address,
      Value<String?> city,
      Value<String?> country,
      Value<bool> isFavorite,
      Value<bool> isPinned,
      Value<bool> isHiddenFromWidget,
      Value<String> deviceId,
      Value<int> schemaVersion,
      Value<bool> isLocked,
      Value<bool> isSensitive,
      Value<String?> toneId,
      Value<int> rowid,
    });

final class $$MomentsTableReferences
    extends BaseReferences<_$AppDatabase, $MomentsTable, Moment> {
  $$MomentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MomentMoodsTable _moodIdTable(_$AppDatabase db) => db.momentMoods
      .createAlias($_aliasNameGenerator(db.moments.moodId, db.momentMoods.id));

  $$MomentMoodsTableProcessedTableManager? get moodId {
    final $_column = $_itemColumn<String>('mood_id');
    if ($_column == null) return null;
    final manager = $$MomentMoodsTableTableManager(
      $_db,
      $_db.momentMoods,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_moodIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MomentTonesTable _toneIdTable(_$AppDatabase db) => db.momentTones
      .createAlias($_aliasNameGenerator(db.moments.toneId, db.momentTones.id));

  $$MomentTonesTableProcessedTableManager? get toneId {
    final $_column = $_itemColumn<String>('tone_id');
    if ($_column == null) return null;
    final manager = $$MomentTonesTableTableManager(
      $_db,
      $_db.momentTones,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_toneIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MomentAssetsTable, List<MomentAsset>>
  _momentAssetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.momentAssets,
    aliasName: $_aliasNameGenerator(db.moments.id, db.momentAssets.momentId),
  );

  $$MomentAssetsTableProcessedTableManager get momentAssetsRefs {
    final manager = $$MomentAssetsTableTableManager(
      $_db,
      $_db.momentAssets,
    ).filter((f) => f.momentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_momentAssetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MomentTagLinksTable, List<MomentTagLink>>
  _momentTagLinksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.momentTagLinks,
    aliasName: $_aliasNameGenerator(db.moments.id, db.momentTagLinks.momentId),
  );

  $$MomentTagLinksTableProcessedTableManager get momentTagLinksRefs {
    final manager = $$MomentTagLinksTableTableManager(
      $_db,
      $_db.momentTagLinks,
    ).filter((f) => f.momentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_momentTagLinksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $MomentCollectionItemsTable,
    List<MomentCollectionItem>
  >
  _momentCollectionItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.momentCollectionItems,
        aliasName: $_aliasNameGenerator(
          db.moments.id,
          db.momentCollectionItems.momentId,
        ),
      );

  $$MomentCollectionItemsTableProcessedTableManager
  get momentCollectionItemsRefs {
    final manager = $$MomentCollectionItemsTableTableManager(
      $_db,
      $_db.momentCollectionItems,
    ).filter((f) => f.momentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _momentCollectionItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $MomentWidgetConfigsTable,
    List<MomentWidgetConfig>
  >
  _momentWidgetConfigsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.momentWidgetConfigs,
        aliasName: $_aliasNameGenerator(
          db.moments.id,
          db.momentWidgetConfigs.fixedMomentId,
        ),
      );

  $$MomentWidgetConfigsTableProcessedTableManager get momentWidgetConfigsRefs {
    final manager = $$MomentWidgetConfigsTableTableManager(
      $_db,
      $_db.momentWidgetConfigs,
    ).filter((f) => f.fixedMomentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _momentWidgetConfigsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MomentsTableFilterComposer
    extends Composer<_$AppDatabase, $MomentsTable> {
  $$MomentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverAssetId => $composableBuilder(
    column: $table.coverAssetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get momentDate => $composableBuilder(
    column: $table.momentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isHiddenFromWidget => $composableBuilder(
    column: $table.isHiddenFromWidget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLocked => $composableBuilder(
    column: $table.isLocked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSensitive => $composableBuilder(
    column: $table.isSensitive,
    builder: (column) => ColumnFilters(column),
  );

  $$MomentMoodsTableFilterComposer get moodId {
    final $$MomentMoodsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moodId,
      referencedTable: $db.momentMoods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentMoodsTableFilterComposer(
            $db: $db,
            $table: $db.momentMoods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MomentTonesTableFilterComposer get toneId {
    final $$MomentTonesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toneId,
      referencedTable: $db.momentTones,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTonesTableFilterComposer(
            $db: $db,
            $table: $db.momentTones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> momentAssetsRefs(
    Expression<bool> Function($$MomentAssetsTableFilterComposer f) f,
  ) {
    final $$MomentAssetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.momentAssets,
      getReferencedColumn: (t) => t.momentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentAssetsTableFilterComposer(
            $db: $db,
            $table: $db.momentAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> momentTagLinksRefs(
    Expression<bool> Function($$MomentTagLinksTableFilterComposer f) f,
  ) {
    final $$MomentTagLinksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.momentTagLinks,
      getReferencedColumn: (t) => t.momentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTagLinksTableFilterComposer(
            $db: $db,
            $table: $db.momentTagLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> momentCollectionItemsRefs(
    Expression<bool> Function($$MomentCollectionItemsTableFilterComposer f) f,
  ) {
    final $$MomentCollectionItemsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.momentCollectionItems,
          getReferencedColumn: (t) => t.momentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MomentCollectionItemsTableFilterComposer(
                $db: $db,
                $table: $db.momentCollectionItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> momentWidgetConfigsRefs(
    Expression<bool> Function($$MomentWidgetConfigsTableFilterComposer f) f,
  ) {
    final $$MomentWidgetConfigsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.momentWidgetConfigs,
      getReferencedColumn: (t) => t.fixedMomentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentWidgetConfigsTableFilterComposer(
            $db: $db,
            $table: $db.momentWidgetConfigs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentsTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentsTable> {
  $$MomentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverAssetId => $composableBuilder(
    column: $table.coverAssetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get momentDate => $composableBuilder(
    column: $table.momentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isHiddenFromWidget => $composableBuilder(
    column: $table.isHiddenFromWidget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLocked => $composableBuilder(
    column: $table.isLocked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSensitive => $composableBuilder(
    column: $table.isSensitive,
    builder: (column) => ColumnOrderings(column),
  );

  $$MomentMoodsTableOrderingComposer get moodId {
    final $$MomentMoodsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moodId,
      referencedTable: $db.momentMoods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentMoodsTableOrderingComposer(
            $db: $db,
            $table: $db.momentMoods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MomentTonesTableOrderingComposer get toneId {
    final $$MomentTonesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toneId,
      referencedTable: $db.momentTones,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTonesTableOrderingComposer(
            $db: $db,
            $table: $db.momentTones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentsTable> {
  $$MomentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get coverAssetId => $composableBuilder(
    column: $table.coverAssetId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get momentDate => $composableBuilder(
    column: $table.momentDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPinned =>
      $composableBuilder(column: $table.isPinned, builder: (column) => column);

  GeneratedColumn<bool> get isHiddenFromWidget => $composableBuilder(
    column: $table.isHiddenFromWidget,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isLocked =>
      $composableBuilder(column: $table.isLocked, builder: (column) => column);

  GeneratedColumn<bool> get isSensitive => $composableBuilder(
    column: $table.isSensitive,
    builder: (column) => column,
  );

  $$MomentMoodsTableAnnotationComposer get moodId {
    final $$MomentMoodsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moodId,
      referencedTable: $db.momentMoods,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentMoodsTableAnnotationComposer(
            $db: $db,
            $table: $db.momentMoods,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MomentTonesTableAnnotationComposer get toneId {
    final $$MomentTonesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toneId,
      referencedTable: $db.momentTones,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTonesTableAnnotationComposer(
            $db: $db,
            $table: $db.momentTones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> momentAssetsRefs<T extends Object>(
    Expression<T> Function($$MomentAssetsTableAnnotationComposer a) f,
  ) {
    final $$MomentAssetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.momentAssets,
      getReferencedColumn: (t) => t.momentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentAssetsTableAnnotationComposer(
            $db: $db,
            $table: $db.momentAssets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> momentTagLinksRefs<T extends Object>(
    Expression<T> Function($$MomentTagLinksTableAnnotationComposer a) f,
  ) {
    final $$MomentTagLinksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.momentTagLinks,
      getReferencedColumn: (t) => t.momentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTagLinksTableAnnotationComposer(
            $db: $db,
            $table: $db.momentTagLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> momentCollectionItemsRefs<T extends Object>(
    Expression<T> Function($$MomentCollectionItemsTableAnnotationComposer a) f,
  ) {
    final $$MomentCollectionItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.momentCollectionItems,
          getReferencedColumn: (t) => t.momentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MomentCollectionItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.momentCollectionItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> momentWidgetConfigsRefs<T extends Object>(
    Expression<T> Function($$MomentWidgetConfigsTableAnnotationComposer a) f,
  ) {
    final $$MomentWidgetConfigsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.momentWidgetConfigs,
          getReferencedColumn: (t) => t.fixedMomentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MomentWidgetConfigsTableAnnotationComposer(
                $db: $db,
                $table: $db.momentWidgetConfigs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MomentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentsTable,
          Moment,
          $$MomentsTableFilterComposer,
          $$MomentsTableOrderingComposer,
          $$MomentsTableAnnotationComposer,
          $$MomentsTableCreateCompanionBuilder,
          $$MomentsTableUpdateCompanionBuilder,
          (Moment, $$MomentsTableReferences),
          Moment,
          PrefetchHooks Function({
            bool moodId,
            bool toneId,
            bool momentAssetsRefs,
            bool momentTagLinksRefs,
            bool momentCollectionItemsRefs,
            bool momentWidgetConfigsRefs,
          })
        > {
  $$MomentsTableTableManager(_$AppDatabase db, $MomentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MomentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MomentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MomentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> coverAssetId = const Value.absent(),
                Value<String?> moodId = const Value.absent(),
                Value<DateTime> momentDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String?> locationName = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<bool> isHiddenFromWidget = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<bool> isLocked = const Value.absent(),
                Value<bool> isSensitive = const Value.absent(),
                Value<String?> toneId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentsCompanion(
                id: id,
                title: title,
                note: note,
                coverAssetId: coverAssetId,
                moodId: moodId,
                momentDate: momentDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                latitude: latitude,
                longitude: longitude,
                locationName: locationName,
                address: address,
                city: city,
                country: country,
                isFavorite: isFavorite,
                isPinned: isPinned,
                isHiddenFromWidget: isHiddenFromWidget,
                deviceId: deviceId,
                schemaVersion: schemaVersion,
                isLocked: isLocked,
                isSensitive: isSensitive,
                toneId: toneId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> title = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> coverAssetId = const Value.absent(),
                Value<String?> moodId = const Value.absent(),
                required DateTime momentDate,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String?> locationName = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<bool> isHiddenFromWidget = const Value.absent(),
                required String deviceId,
                Value<int> schemaVersion = const Value.absent(),
                Value<bool> isLocked = const Value.absent(),
                Value<bool> isSensitive = const Value.absent(),
                Value<String?> toneId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentsCompanion.insert(
                id: id,
                title: title,
                note: note,
                coverAssetId: coverAssetId,
                moodId: moodId,
                momentDate: momentDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                latitude: latitude,
                longitude: longitude,
                locationName: locationName,
                address: address,
                city: city,
                country: country,
                isFavorite: isFavorite,
                isPinned: isPinned,
                isHiddenFromWidget: isHiddenFromWidget,
                deviceId: deviceId,
                schemaVersion: schemaVersion,
                isLocked: isLocked,
                isSensitive: isSensitive,
                toneId: toneId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MomentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                moodId = false,
                toneId = false,
                momentAssetsRefs = false,
                momentTagLinksRefs = false,
                momentCollectionItemsRefs = false,
                momentWidgetConfigsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (momentAssetsRefs) db.momentAssets,
                    if (momentTagLinksRefs) db.momentTagLinks,
                    if (momentCollectionItemsRefs) db.momentCollectionItems,
                    if (momentWidgetConfigsRefs) db.momentWidgetConfigs,
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
                        if (moodId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.moodId,
                                    referencedTable: $$MomentsTableReferences
                                        ._moodIdTable(db),
                                    referencedColumn: $$MomentsTableReferences
                                        ._moodIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (toneId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.toneId,
                                    referencedTable: $$MomentsTableReferences
                                        ._toneIdTable(db),
                                    referencedColumn: $$MomentsTableReferences
                                        ._toneIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (momentAssetsRefs)
                        await $_getPrefetchedData<
                          Moment,
                          $MomentsTable,
                          MomentAsset
                        >(
                          currentTable: table,
                          referencedTable: $$MomentsTableReferences
                              ._momentAssetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MomentsTableReferences(
                                db,
                                table,
                                p0,
                              ).momentAssetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.momentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (momentTagLinksRefs)
                        await $_getPrefetchedData<
                          Moment,
                          $MomentsTable,
                          MomentTagLink
                        >(
                          currentTable: table,
                          referencedTable: $$MomentsTableReferences
                              ._momentTagLinksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MomentsTableReferences(
                                db,
                                table,
                                p0,
                              ).momentTagLinksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.momentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (momentCollectionItemsRefs)
                        await $_getPrefetchedData<
                          Moment,
                          $MomentsTable,
                          MomentCollectionItem
                        >(
                          currentTable: table,
                          referencedTable: $$MomentsTableReferences
                              ._momentCollectionItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MomentsTableReferences(
                                db,
                                table,
                                p0,
                              ).momentCollectionItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.momentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (momentWidgetConfigsRefs)
                        await $_getPrefetchedData<
                          Moment,
                          $MomentsTable,
                          MomentWidgetConfig
                        >(
                          currentTable: table,
                          referencedTable: $$MomentsTableReferences
                              ._momentWidgetConfigsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MomentsTableReferences(
                                db,
                                table,
                                p0,
                              ).momentWidgetConfigsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.fixedMomentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MomentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentsTable,
      Moment,
      $$MomentsTableFilterComposer,
      $$MomentsTableOrderingComposer,
      $$MomentsTableAnnotationComposer,
      $$MomentsTableCreateCompanionBuilder,
      $$MomentsTableUpdateCompanionBuilder,
      (Moment, $$MomentsTableReferences),
      Moment,
      PrefetchHooks Function({
        bool moodId,
        bool toneId,
        bool momentAssetsRefs,
        bool momentTagLinksRefs,
        bool momentCollectionItemsRefs,
        bool momentWidgetConfigsRefs,
      })
    >;
typedef $$MomentAssetsTableCreateCompanionBuilder =
    MomentAssetsCompanion Function({
      required String id,
      required String momentId,
      required String type,
      required String path,
      Value<String?> thumbnailPath,
      required int width,
      required int height,
      required int fileSize,
      required int sortOrder,
      Value<int?> durationMs,
      Value<DateTime?> capturedAt,
      Value<String?> mimeType,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool> isEncrypted,
      Value<int?> encryptionVersion,
      Value<String?> checksum,
      Value<int> rowid,
    });
typedef $$MomentAssetsTableUpdateCompanionBuilder =
    MomentAssetsCompanion Function({
      Value<String> id,
      Value<String> momentId,
      Value<String> type,
      Value<String> path,
      Value<String?> thumbnailPath,
      Value<int> width,
      Value<int> height,
      Value<int> fileSize,
      Value<int> sortOrder,
      Value<int?> durationMs,
      Value<DateTime?> capturedAt,
      Value<String?> mimeType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool> isEncrypted,
      Value<int?> encryptionVersion,
      Value<String?> checksum,
      Value<int> rowid,
    });

final class $$MomentAssetsTableReferences
    extends BaseReferences<_$AppDatabase, $MomentAssetsTable, MomentAsset> {
  $$MomentAssetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MomentsTable _momentIdTable(_$AppDatabase db) =>
      db.moments.createAlias(
        $_aliasNameGenerator(db.momentAssets.momentId, db.moments.id),
      );

  $$MomentsTableProcessedTableManager get momentId {
    final $_column = $_itemColumn<String>('moment_id')!;

    final manager = $$MomentsTableTableManager(
      $_db,
      $_db.moments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_momentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MomentAssetsTableFilterComposer
    extends Composer<_$AppDatabase, $MomentAssetsTable> {
  $$MomentAssetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEncrypted => $composableBuilder(
    column: $table.isEncrypted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get encryptionVersion => $composableBuilder(
    column: $table.encryptionVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checksum => $composableBuilder(
    column: $table.checksum,
    builder: (column) => ColumnFilters(column),
  );

  $$MomentsTableFilterComposer get momentId {
    final $$MomentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableFilterComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentAssetsTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentAssetsTable> {
  $$MomentAssetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEncrypted => $composableBuilder(
    column: $table.isEncrypted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get encryptionVersion => $composableBuilder(
    column: $table.encryptionVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checksum => $composableBuilder(
    column: $table.checksum,
    builder: (column) => ColumnOrderings(column),
  );

  $$MomentsTableOrderingComposer get momentId {
    final $$MomentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableOrderingComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentAssetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentAssetsTable> {
  $$MomentAssetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => column,
  );

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<int> get fileSize =>
      $composableBuilder(column: $table.fileSize, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get isEncrypted => $composableBuilder(
    column: $table.isEncrypted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get encryptionVersion => $composableBuilder(
    column: $table.encryptionVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);

  $$MomentsTableAnnotationComposer get momentId {
    final $$MomentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableAnnotationComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentAssetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentAssetsTable,
          MomentAsset,
          $$MomentAssetsTableFilterComposer,
          $$MomentAssetsTableOrderingComposer,
          $$MomentAssetsTableAnnotationComposer,
          $$MomentAssetsTableCreateCompanionBuilder,
          $$MomentAssetsTableUpdateCompanionBuilder,
          (MomentAsset, $$MomentAssetsTableReferences),
          MomentAsset,
          PrefetchHooks Function({bool momentId})
        > {
  $$MomentAssetsTableTableManager(_$AppDatabase db, $MomentAssetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MomentAssetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MomentAssetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MomentAssetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> momentId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<String?> thumbnailPath = const Value.absent(),
                Value<int> width = const Value.absent(),
                Value<int> height = const Value.absent(),
                Value<int> fileSize = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int?> durationMs = const Value.absent(),
                Value<DateTime?> capturedAt = const Value.absent(),
                Value<String?> mimeType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool> isEncrypted = const Value.absent(),
                Value<int?> encryptionVersion = const Value.absent(),
                Value<String?> checksum = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentAssetsCompanion(
                id: id,
                momentId: momentId,
                type: type,
                path: path,
                thumbnailPath: thumbnailPath,
                width: width,
                height: height,
                fileSize: fileSize,
                sortOrder: sortOrder,
                durationMs: durationMs,
                capturedAt: capturedAt,
                mimeType: mimeType,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                isEncrypted: isEncrypted,
                encryptionVersion: encryptionVersion,
                checksum: checksum,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String momentId,
                required String type,
                required String path,
                Value<String?> thumbnailPath = const Value.absent(),
                required int width,
                required int height,
                required int fileSize,
                required int sortOrder,
                Value<int?> durationMs = const Value.absent(),
                Value<DateTime?> capturedAt = const Value.absent(),
                Value<String?> mimeType = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool> isEncrypted = const Value.absent(),
                Value<int?> encryptionVersion = const Value.absent(),
                Value<String?> checksum = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentAssetsCompanion.insert(
                id: id,
                momentId: momentId,
                type: type,
                path: path,
                thumbnailPath: thumbnailPath,
                width: width,
                height: height,
                fileSize: fileSize,
                sortOrder: sortOrder,
                durationMs: durationMs,
                capturedAt: capturedAt,
                mimeType: mimeType,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                isEncrypted: isEncrypted,
                encryptionVersion: encryptionVersion,
                checksum: checksum,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MomentAssetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({momentId = false}) {
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
                    if (momentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.momentId,
                                referencedTable: $$MomentAssetsTableReferences
                                    ._momentIdTable(db),
                                referencedColumn: $$MomentAssetsTableReferences
                                    ._momentIdTable(db)
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

typedef $$MomentAssetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentAssetsTable,
      MomentAsset,
      $$MomentAssetsTableFilterComposer,
      $$MomentAssetsTableOrderingComposer,
      $$MomentAssetsTableAnnotationComposer,
      $$MomentAssetsTableCreateCompanionBuilder,
      $$MomentAssetsTableUpdateCompanionBuilder,
      (MomentAsset, $$MomentAssetsTableReferences),
      MomentAsset,
      PrefetchHooks Function({bool momentId})
    >;
typedef $$MomentTagsTableCreateCompanionBuilder =
    MomentTagsCompanion Function({
      required String id,
      required String name,
      required String normalizedName,
      Value<String?> colorHex,
      Value<String?> groupKey,
      Value<int> usageCount,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$MomentTagsTableUpdateCompanionBuilder =
    MomentTagsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> normalizedName,
      Value<String?> colorHex,
      Value<String?> groupKey,
      Value<int> usageCount,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$MomentTagsTableReferences
    extends BaseReferences<_$AppDatabase, $MomentTagsTable, MomentTag> {
  $$MomentTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MomentTagLinksTable, List<MomentTagLink>>
  _momentTagLinksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.momentTagLinks,
    aliasName: $_aliasNameGenerator(db.momentTags.id, db.momentTagLinks.tagId),
  );

  $$MomentTagLinksTableProcessedTableManager get momentTagLinksRefs {
    final manager = $$MomentTagLinksTableTableManager(
      $_db,
      $_db.momentTagLinks,
    ).filter((f) => f.tagId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_momentTagLinksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MomentTagsTableFilterComposer
    extends Composer<_$AppDatabase, $MomentTagsTable> {
  $$MomentTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get normalizedName => $composableBuilder(
    column: $table.normalizedName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupKey => $composableBuilder(
    column: $table.groupKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> momentTagLinksRefs(
    Expression<bool> Function($$MomentTagLinksTableFilterComposer f) f,
  ) {
    final $$MomentTagLinksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.momentTagLinks,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTagLinksTableFilterComposer(
            $db: $db,
            $table: $db.momentTagLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentTagsTable> {
  $$MomentTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get normalizedName => $composableBuilder(
    column: $table.normalizedName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupKey => $composableBuilder(
    column: $table.groupKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MomentTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentTagsTable> {
  $$MomentTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get normalizedName => $composableBuilder(
    column: $table.normalizedName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<String> get groupKey =>
      $composableBuilder(column: $table.groupKey, builder: (column) => column);

  GeneratedColumn<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> momentTagLinksRefs<T extends Object>(
    Expression<T> Function($$MomentTagLinksTableAnnotationComposer a) f,
  ) {
    final $$MomentTagLinksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.momentTagLinks,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTagLinksTableAnnotationComposer(
            $db: $db,
            $table: $db.momentTagLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MomentTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentTagsTable,
          MomentTag,
          $$MomentTagsTableFilterComposer,
          $$MomentTagsTableOrderingComposer,
          $$MomentTagsTableAnnotationComposer,
          $$MomentTagsTableCreateCompanionBuilder,
          $$MomentTagsTableUpdateCompanionBuilder,
          (MomentTag, $$MomentTagsTableReferences),
          MomentTag,
          PrefetchHooks Function({bool momentTagLinksRefs})
        > {
  $$MomentTagsTableTableManager(_$AppDatabase db, $MomentTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MomentTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MomentTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MomentTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> normalizedName = const Value.absent(),
                Value<String?> colorHex = const Value.absent(),
                Value<String?> groupKey = const Value.absent(),
                Value<int> usageCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentTagsCompanion(
                id: id,
                name: name,
                normalizedName: normalizedName,
                colorHex: colorHex,
                groupKey: groupKey,
                usageCount: usageCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String normalizedName,
                Value<String?> colorHex = const Value.absent(),
                Value<String?> groupKey = const Value.absent(),
                Value<int> usageCount = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentTagsCompanion.insert(
                id: id,
                name: name,
                normalizedName: normalizedName,
                colorHex: colorHex,
                groupKey: groupKey,
                usageCount: usageCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MomentTagsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({momentTagLinksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (momentTagLinksRefs) db.momentTagLinks,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (momentTagLinksRefs)
                    await $_getPrefetchedData<
                      MomentTag,
                      $MomentTagsTable,
                      MomentTagLink
                    >(
                      currentTable: table,
                      referencedTable: $$MomentTagsTableReferences
                          ._momentTagLinksRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MomentTagsTableReferences(
                            db,
                            table,
                            p0,
                          ).momentTagLinksRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tagId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MomentTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentTagsTable,
      MomentTag,
      $$MomentTagsTableFilterComposer,
      $$MomentTagsTableOrderingComposer,
      $$MomentTagsTableAnnotationComposer,
      $$MomentTagsTableCreateCompanionBuilder,
      $$MomentTagsTableUpdateCompanionBuilder,
      (MomentTag, $$MomentTagsTableReferences),
      MomentTag,
      PrefetchHooks Function({bool momentTagLinksRefs})
    >;
typedef $$MomentTagLinksTableCreateCompanionBuilder =
    MomentTagLinksCompanion Function({
      required String momentId,
      required String tagId,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$MomentTagLinksTableUpdateCompanionBuilder =
    MomentTagLinksCompanion Function({
      Value<String> momentId,
      Value<String> tagId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$MomentTagLinksTableReferences
    extends BaseReferences<_$AppDatabase, $MomentTagLinksTable, MomentTagLink> {
  $$MomentTagLinksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MomentsTable _momentIdTable(_$AppDatabase db) =>
      db.moments.createAlias(
        $_aliasNameGenerator(db.momentTagLinks.momentId, db.moments.id),
      );

  $$MomentsTableProcessedTableManager get momentId {
    final $_column = $_itemColumn<String>('moment_id')!;

    final manager = $$MomentsTableTableManager(
      $_db,
      $_db.moments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_momentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MomentTagsTable _tagIdTable(_$AppDatabase db) =>
      db.momentTags.createAlias(
        $_aliasNameGenerator(db.momentTagLinks.tagId, db.momentTags.id),
      );

  $$MomentTagsTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<String>('tag_id')!;

    final manager = $$MomentTagsTableTableManager(
      $_db,
      $_db.momentTags,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MomentTagLinksTableFilterComposer
    extends Composer<_$AppDatabase, $MomentTagLinksTable> {
  $$MomentTagLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MomentsTableFilterComposer get momentId {
    final $$MomentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableFilterComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MomentTagsTableFilterComposer get tagId {
    final $$MomentTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.momentTags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTagsTableFilterComposer(
            $db: $db,
            $table: $db.momentTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentTagLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentTagLinksTable> {
  $$MomentTagLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MomentsTableOrderingComposer get momentId {
    final $$MomentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableOrderingComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MomentTagsTableOrderingComposer get tagId {
    final $$MomentTagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.momentTags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTagsTableOrderingComposer(
            $db: $db,
            $table: $db.momentTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentTagLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentTagLinksTable> {
  $$MomentTagLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$MomentsTableAnnotationComposer get momentId {
    final $$MomentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableAnnotationComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MomentTagsTableAnnotationComposer get tagId {
    final $$MomentTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.momentTags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.momentTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentTagLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentTagLinksTable,
          MomentTagLink,
          $$MomentTagLinksTableFilterComposer,
          $$MomentTagLinksTableOrderingComposer,
          $$MomentTagLinksTableAnnotationComposer,
          $$MomentTagLinksTableCreateCompanionBuilder,
          $$MomentTagLinksTableUpdateCompanionBuilder,
          (MomentTagLink, $$MomentTagLinksTableReferences),
          MomentTagLink,
          PrefetchHooks Function({bool momentId, bool tagId})
        > {
  $$MomentTagLinksTableTableManager(
    _$AppDatabase db,
    $MomentTagLinksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MomentTagLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MomentTagLinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MomentTagLinksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> momentId = const Value.absent(),
                Value<String> tagId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentTagLinksCompanion(
                momentId: momentId,
                tagId: tagId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String momentId,
                required String tagId,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => MomentTagLinksCompanion.insert(
                momentId: momentId,
                tagId: tagId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MomentTagLinksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({momentId = false, tagId = false}) {
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
                    if (momentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.momentId,
                                referencedTable: $$MomentTagLinksTableReferences
                                    ._momentIdTable(db),
                                referencedColumn:
                                    $$MomentTagLinksTableReferences
                                        ._momentIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (tagId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagId,
                                referencedTable: $$MomentTagLinksTableReferences
                                    ._tagIdTable(db),
                                referencedColumn:
                                    $$MomentTagLinksTableReferences
                                        ._tagIdTable(db)
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

typedef $$MomentTagLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentTagLinksTable,
      MomentTagLink,
      $$MomentTagLinksTableFilterComposer,
      $$MomentTagLinksTableOrderingComposer,
      $$MomentTagLinksTableAnnotationComposer,
      $$MomentTagLinksTableCreateCompanionBuilder,
      $$MomentTagLinksTableUpdateCompanionBuilder,
      (MomentTagLink, $$MomentTagLinksTableReferences),
      MomentTagLink,
      PrefetchHooks Function({bool momentId, bool tagId})
    >;
typedef $$MomentCollectionsTableCreateCompanionBuilder =
    MomentCollectionsCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<String?> coverAssetId,
      Value<int> sortOrder,
      Value<bool> isPinned,
      Value<bool> isLocked,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });
typedef $$MomentCollectionsTableUpdateCompanionBuilder =
    MomentCollectionsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String?> coverAssetId,
      Value<int> sortOrder,
      Value<bool> isPinned,
      Value<bool> isLocked,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> rowid,
    });

final class $$MomentCollectionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MomentCollectionsTable,
          MomentCollection
        > {
  $$MomentCollectionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $MomentCollectionItemsTable,
    List<MomentCollectionItem>
  >
  _momentCollectionItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.momentCollectionItems,
        aliasName: $_aliasNameGenerator(
          db.momentCollections.id,
          db.momentCollectionItems.collectionId,
        ),
      );

  $$MomentCollectionItemsTableProcessedTableManager
  get momentCollectionItemsRefs {
    final manager = $$MomentCollectionItemsTableTableManager(
      $_db,
      $_db.momentCollectionItems,
    ).filter((f) => f.collectionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _momentCollectionItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MomentCollectionsTableFilterComposer
    extends Composer<_$AppDatabase, $MomentCollectionsTable> {
  $$MomentCollectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverAssetId => $composableBuilder(
    column: $table.coverAssetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLocked => $composableBuilder(
    column: $table.isLocked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> momentCollectionItemsRefs(
    Expression<bool> Function($$MomentCollectionItemsTableFilterComposer f) f,
  ) {
    final $$MomentCollectionItemsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.momentCollectionItems,
          getReferencedColumn: (t) => t.collectionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MomentCollectionItemsTableFilterComposer(
                $db: $db,
                $table: $db.momentCollectionItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MomentCollectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentCollectionsTable> {
  $$MomentCollectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverAssetId => $composableBuilder(
    column: $table.coverAssetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLocked => $composableBuilder(
    column: $table.isLocked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MomentCollectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentCollectionsTable> {
  $$MomentCollectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverAssetId => $composableBuilder(
    column: $table.coverAssetId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isPinned =>
      $composableBuilder(column: $table.isPinned, builder: (column) => column);

  GeneratedColumn<bool> get isLocked =>
      $composableBuilder(column: $table.isLocked, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> momentCollectionItemsRefs<T extends Object>(
    Expression<T> Function($$MomentCollectionItemsTableAnnotationComposer a) f,
  ) {
    final $$MomentCollectionItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.momentCollectionItems,
          getReferencedColumn: (t) => t.collectionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MomentCollectionItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.momentCollectionItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MomentCollectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentCollectionsTable,
          MomentCollection,
          $$MomentCollectionsTableFilterComposer,
          $$MomentCollectionsTableOrderingComposer,
          $$MomentCollectionsTableAnnotationComposer,
          $$MomentCollectionsTableCreateCompanionBuilder,
          $$MomentCollectionsTableUpdateCompanionBuilder,
          (MomentCollection, $$MomentCollectionsTableReferences),
          MomentCollection,
          PrefetchHooks Function({bool momentCollectionItemsRefs})
        > {
  $$MomentCollectionsTableTableManager(
    _$AppDatabase db,
    $MomentCollectionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MomentCollectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MomentCollectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MomentCollectionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> coverAssetId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<bool> isLocked = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentCollectionsCompanion(
                id: id,
                name: name,
                description: description,
                coverAssetId: coverAssetId,
                sortOrder: sortOrder,
                isPinned: isPinned,
                isLocked: isLocked,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> coverAssetId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<bool> isLocked = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentCollectionsCompanion.insert(
                id: id,
                name: name,
                description: description,
                coverAssetId: coverAssetId,
                sortOrder: sortOrder,
                isPinned: isPinned,
                isLocked: isLocked,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MomentCollectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({momentCollectionItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (momentCollectionItemsRefs) db.momentCollectionItems,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (momentCollectionItemsRefs)
                    await $_getPrefetchedData<
                      MomentCollection,
                      $MomentCollectionsTable,
                      MomentCollectionItem
                    >(
                      currentTable: table,
                      referencedTable: $$MomentCollectionsTableReferences
                          ._momentCollectionItemsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MomentCollectionsTableReferences(
                            db,
                            table,
                            p0,
                          ).momentCollectionItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.collectionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MomentCollectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentCollectionsTable,
      MomentCollection,
      $$MomentCollectionsTableFilterComposer,
      $$MomentCollectionsTableOrderingComposer,
      $$MomentCollectionsTableAnnotationComposer,
      $$MomentCollectionsTableCreateCompanionBuilder,
      $$MomentCollectionsTableUpdateCompanionBuilder,
      (MomentCollection, $$MomentCollectionsTableReferences),
      MomentCollection,
      PrefetchHooks Function({bool momentCollectionItemsRefs})
    >;
typedef $$MomentCollectionItemsTableCreateCompanionBuilder =
    MomentCollectionItemsCompanion Function({
      required String collectionId,
      required String momentId,
      Value<int> sortOrder,
      required DateTime addedAt,
      Value<int> rowid,
    });
typedef $$MomentCollectionItemsTableUpdateCompanionBuilder =
    MomentCollectionItemsCompanion Function({
      Value<String> collectionId,
      Value<String> momentId,
      Value<int> sortOrder,
      Value<DateTime> addedAt,
      Value<int> rowid,
    });

final class $$MomentCollectionItemsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MomentCollectionItemsTable,
          MomentCollectionItem
        > {
  $$MomentCollectionItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MomentCollectionsTable _collectionIdTable(_$AppDatabase db) =>
      db.momentCollections.createAlias(
        $_aliasNameGenerator(
          db.momentCollectionItems.collectionId,
          db.momentCollections.id,
        ),
      );

  $$MomentCollectionsTableProcessedTableManager get collectionId {
    final $_column = $_itemColumn<String>('collection_id')!;

    final manager = $$MomentCollectionsTableTableManager(
      $_db,
      $_db.momentCollections,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MomentsTable _momentIdTable(_$AppDatabase db) =>
      db.moments.createAlias(
        $_aliasNameGenerator(db.momentCollectionItems.momentId, db.moments.id),
      );

  $$MomentsTableProcessedTableManager get momentId {
    final $_column = $_itemColumn<String>('moment_id')!;

    final manager = $$MomentsTableTableManager(
      $_db,
      $_db.moments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_momentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MomentCollectionItemsTableFilterComposer
    extends Composer<_$AppDatabase, $MomentCollectionItemsTable> {
  $$MomentCollectionItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MomentCollectionsTableFilterComposer get collectionId {
    final $$MomentCollectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.momentCollections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentCollectionsTableFilterComposer(
            $db: $db,
            $table: $db.momentCollections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MomentsTableFilterComposer get momentId {
    final $$MomentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableFilterComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentCollectionItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentCollectionItemsTable> {
  $$MomentCollectionItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MomentCollectionsTableOrderingComposer get collectionId {
    final $$MomentCollectionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.momentCollections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentCollectionsTableOrderingComposer(
            $db: $db,
            $table: $db.momentCollections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MomentsTableOrderingComposer get momentId {
    final $$MomentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableOrderingComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentCollectionItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentCollectionItemsTable> {
  $$MomentCollectionItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$MomentCollectionsTableAnnotationComposer get collectionId {
    final $$MomentCollectionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.collectionId,
          referencedTable: $db.momentCollections,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MomentCollectionsTableAnnotationComposer(
                $db: $db,
                $table: $db.momentCollections,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$MomentsTableAnnotationComposer get momentId {
    final $$MomentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.momentId,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableAnnotationComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentCollectionItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentCollectionItemsTable,
          MomentCollectionItem,
          $$MomentCollectionItemsTableFilterComposer,
          $$MomentCollectionItemsTableOrderingComposer,
          $$MomentCollectionItemsTableAnnotationComposer,
          $$MomentCollectionItemsTableCreateCompanionBuilder,
          $$MomentCollectionItemsTableUpdateCompanionBuilder,
          (MomentCollectionItem, $$MomentCollectionItemsTableReferences),
          MomentCollectionItem,
          PrefetchHooks Function({bool collectionId, bool momentId})
        > {
  $$MomentCollectionItemsTableTableManager(
    _$AppDatabase db,
    $MomentCollectionItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MomentCollectionItemsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$MomentCollectionItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MomentCollectionItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> collectionId = const Value.absent(),
                Value<String> momentId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentCollectionItemsCompanion(
                collectionId: collectionId,
                momentId: momentId,
                sortOrder: sortOrder,
                addedAt: addedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String collectionId,
                required String momentId,
                Value<int> sortOrder = const Value.absent(),
                required DateTime addedAt,
                Value<int> rowid = const Value.absent(),
              }) => MomentCollectionItemsCompanion.insert(
                collectionId: collectionId,
                momentId: momentId,
                sortOrder: sortOrder,
                addedAt: addedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MomentCollectionItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({collectionId = false, momentId = false}) {
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
                    if (collectionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.collectionId,
                                referencedTable:
                                    $$MomentCollectionItemsTableReferences
                                        ._collectionIdTable(db),
                                referencedColumn:
                                    $$MomentCollectionItemsTableReferences
                                        ._collectionIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (momentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.momentId,
                                referencedTable:
                                    $$MomentCollectionItemsTableReferences
                                        ._momentIdTable(db),
                                referencedColumn:
                                    $$MomentCollectionItemsTableReferences
                                        ._momentIdTable(db)
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

typedef $$MomentCollectionItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentCollectionItemsTable,
      MomentCollectionItem,
      $$MomentCollectionItemsTableFilterComposer,
      $$MomentCollectionItemsTableOrderingComposer,
      $$MomentCollectionItemsTableAnnotationComposer,
      $$MomentCollectionItemsTableCreateCompanionBuilder,
      $$MomentCollectionItemsTableUpdateCompanionBuilder,
      (MomentCollectionItem, $$MomentCollectionItemsTableReferences),
      MomentCollectionItem,
      PrefetchHooks Function({bool collectionId, bool momentId})
    >;
typedef $$MomentWidgetConfigsTableCreateCompanionBuilder =
    MomentWidgetConfigsCompanion Function({
      required String id,
      required String mode,
      Value<String?> fixedMomentId,
      Value<bool> excludeSensitive,
      Value<bool> excludeHiddenFromWidget,
      Value<bool> includeDeleted,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$MomentWidgetConfigsTableUpdateCompanionBuilder =
    MomentWidgetConfigsCompanion Function({
      Value<String> id,
      Value<String> mode,
      Value<String?> fixedMomentId,
      Value<bool> excludeSensitive,
      Value<bool> excludeHiddenFromWidget,
      Value<bool> includeDeleted,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$MomentWidgetConfigsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MomentWidgetConfigsTable,
          MomentWidgetConfig
        > {
  $$MomentWidgetConfigsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MomentsTable _fixedMomentIdTable(_$AppDatabase db) =>
      db.moments.createAlias(
        $_aliasNameGenerator(
          db.momentWidgetConfigs.fixedMomentId,
          db.moments.id,
        ),
      );

  $$MomentsTableProcessedTableManager? get fixedMomentId {
    final $_column = $_itemColumn<String>('fixed_moment_id');
    if ($_column == null) return null;
    final manager = $$MomentsTableTableManager(
      $_db,
      $_db.moments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fixedMomentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MomentWidgetConfigsTableFilterComposer
    extends Composer<_$AppDatabase, $MomentWidgetConfigsTable> {
  $$MomentWidgetConfigsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get excludeSensitive => $composableBuilder(
    column: $table.excludeSensitive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get excludeHiddenFromWidget => $composableBuilder(
    column: $table.excludeHiddenFromWidget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get includeDeleted => $composableBuilder(
    column: $table.includeDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MomentsTableFilterComposer get fixedMomentId {
    final $$MomentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fixedMomentId,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableFilterComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentWidgetConfigsTableOrderingComposer
    extends Composer<_$AppDatabase, $MomentWidgetConfigsTable> {
  $$MomentWidgetConfigsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get excludeSensitive => $composableBuilder(
    column: $table.excludeSensitive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get excludeHiddenFromWidget => $composableBuilder(
    column: $table.excludeHiddenFromWidget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get includeDeleted => $composableBuilder(
    column: $table.includeDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MomentsTableOrderingComposer get fixedMomentId {
    final $$MomentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fixedMomentId,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableOrderingComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentWidgetConfigsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MomentWidgetConfigsTable> {
  $$MomentWidgetConfigsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<bool> get excludeSensitive => $composableBuilder(
    column: $table.excludeSensitive,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get excludeHiddenFromWidget => $composableBuilder(
    column: $table.excludeHiddenFromWidget,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get includeDeleted => $composableBuilder(
    column: $table.includeDeleted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MomentsTableAnnotationComposer get fixedMomentId {
    final $$MomentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fixedMomentId,
      referencedTable: $db.moments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MomentsTableAnnotationComposer(
            $db: $db,
            $table: $db.moments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MomentWidgetConfigsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MomentWidgetConfigsTable,
          MomentWidgetConfig,
          $$MomentWidgetConfigsTableFilterComposer,
          $$MomentWidgetConfigsTableOrderingComposer,
          $$MomentWidgetConfigsTableAnnotationComposer,
          $$MomentWidgetConfigsTableCreateCompanionBuilder,
          $$MomentWidgetConfigsTableUpdateCompanionBuilder,
          (MomentWidgetConfig, $$MomentWidgetConfigsTableReferences),
          MomentWidgetConfig,
          PrefetchHooks Function({bool fixedMomentId})
        > {
  $$MomentWidgetConfigsTableTableManager(
    _$AppDatabase db,
    $MomentWidgetConfigsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MomentWidgetConfigsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MomentWidgetConfigsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MomentWidgetConfigsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> mode = const Value.absent(),
                Value<String?> fixedMomentId = const Value.absent(),
                Value<bool> excludeSensitive = const Value.absent(),
                Value<bool> excludeHiddenFromWidget = const Value.absent(),
                Value<bool> includeDeleted = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MomentWidgetConfigsCompanion(
                id: id,
                mode: mode,
                fixedMomentId: fixedMomentId,
                excludeSensitive: excludeSensitive,
                excludeHiddenFromWidget: excludeHiddenFromWidget,
                includeDeleted: includeDeleted,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String mode,
                Value<String?> fixedMomentId = const Value.absent(),
                Value<bool> excludeSensitive = const Value.absent(),
                Value<bool> excludeHiddenFromWidget = const Value.absent(),
                Value<bool> includeDeleted = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => MomentWidgetConfigsCompanion.insert(
                id: id,
                mode: mode,
                fixedMomentId: fixedMomentId,
                excludeSensitive: excludeSensitive,
                excludeHiddenFromWidget: excludeHiddenFromWidget,
                includeDeleted: includeDeleted,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MomentWidgetConfigsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({fixedMomentId = false}) {
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
                    if (fixedMomentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.fixedMomentId,
                                referencedTable:
                                    $$MomentWidgetConfigsTableReferences
                                        ._fixedMomentIdTable(db),
                                referencedColumn:
                                    $$MomentWidgetConfigsTableReferences
                                        ._fixedMomentIdTable(db)
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

typedef $$MomentWidgetConfigsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MomentWidgetConfigsTable,
      MomentWidgetConfig,
      $$MomentWidgetConfigsTableFilterComposer,
      $$MomentWidgetConfigsTableOrderingComposer,
      $$MomentWidgetConfigsTableAnnotationComposer,
      $$MomentWidgetConfigsTableCreateCompanionBuilder,
      $$MomentWidgetConfigsTableUpdateCompanionBuilder,
      (MomentWidgetConfig, $$MomentWidgetConfigsTableReferences),
      MomentWidgetConfig,
      PrefetchHooks Function({bool fixedMomentId})
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String key,
      required String value,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MomentMoodPacksTableTableManager get momentMoodPacks =>
      $$MomentMoodPacksTableTableManager(_db, _db.momentMoodPacks);
  $$MomentMoodsTableTableManager get momentMoods =>
      $$MomentMoodsTableTableManager(_db, _db.momentMoods);
  $$MomentTonePacksTableTableManager get momentTonePacks =>
      $$MomentTonePacksTableTableManager(_db, _db.momentTonePacks);
  $$MomentTonesTableTableManager get momentTones =>
      $$MomentTonesTableTableManager(_db, _db.momentTones);
  $$MomentsTableTableManager get moments =>
      $$MomentsTableTableManager(_db, _db.moments);
  $$MomentAssetsTableTableManager get momentAssets =>
      $$MomentAssetsTableTableManager(_db, _db.momentAssets);
  $$MomentTagsTableTableManager get momentTags =>
      $$MomentTagsTableTableManager(_db, _db.momentTags);
  $$MomentTagLinksTableTableManager get momentTagLinks =>
      $$MomentTagLinksTableTableManager(_db, _db.momentTagLinks);
  $$MomentCollectionsTableTableManager get momentCollections =>
      $$MomentCollectionsTableTableManager(_db, _db.momentCollections);
  $$MomentCollectionItemsTableTableManager get momentCollectionItems =>
      $$MomentCollectionItemsTableTableManager(_db, _db.momentCollectionItems);
  $$MomentWidgetConfigsTableTableManager get momentWidgetConfigs =>
      $$MomentWidgetConfigsTableTableManager(_db, _db.momentWidgetConfigs);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
