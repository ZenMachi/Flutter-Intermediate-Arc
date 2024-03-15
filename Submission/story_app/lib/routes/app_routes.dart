import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/ui/login_page.dart';
import 'package:story_app/features/authentication/ui/register_page.dart';
import 'package:story_app/features/story/ui/story_detail_page.dart';
import 'package:story_app/features/story/ui/story_page.dart';
import 'package:story_app/home_page.dart';

class AppRouter {
  static final _rootNavigationKey = GlobalKey<NavigatorState>();
  static final _shellNavigationKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.root,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigationKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigationKey,
        builder: (context, state, child) {
          return HomePage(child: child);
        },
        routes: [
          GoRoute(
            name: Routes.root,
            path: Routes.root,
            builder: (context, state) => const StoryPage(),
            routes: [
              GoRoute(
                name: Routes.storyDetailsNamedPage,
                path: "${Routes.storyDetailsNamedPage}/:id",
                builder: (context, state) =>
                    StoryDetailPage(id: state.pathParameters["id"]!),
              )
            ],
          ),
          GoRoute(
            name: Routes.loginNamedPage,
            path: Routes.loginNamedPage,
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            name: Routes.registerNamedPage,
            path: Routes.registerNamedPage,
            builder: (context, state) => const RegisterPage(),
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
