import 'package:flutter/material.dart';
import 'package:safer_transportation/services/models/event.dart';

class EventCard extends StatelessWidget {

  final Event event;
  String imageUrlBase = 'assets/images/';
  var imageNames = ['icon-car.png', 'icon-fight.png', 'icon-fire.png',
    'icon-protest.png', 'icon-syringe.png', 'icon-other.png'];

  EventCard({this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 370,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 0.5,
              offset: Offset(0.25, 0.25)
          )
        ]
      ),
      child: Column(
              children: <Widget>[
              Flexible(
                child: Image.asset(
                  imageUrlBase + imageNames[event.typeId],
                  width: 60,
                ),
              ),

              Flexible(
                child: ListTile(
                  title: Text("Event Report Time: "),
                  subtitle: Text(event.datetime.toString()),
                ),
              ),

              Flexible(
                child: ListTile(
                  title: Text("Event Report Location: "),
                  subtitle: Text(event.locationH),
                ),
              ),

              Flexible(
                child: ListTile(
                  title: Text("Reported by: "),
                  subtitle: Text(
                      event.reportUserId == null ? 'Anonymous' : event.reportUserId
                  ),
                ),
              ),

              Flexible(
                child: Center(
                  child: Image(
                    image: NetworkImage(event.imageUrl),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
