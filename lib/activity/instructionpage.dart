import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/AppString.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizInstructionPage extends StatefulWidget {
  @override
  _QuizInstructionPageState createState() => _QuizInstructionPageState();
}

class _QuizInstructionPageState extends State<QuizInstructionPage> {
  int radioId = -1;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Scaffold(
      body: ListView(
        children: [
          GlobalView.toolBarWidget(context, true),
          Container(
              margin: EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(children: [
                    showHeading(),
                    showLine(1.3),
                    selectLangHeading(),
                    showRadioWidget(),
                    showLine(.7),
                    showInstruction("1",AppString.introDesc1),
                    showInstruction("2",AppString.introDesc1),
                    showInstruction("3",AppString.introDesc1),
                    showInstruction("4",AppString.introDesc1),
                    showInstruction("5",AppString.introDesc1),
                    showLoginButton()

                  ])))
        ],
      ),
    );
  }

  Widget showRadioWidget() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: ListTile(
              title: const Text(
                "English",
                style: (TextStyle(fontSize: 15)),
              ),
              leading: Radio(
                activeColor: AppColor.colorPrimary,
                value: 1,
                groupValue: radioId,
                onChanged: (value) {
                  setState(() {
                    radioId = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              title: const Text(
                "Hindi",
                style: (TextStyle(fontSize: 15)),
              ),
              leading: Radio(
                activeColor: AppColor.colorPrimary,
                value: 2,
                groupValue: radioId,
                onChanged: (value) {
                  setState(() {
                    radioId = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showHeading() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "PSYCHOMETRIC TEST",
        textAlign: TextAlign.center,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
          color: Colors.black,
        ),
      ),
    );
  }

  Widget selectLangHeading() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        "Select Language",
        textAlign: TextAlign.center,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 18.0,
          fontFamily: 'Raleway',
          color: Colors.black,
        ),
      ),
    );
  }


Widget showInstruction(String sn,String title) {
    return Padding(
      padding: EdgeInsets.only(top: 10,left: 20,right: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          sn+" . "+title,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 18.0,
            fontFamily: 'Raleway',
            color: Colors.black,
          ),
        ),
      ),
    );
  }


  Widget showLoginButton() {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0, bottom: 20.0),
      child: RaisedButton(
        onPressed: () {
          /*if (formKey.currentState.validate()) {
          if (!GlobalView.checkInternet()) {
            GlobalView.showSweetError(
                "Please check your internet connection", context);
          } else {

          }*/


          //Get.to(QuizInstructionPage());

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
          child: const Text('START QUIZ',
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
