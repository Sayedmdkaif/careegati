import 'package:careergati/activity/splash_screen.dart';
import 'package:careergati/service/HomeRes.dart';
import 'package:careergati/service/RestClient.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }


}
