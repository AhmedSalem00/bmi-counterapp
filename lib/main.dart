import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/layout/news_app/cubit/cubit.dart';
import 'package:flutter_app/layout/news_app/news_layout.dart';
import 'package:flutter_app/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_app/layout/todo_app/todo_layout.dart';
import 'package:flutter_app/modules/shop_app/login/shope_login_screen.dart';
import 'package:flutter_app/modules/shop_app/on_boarding_screen/on_boarding_screen.dart';
import 'package:flutter_app/shared/shared_cubit/cubit.dart';
import 'package:flutter_app/shared/shared_cubit/states.dart';
import 'package:flutter_app/shared/shared_network/local/cache.dart';
import 'package:flutter_app/shared/shared_network/remote/dio_helper.dart';
import 'package:flutter_app/styles/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/shop_app/shop_layout/shop_layout.dart';
import 'shared/bloc_observer.dart';
import 'package:dio/dio.dart';

void main() async
{
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
    var token = CacheHelper.getData(key: 'token');

  if(onBoarding != null)
  {
    if (token != null) widget = ShopLayout();
    else  widget = ShopLoginScreen();

  }else
    {
      widget = OnBoardingScreen();
    }
  runApp( MyApp(
    isDark: isDark,
    startWidget: widget,

  ));
   }
class MyApp extends StatelessWidget
{
  final bool? isDark;
  final Widget startWidget;

  MyApp({
    this.isDark,
     required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()
          ..getBusiness()
          ..getScience()
          ..getScience()),
        BlocProvider(
          create: (context) => AppCubit()..changeAppMode(
    fromShared: isDark,
    ),),
        BlocProvider(
          create: (BuildContext context) => ShopCubit()..getHomeData(),
        ),
        ],
      child: BlocConsumer< AppCubit , AppStates>(
       listener: (context,state){},
        builder: (context,state){
         return  MaterialApp(
           debugShowCheckedModeBanner: false ,
           theme: lightTheme,
           darkTheme:darkTheme,
           themeMode: AppCubit.get(context).isDark ? ThemeMode.dark :ThemeMode.light,
           home:ShopLayout(),

         );
        },


      ),
    );
  }
}

