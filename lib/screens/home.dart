// Home screen
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safer_transportation/services/event.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController mapController;

  // Map camare center.
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Navigation'),
            ),
            ListTile(
              title: Text('login'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              title: Text('profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text('report'),
              onTap: () {
                Navigator.pushNamed(context, '/report');
              },
            ),
            ListTile(
              title: Text('settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              title: Text('event card'),
              onTap: () {
                Navigator.pushNamed(context, '/eventcard', arguments: {
                  'event': Event()});
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home page'),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
