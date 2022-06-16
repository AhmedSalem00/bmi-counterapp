import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_app/layout/shop_app/cubit/states.dart';
import 'package:flutter_app/layout/shop_app/search/search_screen.dart';
import 'package:flutter_app/modules/shop_app/login/shope_login_screen.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/shared_network/local/cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener:(BuildContext context, state){} ,
      builder: (BuildContext context, state){
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Salla',
            ),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, SearchScreen(),);
              },
                  icon: Icon(Icons.search,),
              )],

          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex, //عشان يتعلم عليهم وانا بحددهم
            items: [
              BottomNavigationBarItem(
              icon: Icon(
              Icons.home,
          ),
                label: 'Home',

              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                ),
                label: 'Categories',

              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'Favorite',

              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',

              ),
          ],

          ),
        );
      },

    );
  }
}
