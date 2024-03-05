import 'package:declarative_navigation/routes/page_manager.dart';
import 'package:declarative_navigation/routes/router_delegate.dart';
import 'package:declarative_navigation/screen/quote_detail_screen.dart';
import 'package:declarative_navigation/screen/quotes_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/quote.dart';

void main() {
  runApp(const QuotesApp());
}

class QuotesApp extends StatefulWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  late MyRouterDelegate myRouterDelegate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myRouterDelegate = MyRouterDelegate();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageManager(),
      child: MaterialApp(
          title: 'Quotes App',
          home: Router(
            routerDelegate: myRouterDelegate,
            backButtonDispatcher: RootBackButtonDispatcher(),
          )
      ),
    );
  }
}
