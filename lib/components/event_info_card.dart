import 'package:flutter/material.dart';
import 'event_Info.dart';


class EventInfoCard extends StatelessWidget {

  final EventInfo info;
  final Function delete;

  EventInfoCard({this.info, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.announcement,
            color: Colors.redAccent,
            size: 60.0,
          ),

          ListTile(
                title: Text("Event Report Time: "),
                subtitle: Text(info.reportTime),
              ),

          ListTile(
            title: Text("Event Report Location: "),
            subtitle: Text(info.reportAddress),
          ),

          Center(
            child: Image(
              image: NetworkImage(info.image),
            ),
          ),
          ListTile(
            title: Text("Reported by: "),
            subtitle: Text(info.reporter),
          ),

          ButtonBar(
            children: <Widget>[
              FlatButton.icon(
              onPressed: delete,
              label: Text("Delete Event"),
              icon: Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}
