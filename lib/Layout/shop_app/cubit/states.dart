import 'package:flutter_appp/models/shop_model/Change_Favorite_model.dart';
import 'package:flutter_appp/models/shop_model/logn_model.dart';

abstract class ShopStates {}

class ShopInitialStates extends ShopStates {}

class ShopChangeNavBarStates extends ShopStates {}

class ShopLoadingHomeStates extends ShopStates {}

class ShopSuccessHomeStates extends ShopStates {
  final ShopLoginModel ssshhh;

  ShopSuccessHomeStates(this.ssshhh);
}

class ShopErrorHomeStates extends ShopStates {}

class ShopSuccessCategoriesStates extends ShopStates {}

class ShopErrorCategoriesStates extends ShopStates {}

class ShopSuccessFavoriteStates extends ShopStates {
  final ChangeFavoritesModel model;

  ShopSuccessFavoriteStates(this.model);
}

class ShopChangeFavoriteStates extends ShopStates {}

class ShopErrorFavoriteStates extends ShopStates {}

class ShopLoadingGetFavoriteStates extends ShopStates {}

class ShopSuccessGetFavoriteStates extends ShopStates {}

class ShopErrorGetFavoriteStates extends ShopStates {
  final String error;

  ShopErrorGetFavoriteStates(this.error);
}

class ShopLoadingGetUserDataStates extends ShopStates {}

class ShopSuccessGetUserDataStates extends ShopStates {
  final ShopLoginModel loginModel;

  ShopSuccessGetUserDataStates(this.loginModel);
}

class ShopErrorGetUserDataStates extends ShopStates {}

class ShopLoadingUpdateUserDataStates extends ShopStates {}

class ShopSuccessUpdateUserDataStates extends ShopStates {
  final ShopLoginModel loginModel;

  ShopSuccessUpdateUserDataStates(this.loginModel);
}

class ShopErrorUpdateUserDataStates extends ShopStates {}
