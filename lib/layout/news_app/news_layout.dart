import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_app/cubit/cubit.dart';
import 'package:flutter_app/layout/news_app/cubit/states.dart';
import 'package:flutter_app/modules/news_app/search/search_screen.dart';

import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/shared_cubit/cubit.dart';
import 'package:flutter_app/shared/shared_network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NewsCubit,NewsStates>(
     listener: (context , state) {} ,
      builder: (context , state){
       var cubit =NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
                'New App'
            ),
            actions: [
              IconButton(
                icon:Icon(
                    Icons.search
                ),
                onPressed: (){
                  navigateTo(context, SearchScreen(),);
                },
              ),
              IconButton(
                icon:Icon(Icons.brightness_4_outlined),
                onPressed: (){
                  AppCubit.get(context).changeAppMode();
                },
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.ChangeBottomNavBar(index);
              },
              items: cubit.bottomItems),

        );
      },
    );
  }
}
