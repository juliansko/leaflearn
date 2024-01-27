import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:leaflearn/router/routes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
    String pass, String? from) async {
  // checks if the username and password are correct
  Uri url = Uri.http('localhost:3000', '/login');
  Map<String, String> requestBody = {
    'email': username,
    'password': pass,
  };

  try {
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody));
    print(response);
    if (response.statusCode == 200 && context.mounted) {
      context.read<LoginInfo>().login('user');
      // goes to the page it got redirected from or to home if not redirected
      if (from != null && from != '/home') {
        context.go(from);
      } else {
        context.go(HomeRoute(loggedIn: true).location);
      }
      // shows an error message if the username or password is incorrect
    } else if (response.statusCode == 401 && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.body),
        ),
      );
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed'),
        ),
      );
    }
  }
}
