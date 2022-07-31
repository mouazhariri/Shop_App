import 'package:flutter_appp/Layout/shop_app/cubit/states.dart';
import 'package:flutter_appp/models/shop_model/search_model.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/search/Cubit/state.dart';
import 'package:flutter_appp/shared/Network/end_points/end_points.dart';
import 'package:flutter_appp/shared/Network/remote/dio_helper.dart';
import 'package:flutter_appp/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<ShopSearchStates> {
  SearchCubit() : super(ShopSearchInitialStats());
  static SearchCubit get(context) => BlocProvider.of(context);

  ShopSearchModel model;

  void search(String text) {
    emit(ShopSearchLoadingStats());
    DioHelper.postData(url: Search, token: token, data: {'text': text})
        .then((value) {
      model = ShopSearchModel.fromJson(value.data);
      emit(ShopSearchSuccessStats());
    }).catchError((error) {
      print(error.toString());
      emit(ShopSearchErrorStats(error));
    });
  }
}
