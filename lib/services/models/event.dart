// Event class that stores all related
// information of a single event.

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Event {
  final int typeId;
  final DateTime datetime;
  final String locationH; // human readable address.
  final String imageUrl; // If there a image related to the event.
  final LatLng locationGeo; // geo location.
  final String reportUserId;  // could be null if event is not reported by user.

  Event({
    this.typeId,
    this.datetime,
    this.locationH,
    this.imageUrl,
    this.locationGeo,
    this.reportUserId,
  });
}
