// This Wrapper is used to change state of user. For example, when the user
// first come to the app, they will be directed to screen that requires them
// to either log in with their credentials or sign in anonymously (able to see
// pins but not post new reports)

//import 'dart:js_util';

import 'package:provider/provider.dart';
import 'package:safer_transportation/models/user.dart';
import 'package:safer_transportation/screens/home.dart';
import 'package:safer_transportation/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context); // state of user, logged in/out
    // If user is not logged in:

    if (user == null) {
      return Authenticate(); // show signin screen
    } else {
      return Home(); // show home screen
    }
    // If logged in, show home screen

//    print(user);


//    return
  }
}
