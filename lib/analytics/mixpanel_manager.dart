import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../flavors_config.dart';
import 'Import_result.dart';
import 'database_access/event.dart' as DbEvent;
import 'event.dart';

class MixpanelManager {
  String? _identity;
  late DbEvent.EventDatabase _store;
  late final _url;
  static MixpanelManager _mixpanelManager = MixpanelManager._();

  static MixpanelManager get mixpanel => _mixpanelManager;

  MixpanelManager._() {
    this._store = DbEvent.constructDb();
    Future.delayed(Duration(seconds: 60), _timedFlushEvents);
  }

  Future<void> _timedFlushEvents() async {
    await flushEvents();
    Future.delayed(Duration(seconds: 60), _timedFlushEvents);
  }

  setUrl(String url) {
    this._url = url;
  }

  Future<void> flushEvents() async {
    var events = await _store.allEvents;
    if (events.length <= 0) {
      print("no events found for exporting");
      return;
    }
    try {
      await _exportEvents(events.map((e) {
        var props = new Map<String, dynamic>();
        if (e.properties != null && e.properties != "null") {
          props = jsonDecode(e.properties!) as Map<String, dynamic>;
        }
        return Event(event: e.event, distinctId: e.distinctId, timeStamp: e.trackingTime, properties: props);
      }).toList());
      await _store.deleteAllEvents();
    } catch (exception) {
      // only flush when all goes well;
      print(exception);
    }
  }

  Future<String> _getIdentity() async {
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

  Future<void> _exportEvents(List<Event> events) async {
    var json = jsonEncode(events);
    try {
      var response = await http.post(Uri.parse(_url), body: json);
      var responseBody = jsonDecode(response.body);
      print("${ApiImportResult.fromJson(responseBody).records} events exported to mixpanel");
    } catch (exception) {
      print(exception);
      throw exception;
    }
  }

  Future<void> track(String event, {Map<String, String>? properties}) async {
    await _store.insertEvent(event, await _getIdentity(), DateTime.now(), properties: properties);
  }
}
