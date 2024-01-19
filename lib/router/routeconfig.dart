import 'package:go_router/go_router.dart';
import 'routes.dart';

final GoRouter router = GoRouter(
  routes: $appRoutes,
  initialLocation: '/home',

  redirect: (context, state) {
    return null;
    }
);