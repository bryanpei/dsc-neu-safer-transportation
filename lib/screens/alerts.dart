import 'package:flutter/material.dart';
import 'package:safer_transportation/components/menu.dart';

class Alerts extends StatelessWidget {


//  @override
//  _AlertsState createState() => _AlertsState();
//}
//
//class _AlertsState extends State<Alerts> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Alerts',
          style: TextStyle(
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
        body: SafeArea(
          child: Center(
            child: SwitchWidget()
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
            child:  Switch(
              onChanged: toggleSwitch,
              value: switchControl,
              activeColor: Colors.blue,
              activeTrackColor: Colors.lightBlue,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
            )),

//          Text('$textHolder', style: TextStyle(
//              fontSize: 24,
//              color: Colors.black54),
//          )
    ]);
  }

}
