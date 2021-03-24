import 'package:careergati/activity/quiz_page.dart';
import 'package:careergati/modal/question.dart';
import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/AppString.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PastTest extends StatefulWidget {
  @override
  _PastTestState createState() => _PastTestState();
}

class _PastTestState extends State<PastTest> {
  int radioId = -1;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/starbg.png"),
    fit: BoxFit.cover,
    ),
    ),
        child: ListView(
          children: [
            toolBarWidget(context,true ,false),
            Container(
                margin: EdgeInsets.only(top: 30, left: 10, right: 10,bottom: 20),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(children: [
                      showHeading( "PAST TEST"),
                      SizedBox(height: 60,),
                      showDateRerpotWidget(),
                      showLine(.7),
                      showResultWidget("10/01/2021","Report 1",false),
                      SizedBox(height: 15,),
                      showResultWidget("11/01/2021","Report 1",true),
                      SizedBox(height: 15,),
                      showResultWidget("12/01/2021","Report 1",false),
                      SizedBox(height: 15,),
                      showResultWidget("13/01/2021","Report 1",true),
                      SizedBox(height: 15,),
                      showResultWidget("14/01/2021","Report 1",false),
                      SizedBox(height: 15,),
                      showResultWidget("15/01/2021","Report 1",true),
                      SizedBox(height: 65,),



                    ])))
          ],
        ),
      ),
    );
  }

  Widget showDateRerpotWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [


          Text(
            "Date",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 18.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          Text(
            "Report Name",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 18.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }


Widget showResultWidget(String date,String name,bool value) {



    return Container(

      margin: EdgeInsets.only(left: 20,right: 20),
      color: value==true ?  gray: white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [


          Text(
            date,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 18.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w500,
              color: buttonColor,
            ),
          ),

          Text(
            name,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 18.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w500,
              color: lightGray,
            ),
          )
        ],
      ),
    );
  }




}
