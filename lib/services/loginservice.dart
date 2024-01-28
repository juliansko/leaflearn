import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:leaflearn/services/authservice.dart';
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
  if (await readSecure('leaflearnAuthToken') != null && context.mounted) {
    context.read<LoginInfo>().login(username);
    // goes to the page it got redirected from or to home if not redirected
    if (from != null && from != '/home') {
      context.go(from);
    } else {
      context.go(HomeRoute(loggedIn: true).location);
    }
    return null;
  }

  String? backend = dotenv.env["BACKEND_URI"];

  Uri url = Uri.http(backend!, '/login');
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
      var token = jsonDecode(response.body)['token'];
      print(token);
      await writeSecure('authToken', token);
      var user = jsonDecode(response.body)['user'];
      print(user['experience']);
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
    print(e);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed'),
        ),
      );
    }
  }
}
