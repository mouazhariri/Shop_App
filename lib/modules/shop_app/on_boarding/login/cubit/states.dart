import 'package:flutter_appp/models/shop_model/logn_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialStats extends ShopLoginStates {}

class ShopLoginSuccessStats extends ShopLoginStates {
  final ShopLoginModel loginModel;

  ShopLoginSuccessStats(this.loginModel);
}

class ShopLoginLoadingStats extends ShopLoginStates {}

class ShopLoginErrorStats extends ShopLoginStates {
  final String error;

  ShopLoginErrorStats(this.error);
}

class ShopLoginPasswordStats extends ShopLoginStates {}
