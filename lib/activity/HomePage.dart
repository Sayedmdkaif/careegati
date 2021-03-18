import 'dart:io';

import 'package:careergati/activity/loginpage.dart';
import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/AppString.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweetalert/sweetalert.dart';

class HomePage extends StatefulWidget with WidgetsBindingObserver {
  @override
  _HomePageState createState() => _HomePageState();
}

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

var uName = "Sayed Md. Kaif";
var uEmail = "mkaif6053@gmail.com";
var uPic = "";
var user_id = "";
DateTime backbuttonpressedTime;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //getSPValue();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print('kaifresume');
    }
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text(AppString.appName)),
        body: Text("kaif"),
        drawer: Container(
          width: 280,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                bottomRight: Radius.circular(35)),
            child: Drawer(
              elevation: 100,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/drawerBg.webp"),
                        fit: BoxFit.cover)),
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                          color: AppColor.white,
                        ),
                        accountName: Text(
                          uName,
                          style: TextStyle(color: Colors.black),
                        ),
                        accountEmail: Text(
                          uEmail,
                          style: TextStyle(color: Colors.black),
                        ),
                        currentAccountPicture: Container(
                          width: 100.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://miro.medium.com/max/560/1*MccriYX-ciBniUzRKAUsAw.png")),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.file_copy_sharp,
                        size: 30,
                        color: Colors.black45,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        size: 30,
                        color: Colors.black45,
                      ),
                      title: Text(
                        "Aptitude Test",
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.file_copy_sharp,
                        size: 30,
                        color: Colors.black45,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        size: 30,
                        color: Colors.black45,
                      ),
                      title: Text(
                        "Past Test",
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.lock,
                        size: 30,
                        color: Colors.black45,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        size: 30,
                        color: Colors.black45,
                      ),
                      title: Text(
                        "Change Password",
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.login_outlined,
                        size: 30,
                        color: Colors.black45,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        size: 30,
                        color: Colors.black45,
                      ),
                      title: Text(
                        "Logout",
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        askToLogout();
                      },
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getSPValue() async {
    final prefs = await SharedPreferences.getInstance();

    uName = prefs.getString(GlobalView.u_name);
    uEmail = prefs.getString(GlobalView.u_email);
    user_id = prefs.getString(GlobalView.user_id);

    if (prefs.getString(GlobalView.isGoogleLogin) == "true" &&
        prefs.getString(GlobalView.google_pic) != null &&
        prefs.getString(GlobalView.google_pic).isNotEmpty) {
      uPic = prefs.getString(GlobalView.google_pic);
    } else if (prefs.getString(GlobalView.profile) != null &&
        prefs.getString(GlobalView.profile).isNotEmpty) {
      uPic = GlobalView.profilePath + prefs.getString(GlobalView.profile);
    } else
      uPic = GlobalView.placeholderPic;

    print('kaifpic' + uPic);

    setState(() {});
  }

  void askToLogout() {
    SweetAlert.show(context,
        title: AppString.appName,
        subtitle: "Are you sure want to logout?",
        style: SweetAlertStyle.confirm,
        showCancelButton: true, onPress: (bool isConfirm) {
      if (isConfirm) {
        logout();
        // return false to keep dialog
        return false;
      }
    });
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    var introStatus = prefs.getString(GlobalView.introStatus);

    prefs.clear();
    prefs.setString(GlobalView.introStatus, introStatus);

    await FirebaseAuth.instance.signOut();

    Get.to(LoginPage());
  }

  Future<bool> onWillPop() async {
    if (_scaffoldKey.currentState.isDrawerOpen) {
      Navigator.of(context).pop();
      return false;
    }

    DateTime currentTime = DateTime.now();
    //Statement 1 Or statement2
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);
    if (backButton) {
      backbuttonpressedTime = currentTime;
      GlobalView.createSnackBar("Please click back again to exit", context);
      return false;
    }
    exit(0);
    return true;
  }

  void shareApp() {
    Share.share('check out my website https://example.com',
        subject: 'Look what I made!');
  }
}
