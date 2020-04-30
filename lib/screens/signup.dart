import 'package:flutter/material.dart';
import 'package:safer_transportation/services/authentification/auth.dart';
import 'package:safer_transportation/shared/loading.dart';


class SignUp extends StatefulWidget {
  final Function toggleView;

  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  var email = "";
  var password = "";
  String error = "";
  bool loading = false;

  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
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
                      "       Sign Up",
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
                        SizedBox(height: 0.0),
                        TextFormField(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Lato'
                          ),
                          decoration: InputDecoration(
                            hintText: 'Your Email Address',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          validator: (val)    =>

                          val.isEmpty
                              ? 'Enter a valid email address'
                              : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 0.0),
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
                          validator: (val) =>
                          val.length < 6 ?
                          'Enter a password 6+ chars long' : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                      ],
                    ),
                  )
              ),
              SizedBox(height: 40.0),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.red)
                ),
                onPressed: () async {

                  if(_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.signUpWithEmailAndPassWord(email, password);
                    if (result == null) {
                      setState(() {
                        loading = false;
                        error = "Could not sign up with the credentials";
                      });
                    }

                  }
                },
                minWidth: 250.0,
                color: Color.fromRGBO(238, 56, 64, 1.0),
//                            splashColor: Colors.lightBlueAccent[800],
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 15.0,
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w800,
                      color: Colors.white

                  ),
                ),
              ),
              SizedBox(height:12.0),
              InkWell(
                child: Text("Have an account? Sign In",
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Lato',
                )
                ),

                onTap: () {widget.toggleView();
                },
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
    );
  }

}