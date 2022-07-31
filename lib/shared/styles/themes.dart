import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appp/shared/styles/colors.dart';
//news app
ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.grey.shade900,
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(

      statusBarColor: Colors.grey.shade900,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.grey.shade900,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey.shade900,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        color: Colors.white
    ),

  ),

);
ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(

      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle
      (
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
    ),
  ),

);

//shop app
ThemeData shopDarkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: Colors.grey.shade900,
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(

      statusBarColor: Colors.grey.shade900,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.grey.shade900,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey.shade900,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        color: Colors.white
    ),

  ),

);
ThemeData shopLightTheme = ThemeData(
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(

      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle
      (
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor:defaultColor,
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
    ),
  ),

);

