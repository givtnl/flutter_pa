
import 'package:flutter_app/analytics/database_access/event.dart';
import 'package:moor/moor_web.dart';

import '../event.dart';

EventDatabase constructDb({bool logStatements = false}) {
  return EventDatabase(WebDatabase('db', logStatements: logStatements));
}