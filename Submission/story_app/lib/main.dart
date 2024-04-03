import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:story_app/app.dart';
import 'package:story_app/common/url_strategy.dart';

FutureOr<void> main() async {
  initializeDateFormatting();
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
