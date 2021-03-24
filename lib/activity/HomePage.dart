import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:careergati/activity/changepassword.dart';
import 'package:careergati/activity/instructionpage.dart';
import 'package:careergati/activity/loginpage.dart';
import 'package:careergati/activity/pasttest.dart';
import 'package:careergati/activity/profileupdate.dart';
import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/AppString.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweetalert/sweetalert.dart';

class HomePage extends StatefulWidget with WidgetsBindingObserver {
  @override
  _HomePageState createState() => _HomePageState();
}

List imgList=[
  "https://homepages.cae.wisc.edu/~ece533/images/fruits.png",
  "https://homepages.cae.wisc.edu/~ece533/images/girl.png",
  "https://homepages.cae.wisc.edu/~ece533/images/peppers.png",
  "https://homepages.cae.wisc.edu/~ece533/images/serrano.png",

];

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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/starbg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(bottom: 0),

            child: ListView(children: [toolBarHomeWidget(),
              imageSlider(),
              showTextDescWidget(),
              showHeading("Give right direction and speed to your career in 3 easy steps"),
            SizedBox(height: 5,),
            Divider(thickness: 1,indent: 20,endIndent: 20, color: subTitleTextColor),

              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
                child: Image.asset(
                  'assets/images/homePic.webp',
                  fit: BoxFit.fill,
                  height: 100,
                  width: double.infinity,
                ),
              ),


            ]),
          ),
        ),
        drawer: drawerWidget()
      ),
    );
  }

  Widget showHeading(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 30,left: 20,right: 20),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
          color: Colors.white,
        ),
      ),
    );
  }

  Widget showTextDescWidget() {
    return Container(
      margin: EdgeInsets.only(left:20.0,right: 20.0,top: 20),
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  AppString.introDesc1+" "+AppString.introDesc1,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16.0,
                    fontFamily: 'Raleway',
                    color: Colors.black,
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Expanded(
                        flex: 2,
                        child: Text(
                          AppString.introDesc1,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16.0,
                            fontFamily: 'Raleway',
                            color: Colors.black,
                          ),
                        ),),
                    Expanded(
                        flex: 1,
                        child:  Image.asset('assets/images/booksPic.webp',height:80,fit: BoxFit.cover,))



                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget imageSlider() {
    return Container(
      margin: EdgeInsets.only(left:10.0,right: 10.0),

      child: CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
          height: 220.0,
          enlargeCenterPage: true,
          autoPlay: true,
          viewportFraction: 1,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
        ),
      ),
    );
  }


  final List<Widget> imageSliders = imgList
      .map((item) => Container(
    child: Container(

      margin: EdgeInsets.all(10.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          child: Stack(
            children: <Widget>[


              /*Image.network(item,
                  fit: BoxFit.cover, width: double.infinity),*/

              CachedNetworkImage(
                imageUrl: item,
                imageBuilder: (context, imageProvider) {
                  return questionImageWidget(imageProvider);
                },
                placeholder: (context, url) {
                  return Center(child: CircularProgressIndicator());
                },
                errorWidget: (context, url, error) {
                  return Text("");
                },
              ),



              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                ),
              ),
            ],
          )),
    ),
  ))
      .toList();


  static questionImageWidget(ImageProvider imageProvider) {

    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );

  }





   Widget toolBarHomeWidget()
  {
    return  Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.dehaze_outlined),
                  onPressed: () {

                    _scaffoldKey.currentState.openDrawer();


                  })),

          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/images/appLogo.png',
              fit: BoxFit.fill,
            ),
          ),



        ],
      ),
    );
  }

  Future<void> getSPValue() async {
    final prefs = await SharedPreferences.getInstance();

    uName = prefs.getString(u_name);
    uEmail = prefs.getString(u_email);
    user_id = prefs.getString(user_id);

    if (prefs.getString(isGoogleLogin) == "true" &&
        prefs.getString(google_pic) != null &&
        prefs.getString(google_pic).isNotEmpty) {
      uPic = prefs.getString(google_pic);
    } else if (prefs.getString(profile) != null &&
        prefs.getString(profile).isNotEmpty) {
      uPic =profilePath + prefs.getString(profile);
    } else
      uPic =placeholderPic;

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
   // final prefs = await SharedPreferences.getInstance();

    //var introStatus = prefs.getString(GlobalView.introStatus);

    //prefs.clear();
    //prefs.setString(GlobalView.introStatus, introStatus);

   // await FirebaseAuth.instance.signOut();

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
     createSnackBar("Please click back again to exit", context);
      return false;
    }
    exit(0);
    return true;
  }

  void shareApp() {
    Share.share('check out my website https://example.com',
        subject: 'Look what I made!');
  }

 Widget drawerWidget() {

     return Container(
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
                     Get.back();
                     Get.to(ProfileUpdate());
                   },
                   child: UserAccountsDrawerHeader(
                     decoration: BoxDecoration(
                       color: white,
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
                 GestureDetector(
                   onTap: (){
                     Get.back();
                     Get.to(QuizInstructionPage());
                   },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         margin: EdgeInsets.all(5),
                         child: Card(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.only(topRight:Radius.circular(20)),
                           ),
                           elevation: 5,
                           child: IconButton(
                               color: Colors.black,
                               icon: Icon(FontAwesomeIcons.fileAlt,color: buttonColor,),
                               ),
                         ),
                       ),

                       Text(
                           "  Aptitude Test",
                           style: TextStyle(fontSize: 18,color: buttonColor)
                       ),

                       Expanded(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             IconButton(
                                 color: Colors.black,
                                 icon: Icon(FontAwesomeIcons.arrowAltCircleRight,color: buttonColor,),
                                ),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
                 Divider(
                   indent: 10,
                   endIndent: 10,
                 ),

                 GestureDetector(
                  onTap: (){
                    Get.back();
                    Get.to(PastTest());
                  },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         margin: EdgeInsets.all(5),
                         child: Card(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.only(topRight:Radius.circular(20)),
                           ),
                           elevation: 5,
                           child: IconButton(
                               color: Colors.black,
                               icon: Icon(FontAwesomeIcons.fileAlt,color: buttonColor,),
                              ),
                         ),
                       ),

                       Text(
                         "  Past Test",
                         style: TextStyle(fontSize: 18,color: buttonColor)
                       ),

                       Expanded(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             IconButton(
                                 color: Colors.black,
                                 icon: Icon(FontAwesomeIcons.arrowAltCircleRight,color: buttonColor,),
                                ),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),

                 Divider(
                   indent: 10,
                   endIndent: 10,
                 ),

                 GestureDetector(
                   onTap: (){
                    Get.back();
                     Get.to(ChangePassword());
                   },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         margin: EdgeInsets.all(5),
                         child: Card(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.only(topRight:Radius.circular(20)),
                           ),
                           elevation: 5,
                           child: IconButton(
                               color: Colors.black,
                               icon: Icon(FontAwesomeIcons.key,color: buttonColor,),
                               ),
                         ),
                       ),

                       Text(
                           "  Change Password",
                           style: TextStyle(fontSize: 18,color: buttonColor)
                       ),

                       Expanded(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             IconButton(
                                 color: Colors.black,
                                 icon: Icon(FontAwesomeIcons.arrowAltCircleRight,color: buttonColor,),
                                ),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),

                 Divider(
                   indent: 10,
                   endIndent: 10,
                 ),

             GestureDetector(
               onTap: (){
                 Get.back();
                askToLogout();
               },
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Container(
                     margin: EdgeInsets.all(5),
                     child: Card(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.only(topRight:Radius.circular(20)),
                       ),
                       elevation: 5,
                       child: IconButton(
                           color: Colors.black,
                           icon: Icon(Icons.login_outlined,color: buttonColor,),
                          ),
                     ),
                   ),

                   Text(
                       "  Logout",
                       style: TextStyle(fontSize: 18,color: buttonColor)
                   ),

                   Expanded(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                             IconButton(
                             color: Colors.black,
                             icon: Icon(FontAwesomeIcons.arrowAltCircleRight,color: buttonColor,),),
                           ],
                     ),
                   ),
                 ],
               ),
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
     );
 }


}
