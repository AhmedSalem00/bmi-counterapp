import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/categoris/categories_screen.dart';
import 'package:flutter_app/layout/shop_app/cubit/states.dart';
import 'package:flutter_app/layout/shop_app/favourite/favourite_screen.dart';
import 'package:flutter_app/layout/shop_app/home_model.dart';
import 'package:flutter_app/layout/shop_app/products/products_screen.dart';
import 'package:flutter_app/layout/shop_app/settings/settings_screen.dart';
import 'package:flutter_app/modules/news_app/web_view/web_view_screen.dart';
import 'package:flutter_app/shared/components/constans.dart';
import 'package:flutter_app/shared/shared_network/end_points.dart';
import 'package:flutter_app/shared/shared_network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopStates> {
   ShopCubit() : super(ShopInitialState());



  static ShopCubit get(context) =>BlocProvider.of(context);

  int currentIndex =0;
  List<Widget> bottomScreens =
  [

   ProductsScreen(),
  CategoriesScreen(),
  FavouriteScreen(),
  SettingsScreen(),
  ];
  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }
 late HomeModel homeModel;
  void getHomeData()
  {
    emit(ShopLoadingHomeDataState(),);
    DioHelper.getData(url: HOME,).then((value){

      homeModel =HomeModel.fromJson(value.data);
      printFullText(homeModel.toString(),);
emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }
}
