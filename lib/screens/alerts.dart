import 'package:flutter/material.dart';
import 'package:safer_transportation/components/menu.dart';

class Alerts extends StatefulWidget {

  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State {

  bool alertControl = false;
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Alerts',
                style: TextStyle(
                    fontSize: 20.0,
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
                child: Column(children: <Widget>[
                  // The header, which includes Alerts and toggle switch
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // The header: Alerts
                        Container(
                          margin: EdgeInsets.all(20.0),
                          child: Text('Alerts', style: TextStyle(
                              fontSize: 18.0,
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
                  // The alerts setting, which would be hidden when switch is OFF
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text('Type', style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54
                      ),),
                    ),
                    Row( children: <Widget>[
                      Checkbox(
                        value: checkBoxValue,
                        activeColor: Colors.black,
                        onChanged: (bool value) {
                          setState(() {
                            checkBoxValue = value;
                          });
                        },
                      ),
                      Text('Syringe', style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black
                      ),)
                    ],
                    )
                  ],)
                ],)
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
              activeTrackColor: Colors.blueAccent,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
            )),

//          Text('$textHolder', style: TextStyle(
//              fontSize: 24,
//              color: Colors.black54),
//          )
    ]);
  }


  // The checkboxes in the Alerts settings, which will be visible whenever
  // toggle is switched to ON













}
