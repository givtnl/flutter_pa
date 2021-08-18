import 'dart:convert';

import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

export 'shared.dart';

part 'event.g.dart';

class DbEvents extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get event => text().withLength(min: 1, max: 100)();

  TextColumn get distinctId => text().withLength(min: 1, max: 100)();

  TextColumn get properties => text().nullable()();

  DateTimeColumn get trackingTime => dateTime()();
}

@UseMoor(tables: [DbEvents])
class EventDatabase extends _$EventDatabase {
  EventDatabase(QueryExecutor e) : super(e);

  Future<List<DbEvent>> get allEvents => select(dbEvents).get();

  Future deleteAllEvents() async {
    delete(dbEvents);
  }

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Future<int> insertEvent(String event, String userId, DateTime trackingTime, {Map<String, String>? properties}) async {
    return into(dbEvents).insert(DbEventsCompanion(distinctId: Value(userId), trackingTime: Value(trackingTime), event: Value(event), properties: Value(jsonEncode(properties))));
  }
}
