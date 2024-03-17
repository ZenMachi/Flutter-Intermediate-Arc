import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:story_app/common/url_strategy.dart';
import 'package:story_app/features/authentication/ui/login_page.dart';
import 'package:story_app/features/authentication/ui/register_page.dart';
import 'package:story_app/features/story/data/remote/remote_data_source.dart';
import 'package:story_app/features/story/provider/api_provider.dart';
import 'package:story_app/home_page.dart';
import 'package:story_app/routes/app_routes.dart';

void main() {
  initializeDateFormatting();
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) =>
      Sizer(builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) =>
                  ApiProvider(apiService: RemoteDataSource(Client()))..fetchStories(),
            ),
          ],
          child: MaterialApp.router(
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
              useMaterial3: true,
            ),
          ),
        );
      });
}
