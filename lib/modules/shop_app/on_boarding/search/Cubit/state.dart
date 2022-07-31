import 'package:flutter_appp/models/shop_model/search_model.dart';

abstract class ShopSearchStates {}

class ShopSearchInitialStats extends ShopSearchStates {}

class ShopSearchSuccessStats extends ShopSearchStates {
  // final ShopSearchModel SearchModel;
  //
  // ShopSearchSuccessStats(this.SearchModel);
}

class ShopSearchLoadingStats extends ShopSearchStates {}

class ShopSearchErrorStats extends ShopSearchStates {
  final String error;

  ShopSearchErrorStats(this.error);
}
