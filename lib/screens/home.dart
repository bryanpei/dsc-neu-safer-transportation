import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safer_transportation/components/floating_search_bar.dart';
import 'package:safer_transportation/components/menu.dart';
import 'package:safer_transportation/services/authentification/auth.dart';

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
  final AuthService _auth = AuthService();
  GoogleMapController mapController;

  // Map camera center.
  LatLng _center = const LatLng(45.521563, -122.677433);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            padding: EdgeInsets.fromLTRB(10, 100, 10, 0),
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            compassEnabled: true,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          FloatingSearchBar(),
          Positioned(
            bottom: 50,
            right: 20,
            child: Container(
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
                              child: IconButton.build(
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
                    child: IconButton.build(imageUrlBase + imageNames[6], false)
                  )
                ],
              ),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}


class IconButton {
  static Widget build(String imageUrl, bool selected) {
    print(imageUrl);
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
