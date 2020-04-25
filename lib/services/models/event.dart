// Event class that stores all related
// information of a single event.

import 'package:safer_transportation/services/models/event_type.dart';
import 'package:safer_transportation/services/models/event_source.dart';

class Event {
  final int intEventId;
  final String datetime;
  final String locationH; // human readable address.
  final String imageUrl; // If there a image related to the event.
  final dynamic locationGeo; // geo location.
  final int reportUserId;  // could be null if event is not reported by user.
  final EventSource source;
  final EventTypeId typeId;

  Event({
    this.intEventId,
    this.datetime,
    this.locationH,
    this.imageUrl,
    this.locationGeo,
    this.reportUserId,
    this.source,
    this.typeId,
  });

  void updateEvent() {}

}
