import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:safer_transportation/components/menu.dart';

class Report extends StatefulWidget {
  Report() : super();
  @override
  _ReportState createState() => _ReportState();
}



class _ReportState extends State<Report> {
  bool _select = false;

  String _reportSelection;
  List<Map> _reportJson = [
    {
      "id": 1,
      "image": 'assets/images/icon-syringe.png',
      "name": 'Syringe'
    },
    {
      "id": 2,
      "image": 'assets/images/icon-car.png',
      "name": 'Car Accident'
    },
    {
      "id": 3,
      "image": 'assets/images/icon-protest.png',
      "name": 'Protest'
    },
    {
      "id": 4,
      "image": 'assets/images/icon-fire.png',
      "name": 'Fire'
    },
    {
      "id": 5,
      "image": 'assets/images/icon-fight.png',
      "name": 'Street Fight'
    },
    {
      "id": 6,
      "image": 'assets/images/icon-other.png',
      "name": 'Other'
    }
  ];

  //empty function for backend later
  void submitButton() {
    setState(() {
      print("Submited Report");
    });
  }


  @override
  Widget build(BuildContext context) {
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
                                                      print(_reportSelection);
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
                                  width: 200,
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
                                              width: 200.0,
                                              height: 50.0,
                                              child: new TextFormField(
                                                decoration: new InputDecoration(
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
                    width: 30,
                    height: 30,
                    child: Align(
                      alignment: Alignment(.30, 2.0),
                      child: SizedBox(
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    )
                  ),


                  Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.all(15 ),
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
                                      submitButton();
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
