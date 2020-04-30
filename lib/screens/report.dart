import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safer_transportation/components/menu.dart';
import 'package:safer_transportation/services/data/EventList.dart';
import 'package:safer_transportation/services/models/event.dart';

class Report extends StatefulWidget {
  Report() : super();
  @override
  _ReportState createState() => _ReportState();
}



class _ReportState extends State<Report> {
  bool _select = false;

  String _reportSelection = '';
  List<Map> _reportJson = [
    {
      "image": 'assets/images/icon-car.png',
      "name": 'Car Accident'
    },

    {
      "image": 'assets/images/icon-fight.png',
      "name": 'Street Fight'
    },

    {
      "image": 'assets/images/icon-fire.png',
      "name": 'Fire'
    },

    {
      "image": 'assets/images/icon-protest.png',
      "name": 'Protest'
    },

    {
      "image": 'assets/images/icon-syringe.png',
      "name": 'Syringe'
    },

    {
      "image": 'assets/images/icon-other.png',
      "name": 'Other'
    }
  ];

  Future<String> _getAddress(LatLng pos) async {
    List<Placemark> placemarks = await Geolocator()
        .placemarkFromCoordinates(pos.latitude, pos.longitude);
    if (placemarks != null && placemarks.isNotEmpty) {
      final Placemark pos = placemarks[0];
      return pos.thoroughfare + ', ' + pos.locality;
    }
    return "";
  }
  String address = "";
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dynamic data = ModalRoute.of(context).settings.arguments;
    int selectedPin = data == null ? -1 : data['selectedPin'];
    LatLng point = data == null ? null : data['point'];
    EventList eventList = data == null ? null : data['eventList'];
    _reportSelection = _reportSelection ==  '' ? selectedPin == -1 ? '' : _reportJson[selectedPin]['name'] : _reportSelection;
    if (point != null) {
      _getAddress(point).then((onValue) {
        if (addressController.text == '') {
          setState(() {
            address = onValue;
            addressController.text = address;
          });
        }
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Report',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        drawer: Menu(),
        body: Container(
            color: Colors.white,
            child: ListView(
                children: <Widget>[
                  Container(
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Event type',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: 15),
                                  height: 45,
                                  width: 195,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.horizontal()),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                          child: DropdownButtonHideUnderline(
                                              child: ButtonTheme(
                                                  alignedDropdown: true,
                                                  minWidth: 50.0,
                                                  height: 30.0,
                                                  child: DropdownButton<String>(
                                                    isDense: true,
                                                    isExpanded: true,
                                                    hint: new Text(
                                                        "Select Event Type"),
                                                    value: _reportSelection,
                                                    onChanged: (
                                                        String newValue) {
                                                      setState(() {
                                                        _reportSelection =
                                                            newValue;
                                                      });
                                                    },
                                                    items: _reportJson.map((
                                                        Map map) {
                                                      return new DropdownMenuItem<
                                                          String>(
                                                          value: map["name"]
                                                              .toString(),
                                                          child: Row(
                                                            children: <Widget>[
                                                              Image.asset(
                                                                map["image"],
                                                                width: 25,
                                                              ),
                                                              Container(
                                                                  margin:
                                                                  EdgeInsets
                                                                      .only(
                                                                      left: 10),
                                                                  child: Text(
                                                                      map["name"]))
                                                            ],

                                                          )
                                                      );
                                                    }).toList(),
                                                  )
                                              )
                                          )
                                      )
                                    ],
                                  )
                              )
                            ],
                          )
                      )
                  ),
                  Container(
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('Location',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    )),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: EdgeInsets.only(top: 15),
                                  height: 55,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white,

                                      ),
                                      borderRadius: BorderRadius
                                          .horizontal()),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                              width: 300.0,
                                              height: 50.0,
                                              child: TextFormField(
                                                controller: addressController,
                                                decoration: InputDecoration(
                                                    contentPadding: const EdgeInsets
                                                        .all(5.0),
                                                    labelText: 'Enter Location',
                                                    fillColor: Colors.white,
                                                    border: new OutlineInputBorder(
                                                        borderRadius: new BorderRadius
                                                            .only(),
                                                        borderSide: new BorderSide(
                                                        )
                                                    )
                                                ),

                                              ),
                                          ),
                                        ),
                                      ],
                                  ),
                                ),
                              ]
                          )
                      ),
                  ),

                  Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.all(15),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          Text(
                              'Report anonymously',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              )
                          ),
                          Container(
                              child: Checkbox(
                                  value: _select,
                                  activeColor: Colors.black,
                                  onChanged: (bool response) {
                                    setState(() {
                                      _select = response;
                                    });
                                  }
                              )

                          ),

                        ],
                      )

                  ),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ButtonTheme(
                                minWidth: 200.0,
                                height: 50.0,
                                child: RaisedButton(
                                    onPressed: () {
                                      eventList.events.add(Event(
                                          typeId: selectedPin,
                                          datetime: DateTime.now(),
                                          locationH: address,
                                          locationGeo: point,
                                          imageUrl: 'https://www.liherald.com/uploads/original/20191231-142323-IMG_4179.JPG',
                                          reportUserId: null
                                      ));
                                      Navigator.pop(context);
                                    },
                                    color: Colors.red,
                                    child: Text('Submit',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight
                                                .w600
                                        )
                                    )
                                )
                            )
                          ]
                      )
                  )

                ]
            )
        )
    );
  }


}
