import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var userIDInput = TextEditingController();
  var userPassword = TextEditingController();
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
                    height: 300.0,
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
                            controller: userIDInput,
                            autocorrect: false,
                            autofocus: false,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                            decoration: InputDecoration(
                                hintText: "Username",
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
                            padding: EdgeInsets.all(10.0),
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
                            onPressed: (){
                              print("username: " + userIDInput.text);
                              print("password: " + userPassword.text);},
                            minWidth: 150.0,
                            color: Colors.lightBlue,
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

//                  )
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


