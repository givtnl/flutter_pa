import 'package:flutter_app/analytics/event.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EventStore {
  Database? _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'event_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE events(id INTEGER PRIMARY KEY AUTOINCREMENT, event TEXT, userid TEXT, datetime INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertEvent(String event, String userId, DateTime trackingTime) async {
    if (_database == null || !_database!.isOpen) {
      await initDatabase();
    }
    await _database!.insert('events', {"event": event, "userid": userId, "datetime": trackingTime.millisecondsSinceEpoch});
    await _database!.close();
  }

  Future<List<Event>> getAllEvents() async {
    if (_database == null || !_database!.isOpen) {
      await initDatabase();
    }

    var events = await _database!.query('events');
    await _database!.close();
    return [...events].map((e) => Event.fromString(e)).toList();
  }

  Future<void> flushAllEvents() async {
    if (_database == null || !_database!.isOpen) {
      await initDatabase();
    }

    await _database!.execute("DELETE FROM events;");
    await _database!.close();
  }
}
