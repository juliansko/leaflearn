import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leaflearn/router/routes.dart';
import 'package:leaflearn/services/loginservice.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage(this.from, {Key? key}) : super(key: key);
  final String? from;
  final formKey = GlobalKey<FormState>();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Username',
            ),
            controller: _userNameController,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Password',
            ),
            obscureText: true,
            controller: _passwordController,
          ),
          ElevatedButton(
            onPressed: () {
              if (_userNameController.text == 'user' &&
                  _passwordController.text == 'password') {
                context.read<LoginInfo>().login('user');
                if (widget.from != null && widget.from != '/home') {
                  context.go(widget.from!);
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
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
