import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/data/local/auth_local_data_source.dart';
import 'package:story_app/features/authentication/ui/login_page.dart';
import 'package:story_app/features/authentication/ui/register_page.dart';
import 'package:story_app/features/settings/ui/settings_page.dart';
import 'package:story_app/features/story/ui/add_story_page.dart';
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
    redirect: (context, state) async {
      final prefs = AuthLocalDataSource();
      final isLoggedIn = await prefs.isLoggedIn();
      final user = await prefs.getUser();
      final hasToken = user?.token != null;
      final isInLogin = state.matchedLocation == Routes.login;
      final isInRoot = state.matchedLocation == Routes.root;
      final toRegister = state.path == Routes.register;

      if (!isLoggedIn && !hasToken && isInRoot) {
        return Routes.login;
      } else if (isInLogin && toRegister) {
        return Routes.register;
      } else if (isLoggedIn && isInLogin && hasToken) {
        return Routes.root;
      } else {
        return null;
      }
    },
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
            pageBuilder: (context, state) => NoTransitionPage(
              child: StoryPage(),
            ),
            routes: [
              GoRoute(
                name: Routes.storyDetails,
                path: "${Routes.storyDetails}/:id",
                pageBuilder: (context, state) => NoTransitionPage(
                  child: StoryDetailPage(id: state.pathParameters["id"]!),
                ),
              ),
              GoRoute(
                name: Routes.addStory,
                path: Routes.addStory,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: AddStoryPage(),
                ),
              ),
              GoRoute(
                name: Routes.settings,
                path: Routes.settings,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: SettingsPage(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: Routes.login,
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: Routes.register,
        path: Routes.register,
        builder: (context, state) => const RegisterPage(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
