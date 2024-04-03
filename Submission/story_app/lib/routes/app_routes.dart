import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/data/auth_repository.dart';
import 'package:story_app/features/authentication/data/data_source/local/auth_local_data_source.dart';
import 'package:story_app/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:story_app/features/authentication/ui/login_page.dart';
import 'package:story_app/features/authentication/ui/register_page.dart';
import 'package:story_app/features/settings/ui/settings_page.dart';
import 'package:story_app/features/story/ui/add_story/add_location_page.dart';
import 'package:story_app/features/story/ui/add_story/add_story_page.dart';
import 'package:story_app/features/story/ui/detail_story/detail_location_page.dart';
import 'package:story_app/features/story/ui/detail_story/story_detail_page.dart';
import 'package:story_app/features/story/ui/stories/story_location_page.dart';
import 'package:story_app/features/story/ui/stories/story_page.dart';
import 'package:story_app/ui/home_page.dart';

class AppRouter {
  static final _rootNavigationKey = GlobalKey<NavigatorState>();
  static final _shellNavigationKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.root,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigationKey,
    redirect: (context, state) async {
      final local = AuthLocalDataSource();
      final remote = AuthRemoteDataSource(Client());
      final repo =
          AuthRepository(remoteDataSource: remote, localDataSource: local);
      final checkLogin = await repo.checkLogin();
      final isInLogin = state.matchedLocation == Routes.login;
      final isInRoot = state.matchedLocation == Routes.root;
      final toRegister = state.path == Routes.register;

      if (!checkLogin && isInRoot) {
        return Routes.login;
      } else if (isInLogin && toRegister) {
        return Routes.register;
      } else if (checkLogin && isInLogin) {
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
            pageBuilder: (context, state) => const NoTransitionPage(
              child: StoryPage(),
            ),
            routes: [
              GoRoute(
                name: Routes.storyDetails,
                path: "${Routes.storyDetails}/:id",
                pageBuilder: (context, state) => NoTransitionPage(
                  child: StoryDetailPage(id: state.pathParameters["id"]!),
                ),
                routes: [
                  GoRoute(
                    name: Routes.detailLocation,
                    path: "${Routes.detailLocation}/:latString,:lonString",
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: DetailLocationPage(
                        latString: state.pathParameters["latString"]!,
                        lonString: state.pathParameters["lonString"]!,
                      ),
                    ),
                  ),
                ],
              ),
              GoRoute(
                name: Routes.addStory,
                path: Routes.addStory,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: AddStoryPage(),
                ),
                routes: [
                  GoRoute(
                    name: Routes.addLocation,
                    path: Routes.addLocation,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: AddLocationPage(),
                    ),
                  ),
                ],
              ),
              GoRoute(
                name: Routes.settings,
                path: Routes.settings,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: SettingsPage(),
                ),
              ),
              GoRoute(
                name: Routes.maps,
                path: Routes.maps,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: StoryLocationPage(),
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
