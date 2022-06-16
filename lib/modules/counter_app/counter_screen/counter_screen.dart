import 'package:flutter/material.dart';
import 'package:flutter_app/modules/counter_app/counter_screen/counter_cubit/cubit.dart';
import 'package:flutter_app/modules/counter_app/counter_screen/counter_cubit/states.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
// state less contain one class provide widget
//state full contain classes

// 1) first class provide widget
// 2) second class provide state from this widget

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (  BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
      listener:( BuildContext context ,  CounterStates state){
        if (state is CounterMinusState) print('Minus state ${state.counter}');
        if (state is CounterPlusState) print('Plus state ${state.counter}');

      },
        builder: (BuildContext context, CounterStates state ){
        return  Scaffold(
          appBar: AppBar(
          title: const Text(
          'counter',
          ),

          ),
          body: Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextButton(
          onPressed: () {
            CounterCubit.get(context).minus();
          },
          child: const Text(
          'MINUS',
          ),
          ),
          Padding(
          padding: const EdgeInsets.symmetric(
          horizontal: 50.0,
          ),
          child: Text(
          '${CounterCubit.get(context).counter}',
          style: const TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.w900,
          ),
          ),
          ),
          TextButton(
          onPressed: () {
            CounterCubit.get(context).plus();

          },
          child: const Text(
          'POUNS',
          ),),

          ],
          ),
          ),

          );

        },
      ),
    );
  }



// 1)constructor
// 2) init state
// 3) build

}