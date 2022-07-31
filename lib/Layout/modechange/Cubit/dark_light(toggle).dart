import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/Layout/modechange/Cubit/State.dart';

import 'package:flutter_appp/shared/Network/Local/cache_helper.dart';
import 'package:flutter_appp/shared/Network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModeChangeCubit extends Cubit<NewsState> {
  ModeChangeCubit() : super(NewsInitialState());

  static ModeChangeCubit get(context) => BlocProvider.of(context);
  bool isDark = false;

  void appChangeMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsGetModeState());
    } else {
      isDark = !isDark;

      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsGetModeState());
      });
    }
  }
}
