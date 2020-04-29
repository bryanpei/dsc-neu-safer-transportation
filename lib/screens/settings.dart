import 'package:flutter/material.dart';
import 'package:safer_transportation/components/menu.dart';
import 'package:safer_transportation/components/text_update_tool.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _homeAddress = "Add";
  String _workAddress= "Add";
  String _emergencyContact= "Add";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          //user profile pic
                          padding: EdgeInsets.all(10),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'assets/images/user-profile-pic.png'),
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                        Padding(
                          //user info
                            padding: EdgeInsets.all(10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Text(
                                      'John',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Text(
                                      'johndoe@gmail.com',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Text(
                                      '+1(123)456 789',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ])),
                      ]),
                )), //profile pic and info
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                      ))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          'Places',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(2),
                          child: GestureDetector(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 0),
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Home",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '$_homeAddress',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onTap: () async{
                              String value= await _textUpdateMethod(context);
                              setState(() {
                                _homeAddress= value;
                              });
                            },
                          )),
                      Padding(
                        padding: EdgeInsets.all(2),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                              child: Icon(
                                Icons.business_center,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: GestureDetector(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Work",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '$_workAddress',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                onTap: ()async{
                                  String value= await _textUpdateMethod(context);
                                setState(() {
                                  _workAddress= value;
                                });

                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: InkWell(
                          child: Text(
                            'More places',
                            style: TextStyle(color: Colors.blue[800]),
                          ),
                          onTap: () {
                            print('add more places');
                          },
                        ),
                      )
                    ]),
              ),
            ), //Places
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                      ))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Safety',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(2),
                          child: Row(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                              child: Icon(
                                Icons.import_contacts,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: GestureDetector(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Emergency Contact",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '$_emergencyContact',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                onTap: ()async{
                                  String value= await _textUpdateMethod(context);
                                  setState(() {
                                    _emergencyContact= value;
                                  });
                                },
                              ),
                            ),
                          ])),
                    ]),
              ),
            ), //Safety
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                      ))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: InkWell(
                    child: Text(
                      'Sign out',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      print("Signed out");
                    }),
              ),
            ) //Sign out
          ],
        ),
      ),
    );
  }

  _textUpdateMethod(BuildContext context) async {

    return await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TextUpdate()),
    );
  }

}

