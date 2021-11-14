import 'package:flutter/material.dart';
import 'package:flutter_app/login_screen.dart';
import 'package:flutter_app/messenger_screen.dart';
import 'package:flutter_app/users_screen.dart';
import 'home_screen.dart';
void main()
{
  runApp(const MyApp());
   }
class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false ,
      home:UsersScreen(),

    );
  }
}

