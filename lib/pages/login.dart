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
              login(context, widget, _userNameController.text,
                  _passwordController.text, widget.from);
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
