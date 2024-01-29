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
          const SizedBox(
            height: 16,
          ),
          FutureBuilder(
            future: checkConnection(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const ElevatedButton(
                  onPressed: null,
                  child: Text('Login'),
                );
              } else {
                bool status = snapshot.data ?? false;

                if (status) {
                  return ElevatedButton(
                    onPressed: () {
                      loginUser(context, widget, _userNameController.text,
                          _passwordController.text, widget.from);
                    },
                    child: const Text('Login'),
                  );
                } else {
                  return Column(
                    children: [
                      const ElevatedButton(
                        onPressed: null,
                        child: Text('Login'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'No connection to the server',
                        style: TextStyle(color: Colors.red),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(
                              () {}); // This will trigger a rebuild of the FutureBuilder
                        },
                        child: const Icon(Icons.refresh),
                      ),
                    ],
                  );
                }
              }
            },
          )
        ],
      ),
    );
  }
}
