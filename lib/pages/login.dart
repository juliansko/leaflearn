import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leaflearn/router/routes.dart';
import 'package:leaflearn/services/loginservice.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage(this.from, {Key? key}) : super(key: key);
  final String? from;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<LoginInfo>().login('user');
            if(from !=null && from != '/home') {
              context.go(from!);
            } else {
              context.go(HomeRoute(loggedIn: true).location);
            }
          },
          child: Text('Login'),
          )
      ),
    );
  }

}