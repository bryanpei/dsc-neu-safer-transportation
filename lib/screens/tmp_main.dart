import 'package:flutter/material.dart';
import 'package:safer_transportation/services/models/event.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            ),
            ListTile(
              title: Text('map page'),
              onTap: () {
                Navigator.pushNamed(context, '/map');
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
      body: Text('This is a temporary home page'),
    );
  }
}