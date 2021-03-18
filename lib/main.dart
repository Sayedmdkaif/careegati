import 'package:careergati/activity/HomePage.dart';
import 'package:careergati/activity/birthpage.dart';
import 'package:careergati/activity/educationpage.dart';
import 'package:careergati/activity/instructionpage.dart';
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
      home: QuizInstructionPage(),
    );
  }
}
