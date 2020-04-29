import 'package:flutter/material.dart';
import 'package:safer_transportation/components/menu.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // app bar
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        drawer: Menu(), // menu
        body: Container(
            // body part
            color: Colors.white,
            child: ListView(children: <Widget>[
              Container(
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              //profile pic
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
                          ]))),
              Container(
                //boarder
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                  color: Colors.grey,
                ))),
              ),
              Container(
                // Person's name info
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        // first name
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 6.0),
                        child: Text(
                          'First Name',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        // name
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 15.0),
                        child: Text(
                          'John',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        // last name
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 6.0),
                        child: Text(
                          'Last Name',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        // name
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 15.0),
                        child: Text(
                          'Doe',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // boarder
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                  color: Colors.grey,
                ))),
              ),
              Container(
                // Contact information
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        // email
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 6.0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        // exact email
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 15.0),
                        child: Text(
                          'johndoe@gmail.com',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        //password
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 6.0),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        // hided password
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 15.0),
                        child: Text(
                          '............',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        // phone number
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 6.0),
                        child: Text(
                          'Phone number',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        // exact phone number
                        padding: EdgeInsets.all(2),
                        child: Text(
                          '+1 (123) 456 789',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}
