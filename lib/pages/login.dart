import 'package:flutter/material.dart';
import 'package:leaflearn/services/loginservice.dart';

class LoginPage extends StatefulWidget {
  LoginPage(this.from, {Key? key}) : super(key: key);
  final String? from;
  final formKey = GlobalKey<FormState>();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controllers in order to access the text in the text fields
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  // garbage collection after the page is closed
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // returns all the widgets in a column
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Username',
            ),
            controller: _userNameController,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            // hides the password
            obscureText: true,
            controller: _passwordController,
          ),
          ElevatedButton(
            onPressed: () {
              loginUser(context, widget, _userNameController.text,
                  _passwordController.text, widget.from);
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
