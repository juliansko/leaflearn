import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leaflearn/router/routes.dart';
import 'package:leaflearn/services/loginservice.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage(this.from, {Key? key}) : super(key: key);
  final String? from;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          context.read<LoginInfo>().login('user');
          if (widget.from != null && widget.from != '/home') {
            context.go(widget.from!);
          } else {
            context.go(HomeRoute(loggedIn: true).location);
          }
        },
        child: Text('Login'),
      )),
    );
  }
}
