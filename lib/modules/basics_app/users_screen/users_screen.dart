import 'package:flutter/material.dart';
import 'package:flutter_app/modles/users/users_model.dart';

class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
        id: 1,
        name:'Ahmed Salem',
        phone: '+201024769711',),
    UserModel(
      id: 2,
      name:'Ahmed Salem',
      phone: '+20102689711',),
    UserModel(
      id: 3,
      name:'Ahmed Samy',
      phone: '+201024769711',),
    UserModel(
      id: 1,
      name:'Ahmed Salem',
      phone: '+201024769711',),
    UserModel(
      id: 2,
      name:'Ahmed Salem',
      phone: '+20102689711',),
    UserModel(
      id: 3,
      name:'Ahmed Sam',
      phone: '+201024769711',),






  ];

  UsersScreen ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Users',
      ),
    ),
      body: ListView.separated(
          itemBuilder:(context,index)=>buildUserItem(users[index]),
          separatorBuilder: (context,index)=> Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
         itemCount: users.length
      ),
    );
  }
  //1-build items
  //2-build list
  //3-add items to list

   Widget buildUserItem(UserModel user) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children:  [
    CircleAvatar(
  radius: 25.0,
  child: Text(
    '${user.id}',
  style:   const TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  ),
  ),

  ),
  const SizedBox(
  width: 20.0,
  ),
  Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisSize: MainAxisSize.min,

  children:  [
  Text(
  '${user.name}',
  style: const TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  ),
  ),
       Text(
    '${user.phone}',
    style: const TextStyle(
   color: Colors.cyan
  ),
  ),
  ],
  ),
  ),

  ],
  ),
  );
}
