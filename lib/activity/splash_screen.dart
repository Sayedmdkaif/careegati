import 'dart:async';

import 'package:careergati/activity/intro_screen.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();

    gotoNextPage();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splashbg.webp"),
              fit: BoxFit.cover,
            ),
          ),
          child: null),
    );
  }

  Future<void> gotoNextPage() async {
    final prefs = await SharedPreferences.getInstance();

    Timer(
        Duration(seconds: 3),
        () => {
              if (prefs.getString(isLogin) == "true")
                {print('userisLogin')}
              else
                {Get.to(IntroScreen())}
            });
  }
}
