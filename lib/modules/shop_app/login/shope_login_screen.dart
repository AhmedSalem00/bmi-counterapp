import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/shop_layout/shop_layout.dart';
import 'package:flutter_app/modules/shop_app/login/cubit/cubit.dart';
import 'package:flutter_app/modules/shop_app/login/cubit/states.dart';
import 'package:flutter_app/modules/shop_app/register/shop_register_screen.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/shared_network/local/cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopLoginScreen extends StatelessWidget {
  var formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context)=> ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context,state){
          if(state is ShopLoginSuccessState)
            {
              if(state.loginModel.status)
            {
            print(state.loginModel.message);
            print(state.loginModel.data.token);
            CacheHelper.saveData(key: 'token', value: state.loginModel.data.token).then((value){
              navigateAndFinish(context, ShopLayout);
            });


            }else
              {
                print(state.loginModel.message);

                showToast(
                  text: state.loginModel.message,
                  state:ToastStates.ERROR ,
                );
                }
            }
        },
        builder: (context,state){
          return Scaffold(
            appBar : AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              ' LOGIN',
                              style: Theme.of(context).textTheme.headline4!.copyWith(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              ' Login now and enjoy the offers',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          defaultFormFiled(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: ( String? value){
                              if (value!.isEmpty )

                              {
                                return 'Email must be not be empty';
                              }
                            },
                            label: 'Email Address',
                            prefix: Icons.email_outlined,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultFormFiled(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            suffix: ShopLoginCubit.get(context).suffix,
                            onSubmit: (value) // لو عاوز اعمل submit ع password من غير ما اضغط ع login
                            {
                              if(formKey.currentState!.validate())
                              {
                                ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            isPassword: ShopLoginCubit.get(context).isPassword,
                            suffixpressed: ()
                            {
                              ShopLoginCubit.get(context).changePasswordVisibility();
                            },
                            validate: ( String? value){
                              if (value!.isEmpty )
                              {
                                return 'Password must be not be empty';
                              }
                            },
                            label: 'password',
                            prefix: Icons.lock_outline,

                          ),
                          SizedBox(
                            height: 30.0,
                          ),

                          ConditionalBuilder(
                            condition: state is ! ShopLoginLoadingState,
                            builder:(context) =>defaultButton(
                              function: (){
                                if(formKey.currentState!.validate())
                                  {
                                    ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                              },
                              text: 'Login',
                              isUpperCase: true,
                            ),
                            fallback: (context) => Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Don\'t have an account?'
                              ),
                              TextButton(
                                onPressed: ()
                                {
                                  navigateTo(context, ShopRegisterScreen);
                                },
                                child: Text('register now'),
                                style: TextButton.styleFrom(
                                  textStyle:  TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ]
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),


    );
  }
}
