import 'package:flutter/material.dart';
import 'package:safer_transportation/screens/authenticate/authenticate.dart';
import 'package:safer_transportation/services/authentification/auth.dart';



class SignUp extends StatefulWidget {
  final Function toggleView;

  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();

  var userName = TextEditingController();
  var userEmail = TextEditingController();
  var userEmergency = TextEditingController();
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
                            child:
                            TextField(
                              controller: userName,
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                              decoration: InputDecoration(
                                  hintText: "Name",
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  contentPadding: EdgeInsets.all(15.0)
                              ),
                            ),

                          ),
                          TextField(
                            controller: userEmail,
                            autocorrect: false,
                            autofocus: false,
//                            obscureText: true,
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
                          TextField(
                            controller: userEmergency,
                            autocorrect: false,
                            autofocus: false,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                            decoration: InputDecoration(
                                hintText: "Emergency Contact",
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(15.0)
                            ),
                          ),
//                          TextField(
//                            controller: userIDInput,
//                            autocorrect: false,
//                            autofocus: false,
//                            obscureText: true,
//                            style: TextStyle(
//                              fontSize: 20.0,
//                            ),
//                            decoration: InputDecoration(
//                                hintText: "UserID",
//                                border: InputBorder.none,
//                                filled: true,
//                                fillColor: Colors.grey[200],
//                                contentPadding: EdgeInsets.all(15.0)
//                            ),
//                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FlatButton.icon(
                                  onPressed: () {
//                                    Authenticate();
                                  },
                                    icon: Icon(Icons.favorite,
                                        color: Colors.white),
                                    label: Text("Already have an account?",
                                      style: TextStyle(
                                        color: Colors.black
                                      ),
                                    ),
                                ),
//                                Text(
//                                    "Already have an account?",
//                                    style: TextStyle(
//                                        fontSize: 14.0,
//                                        fontWeight: FontWeight.w700
//                                    )
//                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(00.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
//                                Text(
//                                    "Forgot Password ?",
//                                    style: TextStyle(
//                                        fontSize: 14.0,
//                                        fontWeight: FontWeight.w700
//                                    ))
                              ],
                            ),
                          ),

                          MaterialButton(
                            onPressed: () async {

                              print("password: " + userPassword.text);
                              print("name: " + userName.text);
                              print("email: " + userEmail.text);
                              print("emergency contact" + userEmergency.text);
                              dynamic result = await _auth.signUpWithEmailAndPassWord(
                                  userEmail.text, userPassword.text);
                              if (userEmail.text.isEmpty || userPassword.text.isEmpty) {
                                result = null;
                                print("error");
                                return null;
                              }


                              widget.toggleView();
                            },

                            minWidth: 150.0,
                            color: Colors.lightBlue,
                            splashColor: Colors.lightBlueAccent[800],
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10.0,
                            ),
                            child: Text(
                              "Sign Up",
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


