

import 'package:careergati/util/AppColor.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  SliderPage({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.webp"),
          fit: BoxFit.cover,
        ),
      ),      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            width: width * 0.8,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 28,),
          ),


          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              description,
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 14,
                letterSpacing: 0.7,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 160,
          ),
        ],
      ),
    );
  }
}