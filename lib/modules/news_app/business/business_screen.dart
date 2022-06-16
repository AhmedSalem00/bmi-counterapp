import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_app/cubit/cubit.dart';
import 'package:flutter_app/layout/news_app/cubit/states.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var  list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: list.length >0,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index) => buildArticleItem(list[index],context),
            separatorBuilder: (context,index) => myDvider(),
            itemCount:list.length,
          ),
          fallback:(context) => Center(child: CircularProgressIndicator()),

        );
      },
    );
  }
}

