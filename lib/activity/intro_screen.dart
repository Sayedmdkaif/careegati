import 'package:careergati/activity/loginpage.dart';
import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/AppString.dart';
import 'package:careergati/util/SliderPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentPage = 0;

  PageController _controller = PageController();
  var from;

  List<Widget> introPages = [
    SliderPage(
        title: AppString.intro1,
        description: AppString.introDesc1,
        image: 'assets/images/intro1.webp'),
    SliderPage(
        title: AppString.intro2,
        description: AppString.introDesc2,
        image: 'assets/images/intro2.webp'),
    SliderPage(
        title: AppString.intro3,
        description: AppString.introDesc3,
        image: 'assets/images/intro3.webp'),

  ];



  @override
  void initState() {
    super.initState();

    debugPrint("from $from");


  }

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onchanged,
              controller: _controller,
              itemCount: introPages.length,
              itemBuilder: (context, int index) {
                return introPages[index];
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(introPages.length, (int index) {
                      return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 10,
                          width: (index == _currentPage) ? 30 : 10,
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == _currentPage)
                                  ? AppColor.buttonColor
                                  : AppColor.buttonColor.withOpacity(0.5)));
                    })),
                InkWell(

                  child: GestureDetector(



                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      height: 70,
                      width: (_currentPage == (introPages.length - 1)) ? 200 : 75,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColor.buttonColor, AppColor.buttonColor],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          color: AppColor.colorPrimary,
                          borderRadius: BorderRadius.circular(35)),
                      child: (_currentPage == (introPages.length - 1))
                          ? Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )
                          : Icon(
                              Icons.navigate_next,
                              size: 50,
                              color: Colors.white,
                            ),
                    ),


                    onTap: (){


                      _controller.nextPage(
                          duration: Duration(milliseconds: 800),
                          curve: Curves.easeInOutQuint);

                      if(_currentPage == (introPages.length - 1))
                        Get.to(LoginPage());
                    },

                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
