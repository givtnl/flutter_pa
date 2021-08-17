import 'package:uuid/uuid.dart';

class Event {
  String event;
  String distinctId;
  DateTime? timeStamp;
  Map<String, dynamic>? properties;
  Event({required this.event, required this.distinctId, this.timeStamp, this.properties});

  Map<String, dynamic> toJson() {
    var map = {
      "event": this.event,
      "properties": {
        "distinct_id": "$distinctId",
        "time": timeStamp?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch,
        "\$insert_id": Uuid().v4().toString()
      },
    };

    return map;
  }

  static Event fromString(Map<String, Object?> map) {
    return Event(event: map["event"].toString(), distinctId: map["userid"].toString(), timeStamp: DateTime.fromMicrosecondsSinceEpoch(int.parse(map["datetime"].toString())));
  }
}
