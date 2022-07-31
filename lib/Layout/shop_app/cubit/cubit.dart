import 'package:flutter/material.dart';
import 'package:flutter_appp/Layout/shop_app/cubit/states.dart';
import 'package:flutter_appp/models/shop_model/Categories_model.dart';
import 'package:flutter_appp/models/shop_model/Change_Favorite_model.dart';
import 'package:flutter_appp/models/shop_model/favorites_model.dart';

import 'package:flutter_appp/models/shop_model/home_model.dart';
import 'package:flutter_appp/models/shop_model/logn_model.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/Product/Product_Screen.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/categories/Categories_Screen.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/favorite/Favorite_Screen.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/settings/Settings_Screen.dart';
import 'package:flutter_appp/shared/Network/end_points/end_points.dart';
import 'package:flutter_appp/shared/Network/remote/dio_helper.dart';
import 'package:flutter_appp/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class ShopCubit extends Cubit<ShopStates> {
//   ShopCubit() : super(ShopInitialStates());
//
//   static ShopCubit get(context) => BlocProvider.of(context);
//
//   int currentIndex = 0;
//
//   List<Widget> bottomScreens = [
//     ProductsScreen(),
//     CategoriesScreen(),
//     FavoriteScreen(),
//     SettingsScreen(),
//   ];
//
//   void changeBottom(int index) {
//     currentIndex = index;
//     emit(ShopChangeNavBarStates());
//   }
//
//   HomeModel homeModel;
//   Map<int,bool>favorite={};
//   void getHomeData()
//   {
//     emit(ShopLoadingHomeStates());
// //we need token for to find out the products in favorite or cart
//     DioHelper.getData(
//       url: Home,
//       token: token,
//     ).then((value)
//     {
//       homeModel = HomeModel.fromJson(value.data);
//
//       printFullText(homeModel.data.banners[0].image);
//       print(homeModel.status);
//       //The forEach loop can be used with any type of collection. This loop iterates over each element of the collection and applies the function for each item.
//       homeModel.data.products.forEach((element) {
//         favorite.addAll({
//           element.id:element.inFavorites
//         });
//         print(favorite);
//       });
//       emit(ShopSuccessHomeStates());
//     }).catchError((error)
//     {
//       print(error.toString());
//       emit(ShopErrorHomeStates(error));
//     });
//   }
//
//   CategoriesModel categoriesModel;
//
//   void getCategories()
//   {
//
// //we need token for to find out the products in favorite or cart
//     DioHelper.getData(
//       url: GetCategories,
//       token: token,
//     ).then((value)
//     {
//       categoriesModel = CategoriesModel.fromJson(value.data);
//
//
//       emit(ShopSuccessCategoriesStates());
//     }).catchError((error)
//     {
//       print(error.toString());
//       emit(ShopErrorCategoriesStates(error));
//     });
//   }
//
//
//
//   ChangeFavoriteModel changeFavoriteModel;
// void changeFavorite(int productId){
//   favorite[productId]=!favorite[productId];
//   emit(ShopChangeFavoriteStates());
//     DioHelper.postData(
//         url: FAVORITES,
//         data: {
//           'product_id':productId
//
//         },
//       token:token,
//         ).then((value) {
//       changeFavoriteModel=ChangeFavoriteModel.fromJson(value.data);
//       print(value.data);
//       //mean if status false toggle else get one more time favorite
//       if(!changeFavoriteModel.status){
//         favorite[productId]=!favorite[productId];
//
//       }else{
//         getFavorite();
//       }
//
//       emit(ShopSuccessFavoriteStates(changeFavoriteModel));
//
//     }).catchError((error){
//       favorite[productId]=!favorite[productId];
// emit(ShopErrorFavoriteStates(error));
//     });
// }
//
//   FavoritesModel favoriteModel;
//   void getFavorite()
//   {
// emit(ShopLoadingGetFavoriteStates());
// //we need token for to find out the products in favorite or cart
//     DioHelper.getData(
//       url: FAVORITES,
//       token: token,
//     ).then((value)
//     {
//       favoriteModel = FavoritesModel.fromJson(value.data);
//
//
//       emit(ShopSuccessGetFavoriteStates());
//     }).catchError((error)
//     {
//       printFullText(error.toString());
//       emit(ShopErrorGetFavoriteStates(error));
//     });
//   }
// }
///////////////////////////////
class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialStates());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeNavBarStates());
  }

  HomeModel homeModel;
  ShopLoginModel ssshhh;
  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeStates());

    DioHelper.getData(
      url: Home,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      //print(homeModel.data.banners[0].image);
      //print(homeModel.status);
      //
      homeModel.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });

      print(favorites.toString());

      emit(ShopSuccessHomeStates(ssshhh));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeStates());
    });
  }

  CategoriesModel categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: GetCategories,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesStates());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesStates());
    });
  }

  FavoritesModel favoritesModel;

  void getFavorites() {
    emit(ShopLoadingGetFavoriteStates());

    DioHelper.getData(url: FAVORITES, token: token).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      // printFullText(value.data.toString());

      emit(ShopSuccessGetFavoriteStates());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoriteStates(error));
    });
  }

  ChangeFavoritesModel changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId];

    emit(ShopChangeFavoriteStates());

    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      //     print(value.data);

      if (!changeFavoritesModel.status) {
        favorites[productId] = !favorites[productId];
      } else {
        getFavorites();
      }

      emit(ShopSuccessFavoriteStates(changeFavoritesModel));
    }).catchError((error) {
      favorites[productId] = !favorites[productId];

      emit(ShopErrorFavoriteStates());
    });
  }

  ShopLoginModel userModel;

  void getUser() {
    emit(ShopLoadingGetUserDataStates());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      printFullText(userModel.data.name);

      emit(ShopSuccessGetUserDataStates(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetUserDataStates());
    });
  }

  void updateUser({
    @required String email,
    @required String name,
    @required String phone,
  }) {
    emit(ShopLoadingUpdateUserDataStates());

    DioHelper.putData(url: Update_profile, token: token, data: {
      'name': name,
      'email': email,
      'phone': phone,
    }).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      printFullText(userModel.data.name);

      emit(ShopSuccessUpdateUserDataStates(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserDataStates());
    });
  }
}

// void updateUserData({
//   @required String name,
//   @required String email,
//   @required String phone,
// }) {
//   emit(ShopLoadingUpdateUserState());
//
//   DioHelper.putData(
//     url: UPDATE_PROFILE,
//     token: token,
//     data: {
//       'name': name,
//       'email': email,
//       'phone': phone,
//     },
//   ).then((value) {
//     userModel = ShopLoginModel.fromJson(value.data);
//     printFullText(userModel.data.name);
//
//     emit(ShopSuccessUpdateUserState(userModel));
//   }).catchError((error) {
//     print(error.toString());
//     emit(ShopErrorUpdateUserState());
//   });
// }
// }
