import 'dart:ffi';

import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/AppString.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweetalert/sweetalert.dart';

class GlobalView {

  static const double padding =20;
  static const double avatarRadius =45;

 static List<String> imgList=[];
 static List<String> viewImgList=[];

 static var propertyName="";
 static var rentPrice="";
 static var securityPrice="";
 static var country="";
 static var state="";
 static var city="";
 static var address="";
 static var landmark="";
 static var pincode="";
 static var description="";


  static var profilePath = "https://managedlandlord.com/newManage/assets_android/users_profile/";
  static var imagePath="https://managedlandlord.com/newManage/assets_android/Building_image/";
  static var placeholderPic="https://miro.medium.com/max/560/1*MccriYX-ciBniUzRKAUsAw.png";

  static var isLogin = "isLogin";
  static var introStatus = "introStatus";
  static var isGoogleLogin = "isGoogleLogin";
  static var user_id = "user_id";
  static var enroll_id = "enroll_id";
  static var user_type = "user_type";
  static var max_add_prop = "max_add_prop";
  static var u_name = "u_name";
  static var u_email = "u_email";
  static var u_password = "u_password";
  static var is_user_paid = "is_user_paid";
  static var u_date = "u_date";
  static var currency = "currency";
  static var mobile = "mobile";
  static var profile = "profile";
  static var google_pic = "google_pic";
  static var forgot_otp = "forgot_otp";
  static var verifyotp = "verifyotp";
  static var verification_status = "verification_status";

  static void createSnackBar(String message, BuildContext context) {
    final snackBar = new SnackBar(
        content: new Text(message),
        backgroundColor: AppColor.redColor,
        duration: Duration(seconds: 2));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static bool checkInternet() {

    var connectivityResult =   (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("NO_InterNEt");
      return false;

    }
    print("InterNEt");
    return true;



  }


 static Widget noDataFoundWidget(double height,String imagePath,String errorMsg) {

   height=height-(height*20)/100;
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
               style: TextStyle(color: AppColor.redColor, fontSize: 16),
             )
           ],
         ),
       ),
     ),
   );
 }




  static void showSweetError(String message, BuildContext context) {
    SweetAlert.show(context,
        style: SweetAlertStyle.error, title: "Ooops", subtitle: message);
  }
 static void showSweetSuccess(String message, BuildContext context, String type) {
    SweetAlert.show(context,
        style: SweetAlertStyle.success, title: AppString.appName, subtitle: message,
        onPress: (bool isConfirm) {
          if (isConfirm) {

            // return false to keep dialog
            return false;
          }
        });
  }

 /* static Future<void> createSession(
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
}
