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
  var email = "";
  var password = "";
  bool loading = false;
  var userIDInput = TextEditingController();
  var userPassword = TextEditingController();
  String error = "";


  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomPadding: true,

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/images/white.jpg', // Background image goes here
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Image.asset(
                  'assets/images/SP_logo.png', // LOGO goes here
                  height: 150.0,
                  width: 150.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        "       Sign In",
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Lato'
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "                  Hi there! Nice to see you again.",
                      style: TextStyle(
                        color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Lato'
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                     "Email",
                      style: TextStyle(
                          color: Color.fromRGBO(238, 56, 64, 1.0),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Lato'
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 0.0,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height:0.0),
                      TextFormField(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Lato'
                        ),
                      decoration: InputDecoration(
                        hintText: 'example@gmail.com',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                        validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height:10.0),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Password",
                              style: TextStyle(
                                  color: Color.fromRGBO(238, 56, 64, 1.0),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Lato'
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Lato'
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter password',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: (val) => val.length < 6 ?
                        'Enter a password 6+ chars long' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                    ],
                  )
                )
              ),
                SizedBox(height: 20.0),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.red)
                  ),
                  onPressed: () async {

                    if(_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassWord(email, password);
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = "Could not sign in with the credentials";
                        });
                      }

                    }
                              },
                            minWidth: 250.0,
                            color: Color.fromRGBO(238, 56, 64, 1.0),
//                            splashColor: Colors.lightBlueAccent[800],
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10.0,
                            ),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white

                              ),
                            ),
                          ),
              SizedBox(height: 5.0),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.grey)
                  ),
                onPressed: () async {
                  setState(() => loading = true);
                  dynamic result = await _auth.signInAnon();

                  if (result == null) {
                   print("error signing in.");
                  } else {
                    print('signed in');
                    print("User Id is: " + result.uid);
                  }

                },
                minWidth: 250.0,
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.remove_red_eye, size: 20),
                      ),
                      TextSpan(
                        text: "  Sign In Anonymously",
                        style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[700]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:12.0),

              InkWell(
                child: Text("Don't have an account? Sign Up",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Lato',
                )
                ),
                onTap: () {
                  widget.toggleView();}
              ),
              SizedBox(height:12.0),

              // Display error message (if any)
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),

            ],
          ),
        ],
      ),
    );
  }
}


