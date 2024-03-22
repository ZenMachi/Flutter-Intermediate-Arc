import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:story_app/common/url_strategy.dart';
import 'package:story_app/features/authentication/data/local/auth_local_data_source.dart';
import 'package:story_app/features/authentication/data/remote/auth_remote_data_source.dart';
import 'package:story_app/features/authentication/provider/auth_provider.dart';
import 'package:story_app/features/settings/data/local/settings_local_data_source.dart';
import 'package:story_app/features/settings/provider/settings_provider.dart';
import 'package:story_app/features/story/data/remote/story_remote_data_source.dart';
import 'package:story_app/features/story/provider/story_provider.dart';
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

    authProvider = AuthProvider(
      apiService: AuthRemoteDataSource(client),
      localDataSource: authLocalDataSource,
    );
    storyProvider = StoryProvider(
      apiService: StoryRemoteDataSource(
        client,
        authLocalDataSource,
      ),
    );
    settingsProvider = SettingsProvider(
      localDataSource: settingsLocalDataSource,
    );
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
              create: (context) => settingsProvider..getTheme(),
            ),
          ],
          child: Consumer<SettingsProvider>(
            builder: (context, provider, child) {
              return MaterialApp.router(
                routeInformationProvider: AppRouter.router.routeInformationProvider,
                routeInformationParser: AppRouter.router.routeInformationParser,
                routerDelegate: AppRouter.router.routerDelegate,
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                themeMode: provider.themeMode,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
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
            }
          ),
        );
      });
}
