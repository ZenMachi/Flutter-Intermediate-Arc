import 'package:flutter/material.dart';
import '../model/quote.dart';

import '../model/loading_state.dart';
import '../service/asset_service.dart';

class ApiProvider extends ChangeNotifier {
  final AssetService assetService;

  ApiProvider(this.assetService);

  LoadingState quotesState = const LoadingState.initial();
  String quotesMessage = "";

  List<Quote> quotes = [];

  Future<void> getQuotes() async {
    try {
      quotesState = const LoadingState.loading();
      notifyListeners();

      final result = await assetService.getQuotes();

      quotesState = LoadingState.loaded(result.list);

      notifyListeners();
    } catch (e) {
      quotesState = const LoadingState.error("Get quote failed");
      notifyListeners();
    }
  }
}
