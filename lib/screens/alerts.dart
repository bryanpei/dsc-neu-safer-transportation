import 'package:flutter/material.dart';
import 'package:safer_transportation/components/menu.dart';

class Alerts extends StatefulWidget {

  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State {

  bool alertControl = false;
  bool syringeBox = false;
  bool accidentBox = false;
  bool noiseBox = false;
  bool fireBox = false;
  bool fightBox = false;
  bool otherBox = false;

  double sliderValue = 0.0;

  void saveAlertsSetting() {
    // TODO: Need to implement save button.
    setState(() {
      // Alert notifications should pop-up for checked alert types when user
      // is within the set radius.
      print("Alert preferences are saved");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Alerts',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              iconTheme: IconThemeData(
                color: Colors.black54,
              ),
              bottom: PreferredSize(
                child: Container(
                    color: Colors.grey, height: 2.0),
                preferredSize: Size.fromHeight(2.0),
              ),
            ),
            drawer: Menu(),
            body: Center(
                child: Column(
                  children: <Widget>[
                  // The header, which includes Alerts and toggle switch
                  Container(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // The header: Alerts
                        Container(
                          margin: EdgeInsets.all(20.0),
                          child: Text('Alerts', style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black
                          )),
                        ),
                        // The header: Toggle switch
                        Container(
                          child: SwitchWidget(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: SizedBox(height: 10)
                  ),
                  // Container for the 'Type' header
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text('Type', style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54
                    ),),
                  ),
                    // Containers for the alerts setting
                    Container(
                      // Syringe Checkbox
                        child: Row(
                          children: <Widget>[
                          Checkbox(
                            value: syringeBox,
                            activeColor: Colors.black,
                            onChanged: (bool value) {
                              setState(() {
                                syringeBox = value;
                              });
                              },
                          ),
                          Container(
                            width: 22.0,
                            height: 22.0,
                            child: SizedBox(
                              child: Image.asset('assets/images/icon-syringe.png')
                            )
                          ),
                          Container(
                              child: Text('Syringe', style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black
                              ),)
                          )
                        ],
                        )
                    ),
                    Container(
                      // Car Accident Checkbox
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: accidentBox,
                              activeColor: Colors.black,
                              onChanged: (bool value) {
                                setState(() {
                                  accidentBox = value;
                                });
                                },
                            ),
                            Container(
                                width: 22.0,
                                height: 22.0,
                                child: SizedBox(
                                    child: Image.asset('assets/images/icon-car.png')
                                )
                            ),
                            Container(
                                child: Text('Car accident', style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black
                                ),)
                            )
                          ],
                        )
                    ),
                    Container(
                      // Noise Checkbox
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: noiseBox,
                              activeColor: Colors.black,
                              onChanged: (bool value) {
                                setState(() {
                                  noiseBox = value;
                                });
                                },
                            ),
                            Container(
                                width: 22.0,
                                height: 22.0,
                                child: SizedBox(
                                    child: Image.asset('assets/images/icon-protest.png')
                                )
                            ),
                            Container(
                                child: Text('Noise', style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black
                                ),)
                            )
                          ],
                        )
                    ),
                    Container(
                      // Fire Checkbox
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: fireBox,
                              activeColor: Colors.black,
                              onChanged: (bool value) {
                                setState(() {
                                  fireBox = value;
                                });
                              },
                            ),
                            Container(
                                width: 22.0,
                                height: 22.0,
                                child: SizedBox(
                                    child: Image.asset('assets/images/icon-fire.png')
                                )
                            ),
                            Container(
                                child: Text('Fire', style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black
                                ),)
                            )
                          ],
                        )
                    ),
                    Container(
                      // Noise Checkbox
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: fightBox,
                              activeColor: Colors.black,
                              onChanged: (bool value) {
                                setState(() {
                                  fightBox = value;
                                });
                              },
                            ),
                            Container(
                                width: 22.0,
                                height: 22.0,
                                child: SizedBox(
                                    child: Image.asset('assets/images/icon-fight.png')
                                )
                            ),
                            Container(
                                child: Text('Street Fight', style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black
                                ),)
                            )
                          ],
                        )
                    ),
                    Container(
                      // Other Checkbox
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: otherBox,
                              activeColor: Colors.black,
                              onChanged: (bool value) {
                                setState(() {
                                  otherBox = value;
                                });
                              },
                            ),
                            Container(
                                width: 22.0,
                                height: 22.0,
                                child: SizedBox(
                                    child: Image.asset('assets/images/icon-other.png')
                                )
                            ),
                            Container(
                                child: Text('Other', style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black
                                ),)
                            )
                          ],
                        )
                    ),
                    // Spacer between Type and Radius
                    SizedBox(height: 16),
                    // Radius
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text('Radius', style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 50.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text('0', style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black
                            ),),
                          ),
                          Container(
                            child: SizedBox(
                              width: 220,
                            ),
                          ),
                          Container(
                            child: Text('20 miles', style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black
                            ),),
                          )
                        ],
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 100.0),
                      child: Slider(
                          min: 0,
                          max: 20,
                          activeColor: Colors.blueAccent,
                          //inactiveColor: Colors.blue,
                        value: sliderValue,
                        onChanged: (value) {
                            setState(() {
                              sliderValue = value;
                            });
                        }
                      ),
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          saveAlertsSetting();
                        },
                        color: Colors.red,
                        padding: EdgeInsets.only(
                            left: 60.0,
                            top: 10.0,
                            right: 60.0,
                            bottom: 10.0
                        ),
                        child: Text('Save', style: TextStyle(
                            color: Colors.white
                        ),),
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
}



class SwitchWidget extends StatefulWidget {
  @override
  SwitchWidgetClass createState() =>  new SwitchWidgetClass();
}

class SwitchWidgetClass extends State {

  bool switchControl = false;
  var textHolder = 'Switch is OFF';

  void toggleSwitch(bool value)  {

    if(switchControl == false) {
      setState(() {
        switchControl = true;
        textHolder = 'Switch is ON';
      });
      print('Switch is ON');
       // Code for when the switch is ON



    } else  {
      setState(() {
        switchControl = false;
        textHolder = 'Switch is OFF';
      });
      print('Switch is  OFF');
      // Code for when the switch is OFF


    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
        children: [Transform.scale(
            scale: 1.0,
            child: Switch(
              onChanged: toggleSwitch,
              value: switchControl,
              activeColor: Colors.blueAccent,
              activeTrackColor: Colors.blue[200],
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
            )),
    ]);
  }


}
