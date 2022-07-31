import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/shared/Network/Local/cache_helper.dart';
import '../login/shop_login_screen.dart';
import 'package:flutter_appp/shared/components/components.dart';
import 'package:flutter_appp/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//to create list

class BoardingModel
{
  final String image;
  final String title;
  final String body ;

  BoardingModel({
      @required this.image,
      @required this.title,
      @required this.body});


}


class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController =PageController();

  List <BoardingModel> boarding=[
    BoardingModel(
      image: 'assets/images/shop4.jpg',
      title: 'Roaming inside application',
      body: 'see all our products online',
    ),
    BoardingModel(
      image: 'assets/images/shop1.jpg',
      title: 'Roaming inside application',
      body: 'see all our products online',
    ),
    BoardingModel(
      image: 'assets/images/shop5.jpg',
      title: 'Roaming inside application',
      body: 'see all our products online',
    ),
    BoardingModel(
      image: 'assets/images/shop2.jpg',
      title: 'Roaming inside application',
      body: 'see all our products online',
    ),
  ];

  bool isLast=false;
  void submit(){
    CacheHelper.saveData(key: 'onBoarding',
        value: true,
    ).then((value)
    {
        if(value){
      navigateToAndFinish(context, ShopLoginScreen());
    }}
    );


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed:submit,
            child: Text('SKIP',style: TextStyle(
              // color: defaultColor,
          ),),),
        ],
      ),
      body:
       Padding(
         padding: const EdgeInsets.all(30.0),
         child: Column(
           children: [
             Expanded(

               child: PageView.builder(
                 controller: boardController,
                 onPageChanged: (int index){
                   if (index == boarding.length-1)
                   {
                     setState(() {
                       isLast=true;
                     });

                   }else{
                     setState(() {
                       isLast=false;
                     });
                   }
                 },
                 physics: BouncingScrollPhysics(),
                 itemBuilder: (context,index)=>buildBoardingItem(boarding[index]),
                 itemCount: boarding.length,
               ),
             ),
             SizedBox(
               height: 30.0,
             ),
             Row(
               children: [
                 SmoothPageIndicator(
                     controller: boardController,
                     effect: ExpandingDotsEffect(
                       activeDotColor:Colors.indigoAccent  ,
                       dotColor:Colors.grey ,
                       dotHeight: 10,
                       expansionFactor: 4.0,
                       dotWidth: 10.0,
                       spacing: 5.0,
                     ),
                     count: boarding.length),
                 Spacer(),
                 FloatingActionButton(onPressed: (){
                   if(isLast){
                     submit();
                   }else{
                     boardController.nextPage(duration: Duration(milliseconds: 750),

                         curve: Curves.linear);
                   }

                 },child: Icon(Icons.arrow_forward_ios),
                 backgroundColor: Colors.indigoAccent,),

               ],
             ),
           ],

         ),
       ),



    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image(
            image:AssetImage ('${model.image}'),
          ),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text('${model.title}',style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),),
      SizedBox(
        height: 30.0,
      ),
      Text('${model.body}')

    ],
  );
}













