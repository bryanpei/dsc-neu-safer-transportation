import 'package:flutter/cupertino.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safer_transportation/components/event_card.dart';
import 'package:safer_transportation/components/floating_search_bar.dart';
import 'package:safer_transportation/components/menu.dart';
import 'package:safer_transportation/services/authentification/auth.dart';
import 'package:safer_transportation/services/data/EventList.dart';
import 'package:safer_transportation/services/models/event.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool expanded = false;
  String imageUrlBase = 'assets/images/';
  var imageNames = ['icon-car.png', 'icon-fight.png', 'icon-fire.png',
                    'icon-protest.png', 'icon-syringe.png', 'icon-other.png',
                    'logo.png'];
  var selected = [false, false, false, false, false, false];
  List<EventCard> eventCard = new List();
  List<BitmapDescriptor> markerIcons = new List();
  EventList eventList = new EventList();
  Set<Marker> _markers = {};
  final AuthService _auth = AuthService();
  GoogleMapController mapController;

  // Map camera center.
  LatLng _center = const LatLng(47.623164, -122.337193);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    LatLng cameraPosition = LatLng(position.latitude, position.longitude);
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: cameraPosition,
      zoom: 16,
    )));
  }

  _handleTap(LatLng point) {
//    setState(() {
//      _markers.add(Marker(
//        markerId: MarkerId(point.toString()),
//        position: point,
//        infoWindow: InfoWindow(
//          title: 'I am a marker',
//        ),
//        icon:
//        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
//      ));
//    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }

  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(String path, int width) async {
    final Uint8List imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData);
  }

  _createMarkers() {
    for(String name in imageNames) {
      getBitmapDescriptorFromAssetBytes(imageUrlBase + name, 80).then((onValue) {
        markerIcons.add(onValue);
      });
    }
  }

  Future<void> _initMarkers() async {
    if (markerIcons.length == 0) {
      await _createMarkers();
    }
    print(markerIcons.length);
    _markers.clear();
    for(Event e in eventList.events) {
      _markers.add(Marker(
        markerId: MarkerId(e.locationGeo.toString()),
        position: e.locationGeo,
        icon: markerIcons[e.typeId],
        onTap: () {
          setState(() {
            eventCard.clear();
            eventCard.add(EventCard(
                event: e
            ));
          });
        }
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _initMarkers();
    return Scaffold(
      drawer: Menu(),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            padding: EdgeInsets.fromLTRB(10, 100, 10, 0),
            mapType: MapType.normal,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            compassEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,

            onTap: _handleTap,
          ),
          FloatingSearchBar(),
          Positioned(
            bottom: 65,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 60,
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0.5,
                          offset: Offset(0.25, 0.25)
                      ),
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0.5,
                          offset: Offset(-0.25, -0.25)
                      )
                    ]
                  ),
                  child: Row(
                    children: <Widget>[
                      AnimatedContainer(
                        width: expanded ? 300 : 0,
                        duration: Duration(milliseconds: 250),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(6, (i) {
                              return Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected = [false, false, false, false, false, false];
                                      selected[i] = true;
                                    });
                                  },
                                  child: MyIconButton.build(
                                      imageUrlBase + imageNames[i], selected[i]),
                                ),
                              );
                            }),
                        ),
                      ),
                      VerticalDivider(
                        color: expanded ? Colors.grey : Colors.white,
                        width: 3,
                      ) ,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            expanded = !expanded;
                          });
                        },
                        child: MyIconButton.build(imageUrlBase + imageNames[6], false)
                      )
                    ],
                  ),
                ),
                Container(
                  child: eventCard.isEmpty ? null :
                  Stack (
                    children: <Widget>[
                      eventCard[0],
                      Positioned(
                        top: 15,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.clear),
                          tooltip: 'close event info',
                          onPressed: () {
                            setState(() {
                              eventCard.clear();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}


class MyIconButton {
  static Widget build(String imageUrl, bool selected) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: selected ? Colors.grey[300] : Colors.white,
      ),
      child: Image.asset(imageUrl),
    );
  }
}
