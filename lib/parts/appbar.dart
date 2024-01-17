import 'package:flutter/material.dart';

AppBar makeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.tertiary,
    // Here we take the value from the MyHomePage object that was created by
    // the App.build method, and use it to set our appbar title.
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(
            right:
                20.0), // idk why this needs to be const but the app is so much faster when it is
        child: Image.asset(
          'images/logo.png',
          height: 50,
        ),
      )
    ],
  );
}
