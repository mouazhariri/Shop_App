import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/models/shop_model/logn_model.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/login/register/cubit/states.dart';

import 'package:flutter_appp/shared/Network/end_points/end_points.dart';
import 'package:flutter_appp/shared/Network/remote/dio_helper.dart';
import 'package:flutter_appp/shared/Network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
//   ShopRegisterCubit() : super(ShopRegisterInitialStats());
//   static ShopRegisterCubit get(context) => BlocProvider.of(context);
//   ShopLoginModel loginModel;
//   void userRegister({
//     @required String name,
//     @required String email,
//     @required String password,
//     @required String phone,
//   }) {
//     emit(ShopRegisterLoadingStats());
//
//     DioHelper.postData(url: REGISTER, data: {
//       'name': name,
//       'email': email,
//       'password': password,
//       'phone': phone,
//     })
//         .then((value) => {
//               print(value.data),
//               loginModel = ShopLoginModel.fromJson(value.data),
//               emit(ShopRegisterSuccessStats(loginModel))
//             })
//         .catchError((error) => {
//               print(error.toString()),
//               emit(ShopRegisterErrorStats(error)),
//             });
//   }
//
//   IconData suffix = Icons.visibility;
//   bool isPassword = true;
//
//   void changeVisibilityPassword() {
//     isPassword = !isPassword;
//     suffix = isPassword ? Icons.visibility : Icons.visibility_off;
//     emit(ShopRegisterPasswordStats());
//   }
// }
class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialStats());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  ShopLoginModel loginModel;

  void userRegister({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
  }) {
    emit(ShopRegisterLoadingStats());

    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      // print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessStats(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopRegisterErrorStats(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShopRegisterPasswordStats());
  }
}
