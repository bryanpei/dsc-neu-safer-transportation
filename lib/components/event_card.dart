// A single event_card widget


import 'package:flutter/material.dart';
import 'package:safer_transportation/services/models/event.dart';
import 'event_info_card.dart';
import 'event_Info.dart';
import 'event_type.dart';

class EventCard extends StatefulWidget {

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  Map data = {};

  List<EventInfo> info = [
    EventInfo("Mary S", "18:00 Feb 26th, 2020", "123th Ave, NE, Seattle", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLfY2HejD89RZfP0YlThgYKAwRqOKe8DNz_gAdZZ93Ts93Ux62&usqp=CAU", EventType.fire)
  ];

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    Event event = data['event'];
    event.updateEvent();
    return Scaffold(
    appBar: AppBar(
      title: Text("Event Info"),
      centerTitle: true,
      backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: info.map((event) => EventInfoCard(
            info: event,
            delete: (){
              setState(() {
                info.remove(event);
                });
        })).toList(),
      ),
    );
  }
}




