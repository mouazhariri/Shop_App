import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/Layout/modechange/Cubit/State.dart';
import 'package:flutter_appp/Layout/modechange/Cubit/dark_light(toggle).dart';

import 'package:flutter_appp/Layout/shop_app/cubit/cubit.dart';
import 'package:flutter_appp/Layout/shop_app/shop_Layout.dart';
import 'modules/shop_app/on_boarding/onboarding/on_boarding_screen.dart';

import 'package:flutter_appp/shared/Network/Local/cache_helper.dart';
import 'package:flutter_appp/shared/Network/remote/dio_helper.dart';
import 'package:flutter_appp/shared/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:flutter_appp/shared/bloc_observer.dart';

import 'modules/shop_app/on_boarding/login/shop_login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');

  String token = CacheHelper.getData(key: 'token');
  print(token);
  if (onBoarding != null) {
    if (token != null)
      widget = ShopLayout();
    else
      widget = ShopLoginScreen();
  } else {
    widget = OnBoardingScreen();
  }

  BlocOverrides.runZoned(
      () => runApp(MyApp(
            isDark: isDark,
            startWidget: widget,
          )),
      blocObserver: MyBlocObserver()); //Bloc ob server
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  MyApp({this.isDark, this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ModeChangeCubit()
            ..appChangeMode(
              fromShared: isDark,
            ),
        ),
        BlocProvider(
            create: (context) => ShopCubit()
              ..getHomeData()
              ..getCategories()
              ..getFavorites()
              ..getUser()),
      ],
      child: BlocConsumer<ModeChangeCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: shopLightTheme,
              darkTheme: shopLightTheme,
              themeMode: ModeChangeCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home:
                  //       Directionality(
                  //
                  //           textDirection: TextDirection.ltr,
                  //           // child: onBoarding ? ShopLoginScreen() :OnBoardingScreen ()),
                  // child:
                  startWidget
              // ),
              );
        },
      ),
    );
  }
}
