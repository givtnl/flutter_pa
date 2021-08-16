import 'package:uuid/uuid.dart';

class Event {

  String event;
  String distinctId;
  DateTime? timeStamp;

  Event({required this.event, required this.distinctId, this.timeStamp});

  Map<String, dynamic> toJson(){
    return {
      "event": this.event,
      "properties": {"distinct_id": "$distinctId", "time": timeStamp?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch, "\$insert_id": Uuid().v4().toString()},
    };
  }

  static Event fromString(Map<String, Object?> map) {
    return Event(event: map["event"].toString(), distinctId: map["userid"].toString(), timeStamp: DateTime.fromMicrosecondsSinceEpoch(int.parse(map["datetime"].toString())));
  }
}