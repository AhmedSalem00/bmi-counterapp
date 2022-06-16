import 'package:flutter_app/modles/shop_app/login_model.dart';

abstract class ShopLoginStates{}

class ShopLoginInitialState extends ShopLoginStates{}

class ShopLoginLoadingState extends ShopLoginStates{}

class ShopLoginSuccessState extends ShopLoginStates{
   late ShopLoginModel loginModel;
   ShopLoginSuccessState(this.loginModel);

}

class ShopLoginErrorState extends ShopLoginStates{

  // عشان اظهر الايرور علي الاسكرينه بعمل خطوه دي
  final String error;
  ShopLoginErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends ShopLoginStates{}


