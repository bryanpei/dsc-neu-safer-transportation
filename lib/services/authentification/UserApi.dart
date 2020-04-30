import 'dart:collection';

import 'package:safer_transportation/services/models/event.dart';

abstract class UserApi {

  /// Check whether [username] and [password] match in database.
  bool authenticate(String username, String password);

  /// Fetch user's information with provided [userID].
  /// map keys: [firstName], [lastName], [email], [phoneNumber], [avatarUrl]
  HashMap<String, String> fetchUserInfo(String userID);

  /// Fetch user's settings data with provided [userID]
  /// map keys: [savedPlaces], [emergencyContact]
  /// [savedPlaces] is a map of <tag> : <address>.
  /// For example, 'home': 'some address'.
  HashMap<String, String> fetchUserSettings(String userID);

  /// Fetch events the user has reported with provided [userID].
  List<Event> fetchReportedEvents(String userID);
}