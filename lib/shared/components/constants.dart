// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

//search :https://newsapi.org/
// v2/everything?
// q=tesla&apiKey=0ae97745667048e69851b7ff496bf7d5


import 'package:flutter_appp/modules/shop_app/on_boarding/login/shop_login_screen.dart';
import 'package:flutter_appp/modules/shop_app/on_boarding/login/shop_login_screen.dart';
import 'package:flutter_appp/shared/Network/Local/cache_helper.dart';
import 'package:flutter_appp/shared/components/components.dart';

void logOut(context)
{
  CacheHelper.removeData(key:'token').then((value) {
    if(value){
      navigateToAndFinish(context, ShopLoginScreen());
    }
  });
}

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
String token = '';