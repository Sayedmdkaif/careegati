import 'package:careergati/activity/sampleresultpage.dart';
import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class BirthPage extends StatefulWidget {
  @override
  _BirthPageState createState() => _BirthPageState();
}

String selectedDate; // Option 2
String selectedMonth; // Option 2
String selectedYear; // Option 2
String selectedHour; // Option 2
String selectedMinute; // Option 2
String selectedSecond; // Option 2

class _BirthPageState extends State<BirthPage> {
  int radioId = -1;
  var currentYear = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController placeNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final now = new DateTime.now();
    currentYear = DateFormat('y').format(now); // 28/03/2020

    var a = int.parse(currentYear);

    print('currentyear' + a.toString());
  }

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
            GlobalView.toolBarWidget(context, true, false),
            Container(
                margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(children: [
                      SizedBox(
                        height: 0,
                      ),
                      GlobalView.boxImage("assets/images/astoPic.webp"),
                      GlobalView.showHeading("ENTER YOUR BIRTH DETAILS"),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          showSubHeading("Date", 50),
                          showSubHeading("Month", 50),
                          showSubHeading("Year", 50),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(flex: 2, child: showDateDropDown()),
                          Expanded(flex: 3, child: showMonthDropDown()),
                          Expanded(flex: 2, child: showYearDropDown()),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          showSubHeading("Hours", 10),
                          showSubHeading("Minutes", 10),
                          showSubHeading("Second", 10),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(flex: 2, child: showHourDropDown()),
                          Expanded(flex: 3, child: showMinuteDropDown()),
                          Expanded(flex: 2, child: showSecondDropDown()),
                        ],
                      ),

                      Form(
                          key: formKey,
                          child: Column(children: <Widget>[
                            showPlaceOfBirthWidget(placeNameController),
                            showLoginButton(placeNameController)
                          ])),
                      // showCountryDropDown(),


                    ])))
          ],
        ),
      ),
    );
  }

  Widget showSubHeading(String title, double topp) {
    return Padding(
      padding: EdgeInsets.only(top: topp),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 20.0,
          fontFamily: 'Raleway',
          color: Colors.black,
        ),
      ),
    );
  }

  Widget showHourDropDown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.colorPrimary,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
      child: Padding(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.colorPrimary))),
          iconEnabledColor: Colors.black,
          isExpanded: true,
          hint: Text('  H'),
          // Not necessary for Option 1
          value: selectedHour,
          onChanged: (newValue) {
            setState(() {
              selectedHour = newValue;
            });
          },
          items: GlobalView.getHours().map((location) {
            return DropdownMenuItem(
              child: new Text(location),
              value: location,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget showMinuteDropDown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.colorPrimary,
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
      child: Padding(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.colorPrimary))),
          iconEnabledColor: Colors.black,
          isExpanded: true,
          hint: Text('  M'),
          // Not necessary for Option 1
          value: selectedMinute,
          onChanged: (newValue) {
            setState(() {
              selectedMinute = newValue;
            });
          },
          items: GlobalView.getMinutes().map((location) {
            return DropdownMenuItem(
              child: new Text(location),
              value: location,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget showSecondDropDown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.colorPrimary,
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
      child: Padding(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.colorPrimary))),
          iconEnabledColor: Colors.black,
          isExpanded: true,
          hint: Text('  S'),
          // Not necessary for Option 1
          value: selectedSecond,
          onChanged: (newValue) {
            setState(() {
              selectedSecond = newValue;
            });
          },
          items: GlobalView.getMinutes().map((location) {
            return DropdownMenuItem(
              child: new Text(location),
              value: location,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget showPlaceOfBirthWidget(TextEditingController nameController) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: TextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          cursorColor: Theme.of(context).cursorColor,
          autocorrect: true,
          validator: (value) {
            if (value.isEmpty)
              return 'Please enter place of birth';
            else if (value.length < 3)
              return 'Please enter valid place of birth';
            else
              return null;
          },
          decoration: InputDecoration(
            labelText: 'Place Of Birth',
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
            helperText: 'Please Enter Place Of Birth',
            prefixIcon:
                Icon(Icons.place_outlined, color: AppColor.colorPrimary),
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white70,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColor.colorPrimary),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColor.colorPrimary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: AppColor.colorPrimary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColor.colorPrimary),
            ),
          ),
        ),
      ),
    );
  }

  Widget showDateDropDown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.colorPrimary,
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
      child: Padding(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.colorPrimary))),
          iconEnabledColor: Colors.black,
          isExpanded: true,
          hint: Text('  DD'),
          // Not necessary for Option 1
          value: selectedDate,
          onChanged: (newValue) {
            setState(() {
              selectedDate = newValue;
            });
          },
          items: GlobalView.getDates().map((location) {
            return DropdownMenuItem(
              child: new Text(location),
              value: location,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget showMonthDropDown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.colorPrimary,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
      child: Padding(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.colorPrimary))),
          iconEnabledColor: Colors.black,
          isExpanded: true,
          hint: Text('  MM'),
          // Not necessary for Option 1
          value: selectedMonth,
          onChanged: (newValue) {
            setState(() {
              selectedMonth = newValue;
            });
          },
          items: GlobalView.getMonth().map((location) {
            return DropdownMenuItem(
              child: new Text(location),
              value: location,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget showYearDropDown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.colorPrimary,
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
      child: Padding(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.colorPrimary))),
          iconEnabledColor: Colors.black,
          isExpanded: true,
          hint: Text('  YY'),
          // Not necessary for Option 1
          value: selectedYear,
          onChanged: (newValue) {
            setState(() {
              selectedYear = newValue;
            });
          },
          items: GlobalView.getYear(int.parse(currentYear)).map((location) {
            return DropdownMenuItem(
              child: new Text(location),
              value: location,
            );
          }).toList(),
        ),
      ),
    );
  }

  List getDates() {
    var dateList = [];

    for (int i = 1; i < 32; i++) dateList.add(i.toString());

    return dateList;
  }

  Widget showLoginButton(TextEditingController placeNameController) {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0, bottom: 20.0),
      child: RaisedButton(
        onPressed: () {
          if (formKey.currentState.validate())
            {

              Get.to(SampleResultPage());

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
