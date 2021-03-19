import 'package:careergati/activity/HomePage.dart';
import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/AppString.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:pie_chart/pie_chart.dart';

class SampleResultPage extends StatefulWidget {
  @override
  _SampleResultPageState createState() => _SampleResultPageState();
}

class _SampleResultPageState extends State<SampleResultPage> {
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
            GlobalView.toolBarWidget(context, false, true),
            Container(
                margin: EdgeInsets.only(top: 30, left: 10, right: 10,bottom: 20),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(children: [
                      GlobalView.showHeading("PSYCHOMETRIC TEST"),
                      SizedBox(
                        height: 15,
                      ),
                      showDateTimerWidget(),
                      GlobalView.showLine(1.3),
                      SizedBox(
                        height: 20,
                      ),
                      showStudentTextWidget("Name", "XYZ"),
                      SizedBox(
                        height: 20,
                      ),
                      showStudentTextWidget("Contact No.", "9999999999"),
                      SizedBox(
                        height: 20,
                      ),
                      showStudentTextWidget("Test Name", "PSYCHOMETRIC TEST"),
                      SizedBox(
                        height: 50,
                      ),
                      showPieChart(),

                      showLoginButton(),

                      showText(),
                      showInstruction("1","Get detailed Career Gati report by making a small payment of just Rs. 1980.",AppColor.black),
                      showInstruction("2","If a user refers 10 people who buy reports, then he will be eligible for one free report",AppColor.black),

                      SizedBox(
                        height: 20,
                      ),


                    ])))
          ],
        ),
      ),
    );
  }

  Widget showStudentTextWidget(String title, String value) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: title + " :   ",
                          style: new TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18)),
                      TextSpan(text: value, style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ));
          }),
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
              child: Text(
                "55.00",
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
      ],
    );
  }

  Widget showLoginButton() {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0, bottom: 20.0),
      child: RaisedButton(
        onPressed: () {
          Get.to(HomePage());

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
          child: const Text('GET YOUR FULL RESULT',
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

  Widget showInstruction(String sn,String title, Color redColor,) {
    return Padding(
      padding: EdgeInsets.only(top: 10,left: 20,right: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          sn+" . "+title,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 14.0,
            fontFamily: 'Raleway',
            color: redColor,
          ),
        ),
      ),
    );
  }

  Widget showText() {
    return Padding(
      padding: EdgeInsets.only(top: 10,left: 20,right: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "User Benefits Instructions",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 16.0,
            fontFamily: 'Raleway',
            color: AppColor.redColor,
          ),
        ),
      ),
    );
  }
  Widget showPieChart() {
    Map<String, double> dataMap = {
      "Correct Answer": 7,
      "Wrong Answer": 3,
    };

    List<Color> colorList = [
      Colors.green,
      Colors.red,
    ];

    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: "HYBRID",
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: true,
        decimalPlaces: 1,
      ),
    );
  }
}
