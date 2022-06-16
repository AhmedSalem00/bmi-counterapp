import 'package:flutter/material.dart';
import 'package:flutter_app/modules/shop_app/login/shope_login_screen.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/shared_network/local/cache.dart';
import 'package:flutter_app/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class BoardingModel{
  final String image;
  final String title;
  final String body;

  BoardingModel({
  required this.title,
  required this.image,
  required this.body,
  });

}

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding =[
    BoardingModel(
  image:'assets/images/onboard_1.jpg' ,
  title: 'On Board 1 Title' ,
  body: 'On Board 1 Body',
        ),
    BoardingModel(
      image:'assets/images/onboard_1.jpg' ,
      title: 'On Board 2 Title' ,
      body: 'On Board 2 Body',
    ),
    BoardingModel(
      image:'assets/images/onboard_2.jpg' ,
      title: 'On Board 3 Title' ,
      body: 'On Board 3 Body',
    ),

  ];
  bool isLast =false;
  void submit()
  {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if(value)
        {
          navigateAndFinish(context, ShopLoginScreen());
        }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
              text: 'Skip',
            Function: submit,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(child: PageView.builder(
              controller: boardController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (int index)
              {
                if(index == boarding.length -1)
                  {
                    setState(() {
                      isLast = true;
                    });
                  }
                else
              {
                setState(() {
                isLast = false;
                });
                }
                },
              itemBuilder: (context,index)=> buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
            )
            ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                 SmoothPageIndicator(
                   controller: boardController,
                   count: boarding.length,
                   effect: ExpandingDotsEffect(
                     dotColor: Colors.grey,
                     activeDotColor: defaultColor,
                     expansionFactor: 3,
                     dotWidth: 10,
                     dotHeight: 10,
                     spacing: 5.0,
                   ),
                 ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed:(){
                      if (isLast)
                        {
                        submit();
                        } else
                          {
                            boardController.nextPage(
                              duration: Duration(milliseconds: 750,
                              ),
                              curve: Curves.decelerate,
                            );
                          }
                    },
               child: Icon(Icons.arrow_forward_ios),
              ),

                ],
              ),


          ],
        ),
      ),


    );
  }

  Widget buildBoardingItem(BoardingModel model )=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),

      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),

    ],
  );
}
