import 'package:declarative_navigation/model/quote.dart';
import 'package:declarative_navigation/screen/quote_detail_screen.dart';
import 'package:declarative_navigation/screen/quotes_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  MyRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  String? selectedQuote;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: QuotesListScreen(
            key: const ValueKey("QuotesListScreen"),
            quotes: quotes,
            onTapped: (String quoteId) {
              selectedQuote = quoteId;
              notifyListeners();
            },
          ),
        ),
        if (selectedQuote != null)
          MaterialPage(
            key: ValueKey("QuoteDetailPage-$selectedQuote"),
            child: QuoteDetailsScreen(
              quoteId: selectedQuote!,
            ),
          ),
      ],
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        selectedQuote = null;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
