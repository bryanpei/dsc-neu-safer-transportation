import 'package:flutter/material.dart';
import 'package:safer_transportation/services/data/UserInfo.dart';
import 'package:safer_transportation/services/models/event.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage('https://cdn.iconscout.com/icon/free/png-512/avatar-380-456332.png'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                  child: Text(
                    UserInfo.firstName,
                    style: TextStyle(
                      fontSize: 30
                    ),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 15.0, 0),
                    child: Icon(Icons.map)
                ),
                Text('Home'),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/map');
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 15.0, 0),
                    child: Icon(Icons.account_circle)
                ),
                Text('Profile'),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 15.0, 0),
                    child: Icon(Icons.error)
                ),
                Text('Alerts'),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/alerts');
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 15.0, 0),
                    child: Icon(Icons.settings)
                ),
                Text('Settings'),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
