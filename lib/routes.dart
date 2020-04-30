// routes for the app

import 'package:flutter/material.dart';
import 'package:safer_transportation/screens/home.dart';
import 'package:safer_transportation/screens/login.dart';
import 'package:safer_transportation/screens/tmp_main.dart';
import 'package:safer_transportation/screens/signup.dart';
import 'package:safer_transportation/screens/profile.dart';
import 'package:safer_transportation/screens/report.dart';
import 'package:safer_transportation/screens/settings.dart';
import 'package:safer_transportation/components/event_card.dart';
import 'package:safer_transportation/screens/alerts.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => Menu(),
  '/login': (BuildContext context) => Login(),
  '/profile': (BuildContext context) => Profile(),
  '/alerts': (BuildContext context) => Alerts(),
  '/signup': (BuildContext context) => SignUp(),
  '/report': (BuildContext context) => Report(),
  '/settings': (BuildContext context) => Settings(),
  '/eventcard': (BuildContext context) => EventCard(),
  '/map': (BuildContext context) => Home(),
};