import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:leaflearn/router/routes.dart';

class LoginInfo extends ChangeNotifier {
  LoginInfo();
  String _userName = '';
  String get userName => _userName;
  bool get loggedIn => _userName.isNotEmpty;

  void login(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void logout() {
    _userName = '';
    notifyListeners();
  }
}

void login(BuildContext context, Widget widget, String username, String pass,
    String? from) {
  if (username == 'user' && pass == 'password') {
    context.read<LoginInfo>().login('user');
    if (from != null && from != '/home') {
      context.go(from);
    } else {
      context.go(HomeRoute(loggedIn: true).location);
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Invalid username or password'),
      ),
    );
  }
}
