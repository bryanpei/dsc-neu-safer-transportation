// A single event_card widget
import 'package:flutter/material.dart';
import 'package:safer_transportation/services/event.dart';

class EventCard extends StatefulWidget {

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    Event event = data['event'];
    event.updateEvent();
    return Scaffold(
      body: Center(
        child: Text('EVENT CARD'),
      ),
    );;
  }
}




