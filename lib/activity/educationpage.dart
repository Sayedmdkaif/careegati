import 'package:careergati/activity/experiencepage.dart';
import 'package:careergati/activity/quiz_page.dart';
import 'package:careergati/modal/question.dart';
import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/AppString.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EducationPage extends StatefulWidget {
  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
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
            GlobalView.toolBarWidget(context,false ,false),
            Container(
                margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(children: [

                      SizedBox(height: 30,),
                      GlobalView.boxImage("assets/images/studentPic.webp"),
                      GlobalView.showHeading("EDUCATION DETAILS"),

                      showLoginButton()

                    ])))
          ],
        ),
      ),
    );
  }








  Widget showLoginButton() {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0, bottom: 20.0),
      child: RaisedButton(
        onPressed: () {


          Get.to(ExperiencePage());

        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  AppColor.buttonColor,
                  AppColor.buttonColor,
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: const Text('SUBMIT',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w300,
                  color: Colors.white)),
        ),
      ),
    );
  }



  Widget showLine(double d) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      color: Colors.white,
      child: (Divider(thickness: d, color: AppColor.subTitleTextColor)),
    );
  }
}
