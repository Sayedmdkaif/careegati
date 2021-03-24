import 'package:careergati/activity/loginpage.dart';
import 'package:careergati/util/AppString.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:vibration/vibration.dart';

import 'AppColor.dart';

const double padding = 20;
const double avatarRadius = 45;

List<String> imgList = [];
List<String> viewImgList = [];

var propertyName = "";
var rentPrice = "";
var securityPrice = "";
var country = "";
var state = "";
var city = "";
var address = "";
var landmark = "";
var pincode = "";
var description = "";

var profilePath =
    "https://managedlandlord.com/newManage/assets_android/users_profile/";
var imagePath =
    "https://managedlandlord.com/newManage/assets_android/Building_image/";
var placeholderPic =
    "https://miro.medium.com/max/560/1*MccriYX-ciBniUzRKAUsAw.png";

var isLogin = "isLogin";
var introStatus = "introStatus";
var isGoogleLogin = "isGoogleLogin";
var user_id = "user_id";
var enroll_id = "enroll_id";
var user_type = "user_type";
var max_add_prop = "max_add_prop";
var u_name = "u_name";
var u_email = "u_email";
var u_password = "u_password";
var is_user_paid = "is_user_paid";
var u_date = "u_date";
var currency = "currency";
var mobile = "mobile";
var profile = "profile";
var google_pic = "google_pic";
var forgot_otp = "forgot_otp";
var verifyotp = "verifyotp";
var verification_status = "verification_status";

Widget showLine(double d) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
    color: Colors.white,
    child: (Divider(thickness: d, color: subTitleTextColor)),
  );
}

void createSnackBar(String message, BuildContext context) {
  final snackBar = new SnackBar(
      content: new Text(message),
      backgroundColor: redColor,
      duration: Duration(seconds: 2));

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

bool checkInternet() {
  var connectivityResult = (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    print("NO_InterNEt");
    return false;
  }
  print("InterNEt");
  return true;
}

Widget noDataFoundWidget(double height, String imagePath, String errorMsg) {
  height = height - (height * 20) / 100;
  return Container(
    height: height,
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              errorMsg,
              style: TextStyle(color: redColor, fontSize: 16),
            )
          ],
        ),
      ),
    ),
  );
}

void showSweetError(String message, BuildContext context) {
  SweetAlert.show(context, onPress: (bool isConfirm) {
    if (isConfirm) {
      Get.to(LoginPage());
      return false;
    }
  }, style: SweetAlertStyle.error, title: AppString.appName, subtitle: message);
}

void showSweetSuccess(String message, BuildContext context) {
  SweetAlert.show(context,
      style: SweetAlertStyle.success,
      title: AppString.appName,
      subtitle: message, onPress: (bool isConfirm) {
    if (isConfirm) {
// return false to keep dialog
      return false;
    }
  });
}

/*  Future<void> createSession(
      LoginRes dataRes, String isGoogleLogin) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(GlobalView.isLogin, "true");
    prefs.setString(GlobalView.isGoogleLogin, isGoogleLogin);
    prefs.setString(GlobalView.user_id, dataRes.userData[0].userId);
    prefs.setString(GlobalView.enroll_id, dataRes.userData[0].enrollId);
    prefs.setString(GlobalView.user_type, dataRes.userData[0].userType);
    prefs.setString(GlobalView.max_add_prop, dataRes.userData[0].maxAddProp);
    prefs.setString(GlobalView.u_name, dataRes.userData[0].uName);
    prefs.setString(GlobalView.u_email, dataRes.userData[0].uEmail);
    prefs.setString(GlobalView.u_password, dataRes.userData[0].uPassword);
    prefs.setString(GlobalView.is_user_paid, dataRes.userData[0].isUserPaid);
    prefs.setString(GlobalView.currency, dataRes.userData[0].currency);
    prefs.setString(GlobalView.mobile, dataRes.userData[0].mobile);
    prefs.setString(GlobalView.google_pic, dataRes.userData[0].googlePic?? '');
    prefs.setString(GlobalView.profile, dataRes.userData[0].profile?? '' );
  }*/

Widget toolBarWidget(
    BuildContext context, bool showBackButton, bool showHomeIcon) {
  return Container(
    height: 50,
    child: Card(
      margin: EdgeInsets.zero,
      color: dark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)),
      ),
      child: Row(
        children: [
          if (showBackButton)
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    })),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/appLogo.png',
              fit: BoxFit.fill,
            ),
          ),
          if (showHomeIcon)
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8, right: 5),
                child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        color: Colors.white,
                        icon: Icon(
                          Icons.home,
                          size: 35,
                        ),
                        onPressed: () {})),
              ),
            ),
        ],
      ),
    ),
  );
}

Widget showHeading(String title) {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Text(
      title,
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

Widget boxImage(String path) {
  return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Image.asset(
        path,
        fit: BoxFit.fill,
        height: 250,
        width: double.infinity,
      ));
}

void showVibration() {
  Vibration.vibrate(duration: 100);
}

List getDates() {
  var dateList = [];
  for (int i = 1; i < 32; i++) dateList.add(i.toString());
  return dateList;
}

List getMonth() {
  var monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  return monthList;
}

List getYear(int currentYear) {
  var yearList = [];
  for (int i = currentYear; i >= 1970; i--) yearList.add(i.toString());
  return yearList;
}

List getHours() {
  var hoursList = [];
  for (int i = 0; i < 24; i++)
    if (i < 10)
      hoursList.add("0" + i.toString());
    else
      hoursList.add(i.toString());

  return hoursList;
}

List getMinutes() {
  var hoursList = [];
  for (int i = 0; i < 60; i++)
    if (i < 10)
      hoursList.add("0" + i.toString());
    else
      hoursList.add(i.toString());

  return hoursList;
}
