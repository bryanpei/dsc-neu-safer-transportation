import 'package:flutter/material.dart';
import 'package:safer_transportation/components/menu.dart';
import 'package:safer_transportation/services/data/UserInfo.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                      child: Container(
                              child: Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(UserInfo.avatarUrl),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 70,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle
                                      ),
                                      child: IconButton(
                                        color: Colors.white,
                                        icon: Icon(Icons.edit),
                                        onPressed: () {},
                                      )
                                    ),
                                  )
                                ],
                              ),
                            ),
                  )
              ),
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/edit', arguments: {
                              'field': 'First Name',
                            });
                          },
                          child: Text(
                            UserInfo.firstName,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        // last name
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 6.0),
                        child: Container(
                          child: Text(
                            'Last Name',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        // name
                        padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 15.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/edit', arguments: {
                              'field': 'Last Name',
                            });
                          },
                          child: Text(
                            UserInfo.lastName,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/edit', arguments: {
                              'field': 'Email',
                            });
                          },
                          child: Text(
                            UserInfo.email,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/edit', arguments: {
                              'field': 'Password',
                            });
                          },
                          child: Text(
                            '............',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/edit', arguments: {
                              'field': 'Phone',
                            });
                          },
                          child: Text(
                            UserInfo.phone,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
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
