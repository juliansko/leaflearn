import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:leaflearn/models/user.model.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:leaflearn/router/routes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Creates class LoginInfo

String? backend = dotenv.env["BACKEND_URI"];

class LoginInfo extends ChangeNotifier {
  LoginInfo();
  UserModel? user;
  String get userName {
    if (user != null) {
      return user!.firstName;
    } else {
      return '';
    }
  }

  bool get loggedIn => userName.isNotEmpty;

  // notifies the login
  void login(UserModel userModel) {
    user = userModel;
    notifyListeners();
  }

  // deletes user from session
  void logout() {
    user = null;
    notifyListeners();
  }
}

void headBack(BuildContext context, String? from) {
  if (from != null && from != '/home') {
    context.go(from);
  } else {
    context.go(HomeRoute(loggedIn: false).location);
  }
}

Future<bool> checkConnection() async {
  Uri url = Uri.http(backend!, '/');

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}

void loginUser(BuildContext context, Widget widget, String username,
    String pass, String? from) async {
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
    if (response.statusCode == 200 && context.mounted) {
      var user = UserModel.fromJson(json.decode(response.body)['user']);
      context.read<LoginInfo>().login(user);
      // goes to the page it got redirected from or to home if not redirected
      headBack(context, from);
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
