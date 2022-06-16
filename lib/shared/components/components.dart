import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/news_app/web_view/web_view_screen.dart';

import 'package:flutter_app/shared/shared_cubit/cubit.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton({
   double width  = double.infinity,
   Color background = Colors.blue,
   bool isUpperCase = true,
  double radius= 30.0,
  required Function() function,
  required String text,

}) =>  Container(
  width:width,
  height: 40.0,

  child: MaterialButton(
    onPressed: function,
    child:  Text(
     isUpperCase ? text.toUpperCase() : text,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
);

Widget defaultTextButton({
  required Function() Function,
  required String text,
})=>
    TextButton(
onPressed: Function(),
child: Text(text.toUpperCase(),),

);

Widget defaultFormFiled({
  required TextEditingController controller,
  required TextInputType type,
  Function(String?)? onSubmit,
  Function? onChange(String)?,
  Function? onTap()?,
  bool isPassword = false,
  String? Function( String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function?  suffixpressed,
  bool isClickable = true,   //If you want to just click on it
})=> TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  enabled: isClickable,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  onTap: onTap,
  validator: validate,
  decoration:  InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
      suffixIcon: suffix != null ? IconButton(
        onPressed: suffixpressed!(),
        icon: Icon(
          suffix,
          ),
      ) : null,
    border:  OutlineInputBorder(),
  ),
);
  Widget buildTaskItem (Map model , context) => Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CircleAvatar(
                radius: 40.0,
              child: Text(
                 '${model['time']}',
              ),

            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                    color: Colors.grey,
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDate(
                  status: 'done',
                  id: model['id'],
                );
              },
              icon: const Icon(
                Icons.check_circle,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDate(
                    status: 'archive',
                    id: model['id'],
                );
              },
              icon: const Icon(
                Icons.archive,
                color: Colors.green,
              ),
            ),

          ],
        ),
      ),
    ),
    onDismissed: (direction){
       AppCubit.get(context).deleteDate(id: model['id'],);
    },
  );

  Widget tasksBuilder({
  required List <Map> tasks,
}) => ConditionalBuilder(
    condition:tasks.isNotEmpty,
    builder: (context)=> ListView.separated(
      itemBuilder: (context,index) => buildTaskItem(tasks[index], context),
      separatorBuilder: (context,index) =>myDvider(),
      itemCount: tasks.length,
    ),
    fallback: (context)=> Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:   [
          Icon(
            Icons.menu,
            size: 100.0,
            color: Colors.grey,
          ),
          Text('No Tasks Yet Please Add Some Tasks',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight:FontWeight.bold,
            ),
          ),
        ],
      ),
    ),

  );

  Widget myDvider()=> Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 20.0,
    ),
    child: Container(
      height: 1.0,
      color: Colors.grey[300],
    ),
  );

Widget buildArticleItem(article,context) => InkWell(
  onTap: (){
navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0,),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
      ],
    ),
  
  ),
);
Widget articleBuilder(list, context) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDvider(),
        itemCount: 10,),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);
void navigateTo(context, widget) =>Navigator.push(
  //How do I link two pages?
  context,
  MaterialPageRoute(
    builder: (context) => widget,

  ),
);

void navigateAndFinish(
    context,
    widget,
) =>
Navigator.pushAndRemoveUntil(
context,
MaterialPageRoute(
builder:(context) => widget,
),
(route)
{
  return false;
},
);
void showToast({
  required String text,
  required ToastStates state,

})=>
    Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0
);

//enum
enum ToastStates{ERROR,SUCCESS,WARNING}







