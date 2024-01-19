import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';

import 'themes/dark.dart';
import 'themes/light.dart';
import 'package:leaflearn/services/loginservice.dart';
import 'package:leaflearn/router/routes.dart';

void main() {
  // starts app
  runApp(App());
}

class App extends StatelessWidget {
   App({super.key});

  final LoginInfo loginInfo = LoginInfo();

  // application root
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<LoginInfo>.value(
    
      value: loginInfo,
      child: MaterialApp.router(
        routerConfig: _router,
        darkTheme: darkTheme,
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    );

    late final GoRouter _router = GoRouter(
      routes: $appRoutes,

      redirect: (BuildContext context, GoRouterState state) {
      final bool loggedIn = loginInfo.loggedIn;

      // check just the matchedLocation in case there are query parameters
      final String loginLoc = LoginRoute().location;
      final bool goingToLogin = state.matchedLocation == loginLoc;

      // the user is not logged in and not headed to /login, they need to login
      if (!loggedIn && !goingToLogin) {
        String from = state.matchedLocation;
        return LoginRoute(from: from).location;
      }

      // the user is logged in and headed to /login, no need to login again
      if (loggedIn && goingToLogin) {
        return HomeRoute().location;
      }

      // no need to redirect at all
      return null;
    },

    // changes on the listenable will cause the router to refresh it's route
    refreshListenable: loginInfo,
  );
}

