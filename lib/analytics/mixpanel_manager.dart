import 'dart:convert';

import 'package:flutter_app/analytics/event_store.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'Import_result.dart';
import 'event.dart';

class MixpanelManager {

  String _mixpanelUri = "https://api.mixpanel.com";
  String? _identity;
  late EventStore _store;
  String _mixpanelApiBasic = "Zmx1dHRlci1zZXJ2aWNlLWFjY291bnQuNTIzZGEyLm1wLXNlcnZpY2UtYWNjb3VudDp0QTRrczNpcUU5VEhIRmV0Q1dIcXpKamd5MFRZU1p1VQ==";
  static MixpanelManager _mixpanelManager = MixpanelManager._();

  static MixpanelManager get mixpanel => _mixpanelManager;

  MixpanelManager._() {
    this._store = EventStore();
    Future.delayed(Duration(seconds: 60), _timedFlushEvents);
  }

  _timedFlushEvents() async {
    print("Doing timed flush events");
    await flushEvents();
    Future.delayed(Duration(seconds: 60), _timedFlushEvents);
  }

  flushEvents() async {
    var events = await _store.getAllEvents();
    if (events.length <= 0) {
      print("no events found for exporting");
      return;
    }
    try {
      await _exportEvents(events);
      await _store.flushAllEvents();

    } catch (exception) {
      // only flush when all goes well;
      print(exception);
    }
  }

  _getIdentity() async {
    if (_identity == null) {
      var prefs = await SharedPreferences.getInstance();
      var mixpanelIdentity = prefs.getString("mixpanel_identity");
      if (mixpanelIdentity == null) {
        var identityKey = Uuid().v4();
        prefs.setString('mixpanel_identity', identityKey.toString());
        mixpanelIdentity = identityKey.toString();
      }
      _identity = mixpanelIdentity;
      return mixpanelIdentity;
    } else
      return _identity!;
  }

  _exportEvents(List<Event> events) async {
    var json = jsonEncode(events);
    try {
      var response =
      await http.post(Uri.parse("$_mixpanelUri/import?strict=1&project_id=2505655"), body: json, headers: {"Authorization": "Basic $_mixpanelApiBasic", "Content-Type": "application/json"});
      var responseBody = jsonDecode(response.body);
      print("${ApiImportResult.fromJson(responseBody).records} events exported to mixpanel");
    } catch (exception) {
      print(exception);
      throw exception;
    }

  }

  void track(String event) async {
    await _store.insertEvent(event, await _getIdentity(), DateTime.now());
  }
}