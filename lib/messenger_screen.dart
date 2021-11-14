import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
class MessengerScreen extends StatelessWidget {
  const MessengerScreen ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 20.0,
        elevation:0.0,

        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1455982079565565967/d3WfIo-F_400x400.jpg'),

              ),
          SizedBox(
            width: 15.0,
          ),

          Text(
            'Chats',
            style: TextStyle(
              color:Colors.black,
            ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 16.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Container(
              decoration:BoxDecoration(
               borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[300],
              ),
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children:
                const [
                 Icon(
                   Icons.search,
                 ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'Search',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 100.0,
              child: ListView.separated(
                shrinkWrap: true,
               scrollDirection:Axis.horizontal ,
                  itemBuilder: (context , index) => buildStoryItem(),
                   separatorBuilder: (context , index) => const SizedBox(
                       width: 20.0,
                     ),

                     itemCount: 5,

    ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ListView.separated (
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                itemBuilder: ( Context , index) => buildChatItem (),
                separatorBuilder:( Context , index) => const SizedBox(
                  height: 20.0,
                ),
                 itemCount: 15,
            ),



       ],
        ),
      ),
      ),
    );
  }

  //1) build items
  //2)build list
  //3)add items to list
   Widget buildChatItem () => Row(

    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: const [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1455982079565565967/d3WfIo-F_400x400.jpg'),

          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      const SizedBox(
        width: 30.0,
      ),
      Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              const Text(
                'Ahmed Salem',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children:  [
                  const Expanded(
                    child: Text(
                      'Hello Ahmed Salem How to learning flutter?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),

                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width: 5.0,
                      height: 5.0,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const Text(
                    '7:00 pm',
                  ),
                ],
              ),
            ]
        ),
      ),
    ],
  );
   Widget buildStoryItem () => Container(
    child: SizedBox(
      width: 60.0,
      child: Column(
        children:
        [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1455982079565565967/d3WfIo-F_400x400.jpg'),

              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Text(
              "Ahmed Salem"
          ),

        ],
      ),
    ),
  );

}
