// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DbEvent extends DataClass implements Insertable<DbEvent> {
  final int id;
  final String event;
  final String distinctId;
  final String? properties;
  final DateTime trackingTime;
  DbEvent(
      {required this.id,
      required this.event,
      required this.distinctId,
      this.properties,
      required this.trackingTime});
  factory DbEvent.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbEvent(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      event: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event'])!,
      distinctId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}distinct_id'])!,
      properties: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}properties']),
      trackingTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tracking_time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event'] = Variable<String>(event);
    map['distinct_id'] = Variable<String>(distinctId);
    if (!nullToAbsent || properties != null) {
      map['properties'] = Variable<String?>(properties);
    }
    map['tracking_time'] = Variable<DateTime>(trackingTime);
    return map;
  }

  DbEventsCompanion toCompanion(bool nullToAbsent) {
    return DbEventsCompanion(
      id: Value(id),
      event: Value(event),
      distinctId: Value(distinctId),
      properties: properties == null && nullToAbsent
          ? const Value.absent()
          : Value(properties),
      trackingTime: Value(trackingTime),
    );
  }

  factory DbEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbEvent(
      id: serializer.fromJson<int>(json['id']),
      event: serializer.fromJson<String>(json['event']),
      distinctId: serializer.fromJson<String>(json['distinctId']),
      properties: serializer.fromJson<String?>(json['properties']),
      trackingTime: serializer.fromJson<DateTime>(json['trackingTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'event': serializer.toJson<String>(event),
      'distinctId': serializer.toJson<String>(distinctId),
      'properties': serializer.toJson<String?>(properties),
      'trackingTime': serializer.toJson<DateTime>(trackingTime),
    };
  }

  DbEvent copyWith(
          {int? id,
          String? event,
          String? distinctId,
          String? properties,
          DateTime? trackingTime}) =>
      DbEvent(
        id: id ?? this.id,
        event: event ?? this.event,
        distinctId: distinctId ?? this.distinctId,
        properties: properties ?? this.properties,
        trackingTime: trackingTime ?? this.trackingTime,
      );
  @override
  String toString() {
    return (StringBuffer('DbEvent(')
          ..write('id: $id, ')
          ..write('event: $event, ')
          ..write('distinctId: $distinctId, ')
          ..write('properties: $properties, ')
          ..write('trackingTime: $trackingTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          event.hashCode,
          $mrjc(distinctId.hashCode,
              $mrjc(properties.hashCode, trackingTime.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbEvent &&
          other.id == this.id &&
          other.event == this.event &&
          other.distinctId == this.distinctId &&
          other.properties == this.properties &&
          other.trackingTime == this.trackingTime);
}

class DbEventsCompanion extends UpdateCompanion<DbEvent> {
  final Value<int> id;
  final Value<String> event;
  final Value<String> distinctId;
  final Value<String?> properties;
  final Value<DateTime> trackingTime;
  const DbEventsCompanion({
    this.id = const Value.absent(),
    this.event = const Value.absent(),
    this.distinctId = const Value.absent(),
    this.properties = const Value.absent(),
    this.trackingTime = const Value.absent(),
  });
  DbEventsCompanion.insert({
    this.id = const Value.absent(),
    required String event,
    required String distinctId,
    this.properties = const Value.absent(),
    required DateTime trackingTime,
  })  : event = Value(event),
        distinctId = Value(distinctId),
        trackingTime = Value(trackingTime);
  static Insertable<DbEvent> custom({
    Expression<int>? id,
    Expression<String>? event,
    Expression<String>? distinctId,
    Expression<String?>? properties,
    Expression<DateTime>? trackingTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (event != null) 'event': event,
      if (distinctId != null) 'distinct_id': distinctId,
      if (properties != null) 'properties': properties,
      if (trackingTime != null) 'tracking_time': trackingTime,
    });
  }

  DbEventsCompanion copyWith(
      {Value<int>? id,
      Value<String>? event,
      Value<String>? distinctId,
      Value<String?>? properties,
      Value<DateTime>? trackingTime}) {
    return DbEventsCompanion(
      id: id ?? this.id,
      event: event ?? this.event,
      distinctId: distinctId ?? this.distinctId,
      properties: properties ?? this.properties,
      trackingTime: trackingTime ?? this.trackingTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (event.present) {
      map['event'] = Variable<String>(event.value);
    }
    if (distinctId.present) {
      map['distinct_id'] = Variable<String>(distinctId.value);
    }
    if (properties.present) {
      map['properties'] = Variable<String?>(properties.value);
    }
    if (trackingTime.present) {
      map['tracking_time'] = Variable<DateTime>(trackingTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbEventsCompanion(')
          ..write('id: $id, ')
          ..write('event: $event, ')
          ..write('distinctId: $distinctId, ')
          ..write('properties: $properties, ')
          ..write('trackingTime: $trackingTime')
          ..write(')'))
        .toString();
  }
}

class $DbEventsTable extends DbEvents with TableInfo<$DbEventsTable, DbEvent> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DbEventsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _eventMeta = const VerificationMeta('event');
  late final GeneratedColumn<String?> event = GeneratedColumn<String?>(
      'event', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _distinctIdMeta = const VerificationMeta('distinctId');
  late final GeneratedColumn<String?> distinctId = GeneratedColumn<String?>(
      'distinct_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _propertiesMeta = const VerificationMeta('properties');
  late final GeneratedColumn<String?> properties = GeneratedColumn<String?>(
      'properties', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _trackingTimeMeta =
      const VerificationMeta('trackingTime');
  late final GeneratedColumn<DateTime?> trackingTime =
      GeneratedColumn<DateTime?>('tracking_time', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, event, distinctId, properties, trackingTime];
  @override
  String get aliasedName => _alias ?? 'db_events';
  @override
  String get actualTableName => 'db_events';
  @override
  VerificationContext validateIntegrity(Insertable<DbEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event')) {
      context.handle(
          _eventMeta, event.isAcceptableOrUnknown(data['event']!, _eventMeta));
    } else if (isInserting) {
      context.missing(_eventMeta);
    }
    if (data.containsKey('distinct_id')) {
      context.handle(
          _distinctIdMeta,
          distinctId.isAcceptableOrUnknown(
              data['distinct_id']!, _distinctIdMeta));
    } else if (isInserting) {
      context.missing(_distinctIdMeta);
    }
    if (data.containsKey('properties')) {
      context.handle(
          _propertiesMeta,
          properties.isAcceptableOrUnknown(
              data['properties']!, _propertiesMeta));
    }
    if (data.containsKey('tracking_time')) {
      context.handle(
          _trackingTimeMeta,
          trackingTime.isAcceptableOrUnknown(
              data['tracking_time']!, _trackingTimeMeta));
    } else if (isInserting) {
      context.missing(_trackingTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbEvent.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbEventsTable createAlias(String alias) {
    return $DbEventsTable(_db, alias);
  }
}

abstract class _$EventDatabase extends GeneratedDatabase {
  _$EventDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DbEventsTable dbEvents = $DbEventsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbEvents];
}
