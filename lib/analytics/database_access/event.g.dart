// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Event extends DataClass implements Insertable<Event> {
  final int id;
  final String event;
  final String distinctId;
  final DateTime trackingTime;
  Event(
      {required this.id,
      required this.event,
      required this.distinctId,
      required this.trackingTime});
  factory Event.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Event(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      event: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event'])!,
      distinctId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}distinct_id'])!,
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
    map['tracking_time'] = Variable<DateTime>(trackingTime);
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      event: Value(event),
      distinctId: Value(distinctId),
      trackingTime: Value(trackingTime),
    );
  }

  factory Event.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<int>(json['id']),
      event: serializer.fromJson<String>(json['event']),
      distinctId: serializer.fromJson<String>(json['distinctId']),
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
      'trackingTime': serializer.toJson<DateTime>(trackingTime),
    };
  }

  Event copyWith(
          {int? id,
          String? event,
          String? distinctId,
          DateTime? trackingTime}) =>
      Event(
        id: id ?? this.id,
        event: event ?? this.event,
        distinctId: distinctId ?? this.distinctId,
        trackingTime: trackingTime ?? this.trackingTime,
      );
  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('event: $event, ')
          ..write('distinctId: $distinctId, ')
          ..write('trackingTime: $trackingTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          event.hashCode, $mrjc(distinctId.hashCode, trackingTime.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.event == this.event &&
          other.distinctId == this.distinctId &&
          other.trackingTime == this.trackingTime);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<int> id;
  final Value<String> event;
  final Value<String> distinctId;
  final Value<DateTime> trackingTime;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.event = const Value.absent(),
    this.distinctId = const Value.absent(),
    this.trackingTime = const Value.absent(),
  });
  EventsCompanion.insert({
    this.id = const Value.absent(),
    required String event,
    required String distinctId,
    required DateTime trackingTime,
  })  : event = Value(event),
        distinctId = Value(distinctId),
        trackingTime = Value(trackingTime);
  static Insertable<Event> custom({
    Expression<int>? id,
    Expression<String>? event,
    Expression<String>? distinctId,
    Expression<DateTime>? trackingTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (event != null) 'event': event,
      if (distinctId != null) 'distinct_id': distinctId,
      if (trackingTime != null) 'tracking_time': trackingTime,
    });
  }

  EventsCompanion copyWith(
      {Value<int>? id,
      Value<String>? event,
      Value<String>? distinctId,
      Value<DateTime>? trackingTime}) {
    return EventsCompanion(
      id: id ?? this.id,
      event: event ?? this.event,
      distinctId: distinctId ?? this.distinctId,
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
    if (trackingTime.present) {
      map['tracking_time'] = Variable<DateTime>(trackingTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('event: $event, ')
          ..write('distinctId: $distinctId, ')
          ..write('trackingTime: $trackingTime')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends DbEvents with TableInfo<$EventsTable, Event> {
  final GeneratedDatabase _db;
  final String? _alias;
  $EventsTable(this._db, [this._alias]);
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
  final VerificationMeta _trackingTimeMeta =
      const VerificationMeta('trackingTime');
  late final GeneratedColumn<DateTime?> trackingTime =
      GeneratedColumn<DateTime?>('tracking_time', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, event, distinctId, trackingTime];
  @override
  String get aliasedName => _alias ?? 'events';
  @override
  String get actualTableName => 'events';
  @override
  VerificationContext validateIntegrity(Insertable<Event> instance,
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
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Event.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(_db, alias);
  }
}

abstract class _$EventDatabase extends GeneratedDatabase {
  _$EventDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $EventsTable events = $EventsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [events];
}
