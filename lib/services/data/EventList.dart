import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safer_transportation/services/models/event.dart';

class EventList {
  List<Event> events = new List();

  EventList() {
    init();
  }

  void init() {
    events.add(Event(
      typeId: 1,
      datetime: DateTime(2020, 3, 21, 21, 31, 59),
      locationH: '500 Boren Ave N, Seattle, WA 98109',
      locationGeo: LatLng(47.623164, -122.337193),
      imageUrl: 'https://www.liherald.com/uploads/original/20191231-142323-IMG_4179.JPG',
      reportUserId: null
    ));

    events.add(Event(
        typeId: 0,
        datetime: DateTime(2020, 3, 22, 20, 30, 08),
        locationH: '801-849 Republican St, Seattle, WA 98109',
        locationGeo: LatLng(47.623280, -122.340540),
        imageUrl: 'https://www.colombolaw.com/wp-content/uploads/2019/06/minor-car-accident.jpg',
        reportUserId: null
    ));

    events.add(Event(
        typeId: 2,
        datetime: DateTime(2020, 3, 22, 19, 30, 50),
        locationH: '351 Boren Ave N, Seattle, WA 98109',
        locationGeo: LatLng(47.621527, -122.336232),
        imageUrl: 'https://ichef.bbci.co.uk/news/1024/cpsprodpb/10741/production/_108839376_fireongar1.jpg',
        reportUserId: null
    ));

    events.add(Event(
        typeId: 4,
        datetime: DateTime(2020, 3, 21, 21, 31, 59),
        locationH: 'Boren Ave N, Seattle, WA 98109',
        locationGeo: LatLng(47.620348, -122.336221),
        imageUrl: 'https://thenypost.files.wordpress.com/2018/05/180511-used-syringes-street-san-francisco-01.jpg?quality=80&strip=all',
        reportUserId: null
    ));
  }
}