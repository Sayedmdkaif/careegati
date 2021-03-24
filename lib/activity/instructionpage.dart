import 'package:careergati/activity/quiz_page.dart';
import 'package:careergati/modal/question.dart';
import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/AppString.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/starbg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            toolBarWidget(context, false, true),
            Container(
                margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Card(
                    /* color:  Color(0xFFFFFFFF).withOpacity(0.8),*/
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(children: [
                      showHeading("PSYCHOMETRIC TEST"),
                      showLine(1.3),
                      selectLangHeading(),
                      showRadioWidget(),
                      showLine(.7),
                      showInstruction("1", AppString.introDesc1),
                      showInstruction("2", AppString.introDesc1),
                      showInstruction("3", AppString.introDesc1),
                      showInstruction("4", AppString.introDesc1),
                      showInstruction("5", AppString.introDesc1),
                      showLoginButton()
                    ])))
          ],
        ),
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
                activeColor: colorPrimary,
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
                activeColor: colorPrimary,
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

  Widget showInstruction(String sn, String title) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 20, right: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          sn + " . " + title,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 16.0,
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
          if (radioId == -1)
            createSnackBar("Please select language", context);
          else {
            List<Question> questions = [];
            List<dynamic> incorrectAnswers = [];

            incorrectAnswers.add("Single");
            incorrectAnswers.add("Secure");
            incorrectAnswers.add("Solid");

            questions.add(Question(
                "What does the &#039;S&#039; stand for in the abbreviation SIM, as in SIM card ?",
                "Subscriber",
                incorrectAnswers,
                "1"));
            questions.add(Question(
                "What does the &#039;S&#039; stand for in the abbreviation SIM, as in SIM card ?",
                "Subscriber",
                incorrectAnswers,
                "2"));
            questions.add(Question(
                "What does the &#039;S&#039; stand for in the abbreviation SIM, as in SIM card ?",
                "Subscriber",
                incorrectAnswers,
                "3"));
            questions.add(Question(
                "What does the &#039;S&#039; stand for in the abbreviation SIM, as in SIM card ?",
                "Subscriber",
                incorrectAnswers,
                "4"));

            Get.to(QuizPage(
              questions: questions,
            ));
          }
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  buttonColor,
                  buttonColor,
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
}
