import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../models/shop_model/logn_model.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/login/cubit/states.dart';
import 'package:flutter_appp/shared/Network/end_points/end_points.dart';
import 'package:flutter_appp/shared/Network/remote/dio_helper.dart';
import 'package:flutter_appp/shared/Network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialStats());
  ShopLoginModel loginModel;
  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(ShopLoginLoadingStats());

    DioHelper.postData(url: login, data: {
      'email': email,
      'password': password,
    })
        .then((value) => {
              loginModel = ShopLoginModel.fromJson(value.data),
              emit(ShopLoginSuccessStats(loginModel))
            })
        .catchError((error) => {
              print(error.toString()),
              emit(ShopLoginErrorStats(error)),
            });
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;
  void changeVisibilityPassword() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ShopLoginPasswordStats());
  }
}
