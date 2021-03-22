import 'package:cached_network_image/cached_network_image.dart';
import 'package:careergati/activity/educationpage.dart';
import 'package:careergati/modal/question.dart';
import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:html_unescape/html_unescape_small.dart';
import 'package:get/get.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;

  const QuizPage({Key key, @required this.questions}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

var quizCase = "1";

int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60;

class _QuizPageState extends State<QuizPage> {
  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    Question question = widget.questions[_currentIndex];
    final List<dynamic> options = question.incorrectAnswers;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/starbg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              ListView(
                children: [
                  GlobalView.toolBarWidget(context, false, false),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 10, right: 10,bottom: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            showHeading(),
                            SizedBox(
                              height: 5,
                            ),
                            showDateTimerWidget(),
                            showLine(.7),
                            SizedBox(
                              height: 20,
                            ),
                            showQuestionWidget(),
                            showOptionWidget(options),
                            showButtonWidget()
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showLine(double d) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 0),
      color: Colors.white,
      child: (Divider(thickness: d, color: AppColor.subTitleTextColor)),
    );
  }

  Widget showHeading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 0),
            child: Text(
              "  PSYCHOMETRIC TEST",
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Image.asset(
          "assets/images/profilePic.webp",
          height: 70,
          width: 70,
        )
      ],
    );
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      /*  _key.currentState.showSnackBar(SnackBar(
       // content: Text("You must select an answer to continue."),
      ));*/
      GlobalView.createSnackBar(
          "You must select an answer to continue.", context);

      return;
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {

      Get.to(EducationPage());

      /* Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => QuizFinishedPage(
              questions: widget.questions, answers: _answers)));*/
    }
  }

  void _previousSubmit() {
    setState(() {
      --_currentIndex;
    });
  }

  Widget showNextButton() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0, bottom: 20.0),
      child: RaisedButton(
        onPressed: () async {

          GlobalView.showVibration();
          _nextSubmit();
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // min sizes for Material buttons
                alignment: Alignment.center,
                child: Text(_currentIndex == (widget.questions.length - 1)
                    ? "Submit   "
                    : "Next   ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white)),
              ),
              Image(
                  image: AssetImage("assets/images/rightArrow.png"),
                  height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget showPreviousButton() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0, bottom: 20.0),
      child: RaisedButton(
        onPressed: () {
          GlobalView.showVibration();
          _previousSubmit();
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage("assets/images/leftArrow.png"),
                  height: 20.0),
              Container(
                // min sizes for Material buttons
                alignment: Alignment.center,
                child: const Text('  PREVIOUS  ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showQuestionWidget() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: AppColor.colorPrimary,
          child: Text("${_currentIndex + 1}"),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Column(
            children: [
              if (widget.questions[_currentIndex].quizCase == "1" ||
                  widget.questions[_currentIndex].quizCase == "3")
                Text(
                  HtmlUnescape()
                      .convert(widget.questions[_currentIndex].question),
                  softWrap: true,
                  style: TextStyle(fontSize: 18),
                ),
              if (widget.questions[_currentIndex].quizCase == "2" ||
                  widget.questions[_currentIndex].quizCase == "4")
                Container(
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://homepages.cae.wisc.edu/~ece533/images/airplane.png',
                        imageBuilder: (context, imageProvider) {
                          return questionImageWidget(imageProvider);
                        },
                        placeholder: (context, url) {
                          return Center(child: CircularProgressIndicator());
                        },
                        errorWidget: (context, url, error) {
                          return Text("");
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        HtmlUnescape()
                            .convert(widget.questions[_currentIndex].question),
                        softWrap: true,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget questionImageWidget(ImageProvider imageProvider) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );

  }

  Widget optionImageWidget(ImageProvider imageProvider,) {
    return Image.network(
      'https://picsum.photos/250?image=9',
      fit: BoxFit.cover,
      height: 100,
    );

  }

  Widget showOptionWidget(List options) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ...options.map((option) =>

              RadioListTile(
                title: Row(
                  children: [
                    if (widget.questions[_currentIndex].quizCase == "1" ||
                        widget.questions[_currentIndex].quizCase == "4")


                      Text(
                        HtmlUnescape().convert("$option"),
                        style: MediaQuery.of(context).size.width > 800
                            ? TextStyle(fontSize: 30.0)
                            : null,
                      ),


                    if (widget.questions[_currentIndex].quizCase == "2" ||
                        widget.questions[_currentIndex].quizCase == "3")

                      CachedNetworkImage(
                        imageUrl:
                        'https://homepages.cae.wisc.edu/~ece533/images/airplane.png',
                        imageBuilder: (context, imageProvider) {
                          return optionImageWidget(imageProvider);
                        },
                        placeholder: (context, url) {
                          return Center(child: CircularProgressIndicator());
                        },
                        errorWidget: (context, url, error) {
                          return Text("");
                        },
                      ),
                  ],
                ),
                groupValue: _answers[_currentIndex],
                value: option,
                onChanged: (value) {
                  setState(() {
                    _answers[_currentIndex] = option;
                  });
                },
              )



          ),
        ],
      ),
    );
  }



  Widget showButtonWidget() {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


        if (_currentIndex > 0)
          ClipRRect(child: showPreviousButton()),

        
        ClipRRect(child: showNextButton())
      ]),
    );
  }

  Widget showDateTimerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.date_range_sharp),
                    onPressed: () {})),
            Align(
              alignment: Alignment.center,
              child: Text(
                "18-3-2020",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                  fontFamily: 'Raleway',
                  color: Colors.black,
                ),
                maxLines: 1,
              ),
            )
          ],
        ),
        Row(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.timer_outlined),
                    onPressed: () {})),
            Align(
              alignment: Alignment.center,
              child: CountdownTimer(
                onEnd: onEnd,
                endTime: endTime,
                widgetBuilder: (_, CurrentRemainingTime time) {
                  try {
                    var minutes = "";

                    if (time.min == null)
                      minutes = "";
                    else
                      minutes = time.min.toString() + ":";

                    if (time == null) {
                      print('timeisover');

                      return Text("00:0");
                    }

                    return Text(
                      minutes + " " + time.sec.toString(),
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 18.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    );
                  } catch (e) {
                    return Text("00:0");
                  }
                },
              ),
            )
          ],
        ),
      ],
    );
  }

  void onEnd() {
    print('onEnd');
    GlobalView.showSweetError("Quiz time is over", context);
  }


}
