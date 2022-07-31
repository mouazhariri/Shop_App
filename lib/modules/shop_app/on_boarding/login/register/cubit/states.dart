import 'package:flutter_appp/models/shop_model/logn_model.dart';

abstract class ShopRegisterStates {}

class ShopRegisterInitialStats extends ShopRegisterStates {}

class ShopRegisterSuccessStats extends ShopRegisterStates {
  final ShopLoginModel loginModel;

  ShopRegisterSuccessStats(this.loginModel);
}

class ShopRegisterLoadingStats extends ShopRegisterStates {}

class ShopRegisterErrorStats extends ShopRegisterStates {
  final String error;

  ShopRegisterErrorStats(this.error);
}

class ShopRegisterPasswordStats extends ShopRegisterStates {}
