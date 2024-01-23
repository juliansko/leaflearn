import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:leaflearn/router/routes.dart';

// Creates class LoginInfo
class LoginInfo extends ChangeNotifier {
  LoginInfo();
  String _userName = '';
  String get userName => _userName;
  bool get loggedIn => _userName.isNotEmpty;

  // notifies the login
  void login(String userName) {
    _userName = userName;
    notifyListeners();
  }

  // deletes user from session
  void logout() {
    _userName = '';
    notifyListeners();
  }
}

void loginUser(BuildContext context, Widget widget, String username,
    String pass, String? from) {
  // checks if the username and password are correct
  if (username == 'user' && pass == 'password') {
    // reads and refreshes the context regarding the logininfo
    context.read<LoginInfo>().login('user');
    // goes to the page it got redirected from or to home if not redirected
    if (from != null && from != '/home') {
      context.go(from);
    } else {
      context.go(HomeRoute(loggedIn: true).location);
    }
    // shows an error message if the username or password is incorrect
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invalid username or password'),
      ),
    );
  }
}
