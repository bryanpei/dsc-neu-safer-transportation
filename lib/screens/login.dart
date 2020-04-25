import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safer_transportation/services/models/user.dart';
import 'package:safer_transportation/services/authentification/auth.dart';


class Login extends StatefulWidget {
  final Function toggleView;

  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  var userIDInput = TextEditingController();
  var userPassword = TextEditingController();
  String error = "";



  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
              'assets/images/background.jpg', // Background image goes here
              fit: BoxFit.cover
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/google-logo.png', // LOGO goes here
                  height: 120.0,
                  width: 120.0,
                ),
              ),
              Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container( // White container of log in box
                      height: 450.0,
                      width: 380.0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 25.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column( // first line of input
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 25.0,
                            ),
                            child: TextField(
                              key: _formKey,
                              controller: userIDInput,
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                              decoration: InputDecoration(
                                  hintText: "Email ",
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  contentPadding: EdgeInsets.all(15.0)
                              ),
                            ),
                          ),
                          TextField(
                            controller: userPassword,
                            autocorrect: false,
                            autofocus: false,
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                            decoration: InputDecoration(
                                hintText: "Password",
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(15.0)
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                    "Forgot Password ?",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w700
                                    ))
                              ],
                            ),
                          ),
                          MaterialButton(
                              onPressed: () async {
                                dynamic result = await _auth.signInWithEmailAndPassWord(userIDInput.text, userPassword.text);

                                if (result == null) {
                                  if (userIDInput.text.isEmpty) {
                                    setState(() {
                                      error = 'Please supply a valid email';
                                  });

                                  } else if (userPassword.text.isEmpty) {

                                    setState(() {
                                      error = 'Password cannot be empty';
                                  });

                                  } else {
                                    setState(() {
                                      error =
                                      "Could not sign in with the credentials";
                                    });
                                  }
                                  return result;
                                } else {
                                  return result;

    }

                              },
                            minWidth: 150.0,
                            color: Colors.lightGreen,
                            splashColor: Colors.lightBlueAccent[800],
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10.0,
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          MaterialButton(
//
                            onPressed: () async {
                              widget.toggleView();
                              print("username: " + userIDInput.text);
                              print("password: " + userPassword.text);
                            },
                            minWidth: 150.0,
                            color: Colors.lightBlue,
                            splashColor: Colors.lightBlueAccent[800],
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10.0,
                            ),
                            child: Text(
                              "Sign up ",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () async { // ALLOWS sign in anynomously
////                           returns FirebaseUser({uid: sTQQm8F6poekjJstGAF5jhpgONI3,
////                             isAnonymous: true, providerData: [{uid: sTQQm8F6poekjJstGAF5jhpgONI3,
////                             providerId: firebase}], providerId: firebase,
////                             creationTimestamp: 1585099707597,
////                             lastSignInTimestamp: 1585099707597, isEmailVerified: false})
                              dynamic result = await _auth.signInAnon();
                              if (result == null) {
                                print("error signing in.");
                              } else {
                                print('signed in');
                                print("User Id is: " + result.uid);
                              }

                            },
                            minWidth: 150,
                            color: Colors.red,
                            splashColor: Colors.lightBlueAccent[800],
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10.0,
                              ),
                              child: Text(
                              "Sign In Anonymously",
                              style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white
                              ),
                              ),
                          ),

//                           Display error, if any
                          SizedBox(height:12.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),

                        ],
                      ),
                    ),


                  )
                ],

              ),
            ],
          ),
        ],
      ),
    );
  }
}


