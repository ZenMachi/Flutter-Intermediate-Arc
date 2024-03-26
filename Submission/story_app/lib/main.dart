import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:story_app/common/url_strategy.dart';
import 'package:story_app/features/authentication/data/auth_repository.dart';
import 'package:story_app/features/authentication/data/data_source/local/auth_local_data_source.dart';
import 'package:story_app/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:story_app/features/authentication/provider/auth_provider.dart';
import 'package:story_app/features/settings/data/data_source/local/settings_local_data_source.dart';
import 'package:story_app/features/settings/provider/settings_provider.dart';
import 'package:story_app/features/story/data/data_source/remote/story_remote_data_source.dart';
import 'package:story_app/features/story/data/story_repository.dart';
import 'package:story_app/features/story/provider/story_provider.dart';
import 'package:story_app/localization/localization.dart';
import 'package:story_app/routes/app_routes.dart';

void main() {
  initializeDateFormatting();
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthProvider authProvider;
  late StoryProvider storyProvider;
  late SettingsProvider settingsProvider;

  @override
  void initState() {
    super.initState();
    final client = Client();
    final authLocalDataSource = AuthLocalDataSource();
    final settingsLocalDataSource = SettingsLocalDataSource();
    final authRepo = AuthRepository(
        remoteDataSource: AuthRemoteDataSource(client),
        localDataSource: authLocalDataSource);
    final storyRepo = StoryRepository(
      authRepository: authRepo,
      remoteDataSource: StoryRemoteDataSource(client),
    );

    authProvider = AuthProvider(repository: authRepo);
    storyProvider = StoryProvider(repository: storyRepo);
    settingsProvider =
        SettingsProvider(localDataSource: settingsLocalDataSource);
  }

  @override
  Widget build(BuildContext context) =>
      Sizer(builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => storyProvider..fetchStories(),
            ),
            ChangeNotifierProvider(
              create: (context) => authProvider,
            ),
            ChangeNotifierProvider(
              create: (context) => settingsProvider
                ..getTheme()
                ..getLocale(),
            ),
          ],
          child: Consumer<SettingsProvider>(
            builder: (context, provider, child) {
              return MaterialApp.router(
                routeInformationProvider:
                    AppRouter.router.routeInformationProvider,
                routeInformationParser: AppRouter.router.routeInformationParser,
                routerDelegate: AppRouter.router.routerDelegate,
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                locale: provider.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                themeMode: provider.themeMode,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.lightGreen),
                  useMaterial3: true,
                ),
                darkTheme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.lightGreen,
                    brightness: Brightness.dark,
                  ),
                  useMaterial3: true,
                ),
              );
            },
          ),
        );
      });
}
