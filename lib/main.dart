import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'themes/dark.dart';
import 'themes/light.dart';
import 'package:leaflearn/services/loginservice.dart';
import 'package:leaflearn/router/routes.dart';

Future<void> main() async {
  // starts app
  await dotenv.load(fileName: '.env');
  runApp(App());
}

class App extends StatelessWidget {
  // loads the root key that holds all the states
  App({super.key});

  // initialize the login info
  final LoginInfo loginInfo = LoginInfo();

  // application root
  @override
  // initialize notifier
  Widget build(BuildContext context) => ChangeNotifierProvider<LoginInfo>.value(
        value: loginInfo,
        child: MaterialApp.router(
          // calls the router
          routerConfig: _router,
          // loads the themes
          darkTheme: darkTheme,
          theme: lightTheme,
          // removes the debug banner
          debugShowCheckedModeBanner: false,
        ),
      );

  // the router
  late final GoRouter _router = GoRouter(
    // imports the routes from router/routes.dart
    routes: $appRoutes,

    // redirects the user to the login page if they are not logged in
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
