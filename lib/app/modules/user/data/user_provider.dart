import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String? loggedInUser;
  String? loggedInUserPassword;

  void loginUser(String username, String password) {
    loggedInUser = username;
    loggedInUserPassword = password;
    notifyListeners();
  }

  void logoutUser() {
    loggedInUser = null;
    loggedInUserPassword = null;
    notifyListeners();
  }
}
