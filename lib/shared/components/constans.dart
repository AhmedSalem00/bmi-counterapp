// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca


import 'package:flutter_app/modules/shop_app/login/shope_login_screen.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/shared_network/local/cache.dart';

void signOut(context){
CacheHelper.removeData(key: 'token',).then((value){
if (value) {
  navigateAndFinish(context, ShopLoginScreen(),);
}
});
}

void printFullText(String text)
{
  final pattern =RegExp('.{1,800}'); //800 is  the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}