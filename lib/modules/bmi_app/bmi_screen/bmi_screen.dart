import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/bmi_app/bmi_result/bmi_result_screen.dart';


class BmiScreen extends StatefulWidget {
 BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen>
{
  bool isMale = true;
  double height = 120.0;
  int weight =70;
  int age = 20;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: const Text(
         'BMI calculator',
       ),
      ),
      body: Column(
        children: [
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },

                      child: Container(
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  const [
                            Image(
                              image:AssetImage('assets/images/male.png'),
                              width: 90.0,
                              height: 90.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isMale ? Colors.blue : Colors.grey[300],
                          ),

                      ),
                    ),
                  ),
                  const SizedBox(
                      width: 20.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },

                      child: Container(
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  const [
                            Image(
                              image:AssetImage('assets/images/female.png'),
                              width: 90.0,
                              height: 90.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale?Colors.grey[300]:Colors.blue,                      ),

                      ),
                    ),
                  ),

                ],
              ),
            ),

          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                     const Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,

                      children:   [
                        Text(
                           '${height.round()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 40.0,
                          ),
                        ),
                        const SizedBox(
                            width: 5.0),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        value: height,
                        max: 220.0,
                        min:  80.0,

                        onChanged:(value) {
                          setState(() {
                            height = value;
                          });
                          print(value);
                        },
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[300],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(

         children: [
           Expanded(
               child: Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,


                   children: [
                     const Text(
                       'WEIGHT',
                       style: TextStyle(
                         fontSize:25.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                      Text(
                       '$weight',
                       style: const TextStyle(
                         fontWeight: FontWeight.w900,
                         fontSize: 40.0,
                       ),
                     ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                              onPressed:(){
                                setState(() {
                                  weight--;
                                });
                              },
                            heroTag: 'weight-',
                            mini: true,
                              child: const Icon(
                                Icons.remove,
                              ),
                              ),
                          FloatingActionButton(
                              onPressed:(){
                                 setState(() {
                                   weight++;
                                 });
                              },
                            heroTag: 'weight+',
                            mini: true,
                            child: const Icon(
                              CupertinoIcons.add,
                            ),
                          )
                        ],
                      ),
                   ],
                 ),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10.0),
                   color: Colors.grey[300],
                 ),
               ),
           ),
           const SizedBox(
               width: 20.0,
           ),
           Expanded(
               child: Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,


                   children: [
                     const Text(
                       'AGE',
                       style: TextStyle(
                         fontSize:25.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                    Text(
                       '$age',
                       style: const TextStyle(
                         fontWeight: FontWeight.w900,
                         fontSize: 40.0,
                       ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         FloatingActionButton(
                           onPressed:(){
                             setState(() {
                               age--;
                             });
                           },
                           heroTag:'age-',
                           mini: true,
                           child: const Icon(
                             Icons.remove,
                           ),
                         ),
                         FloatingActionButton(
                           onPressed:(){
                             setState(() {
                               age++;
                             });
                           },
                           heroTag: 'age+',
                           mini: true,
                           child: const Icon(
                             CupertinoIcons.add,
                           ),
                         )
                       ],
                     ),
                   ],
                 ),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10.0),
                   color: Colors.grey[300],
                 ),
               ),
           ),
         ],
              ),
            ),
          ),
           Container(
                   width: double.infinity,
                   color: Colors.cyan,
                   child: MaterialButton(onPressed: () {
                     double  result = weight / pow(height/100,2);
                     print (result.round());
                     Navigator.push(
                       //How do I link two pages?
                         context,
                         MaterialPageRoute(
                             builder: (context) => BMIResultScreen(
                               age: age,
                               isMale: isMale,
                               result:result.round (),

                             ),

                         ),

                     );
                   },
                     height: 50.0,
            child: const Text(
              'CALCULATOR',
              style: TextStyle(
                  color: Colors.white),
            ),

          ),
                 ),
        ],
      ),
    );




  }
}
