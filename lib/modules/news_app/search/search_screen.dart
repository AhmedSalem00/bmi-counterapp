import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_app/cubit/cubit.dart';
import 'package:flutter_app/layout/news_app/cubit/states.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
 var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context,  state) {  },
      builder: (BuildContext context, state)
      {
        var list =NewsCubit.get(context).search;

        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormFiled(
                  controller: searchController,
                  type:TextInputType.text,
                  onChange: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String? value)
                  {
                    if(value!.isEmpty)
                    {
                      return ' search must not be empty';
                    }
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(child: buildArticleItem(list, context)),

            ],
          ),
        );
      },

    );
  }
}
