import 'dart:io';
import 'package:careergati/activity/HomePage.dart';
import 'package:careergati/activity/forgetpassword.dart';
import 'package:careergati/activity/loginwithnumber.dart';
import 'package:careergati/activity/registerpage.dart';
import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:careergati/util/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:loading_animations/loading_animations.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var from;

  final formKey = GlobalKey<FormState>();
  bool showLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordVisible = true;


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return WillPopScope(
      onWillPop: () async {
        exit(0);
        return true;
      },
      child: Scaffold(
          body: Stack(children: [

            Container(

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.webp"),
                  fit: BoxFit.cover,
                ),
              ),

            ),

            ListView(children: [showMideWidget()])

          ],
      )),
    );
  }

  Widget showMideWidget() {
    return Container(
      margin: EdgeInsets.only(top: 100,bottom: 30),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(left: 30, right: 30, top: 65),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 2.0,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                ),

                child: Container(
                  margin: EdgeInsets.only(top: 50,bottom: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[


                 Form(
                  key: formKey,
                    child: Column(
                      children: <Widget>[
                        _onLoading(showLoading),
                        showEmailWidget(emailController),
                        showPasswordWidget(passwordController),
                        showForgetPasswordText(),
                        showLoginButton(emailController, passwordController),
                        showLoginWithText(),
                        showSocialIcons(),
                        showNewUserText()
                      ],
                    ),
                  ),


                    ],
                  ),
                ),
              ),
              Positioned(
                left: padding,
                right: padding,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 60,
                  child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(avatarRadius)),
                      child: Image.asset("assets/images/profilePic.webp")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showEmailWidget(TextEditingController emailController) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Theme.of(context).cursorColor,
        autocorrect: true,
        validator: (value) {
          if (value.isEmpty)
            return 'Please enter email';
          else if (!Validator.isEmail(value.trim()))
            return 'Please enter valid email';
          else
            return null;
        },
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: colorPrimary),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: colorPrimary),
          ),
          labelText: 'Email',
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          helperText: 'Please Enter Email',
          prefixIcon: Icon(FontAwesomeIcons.envelope, color: colorPrimary),
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: colorPrimary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: colorPrimary),
          ),
        ),
      ),
    );
  }

  Widget showPasswordWidget(TextEditingController passwordController) {
    var enableObscureText = true;
    var showSuffixIcon = true;

    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty)
            return 'Please enter password';
          else if (value.length < 5)
            return 'password must be more than 5';
          else
            return null;
        },
        controller: passwordController,
        cursorColor: Theme.of(context).cursorColor,
        autocorrect: true,
        obscureText: enableObscureText == true ? passwordVisible : false,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: colorPrimary),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: colorPrimary),
          ),
          labelText: 'Password',
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          helperText: 'Please Enter Password',
          prefixIcon: Icon(FontAwesomeIcons.key, color: colorPrimary),
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white70,
          suffixIcon: showSuffixIcon == true
              ? IconButton(
            icon: Icon(
              passwordVisible ? Icons.visibility_off : Icons.visibility,
              color: colorPrimary,
            ),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: colorPrimary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: colorPrimary),
          ),
        ),
      ),
    );
  }

  Widget showLoginButton(TextEditingController emailController,
      TextEditingController passwordController) {

    var type="";
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 20.0),
      child: RaisedButton(
        onPressed: () => {

        Get.to(HomePage())
        /*  if (formKey.currentState.validate())
            {


              if(!checkInternet())
                {

                  showSweetError("Please check your internet connection", context)

                }
              else
                {

                  setState(() {
                    showLoading = true;
                  }),

                  //hide keyborad
                  SystemChannels.textInput.invokeMethod('TextInput.hide'),


                }




            }*/



        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  buttonColor,
                  buttonColor,
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: const Text('SIGN IN',
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



  Widget showLoginWithText() {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.only(top:10.0),
            child: Text(
              "OR LOGIN WITH ",
              textAlign: TextAlign.right,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 17.0,
                fontFamily: 'Raleway',
                color: colorPrimary,
              ),
            )));
  }

  Widget showSocialIcons()
  {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/gmail.webp',height: 35,),
          Image.asset('assets/images/facebook.webp',height: 35,),
          GestureDetector(
              onTap: (){

                Get.to(LoginWithNumber());

              },
              child: Image.asset('assets/images/mobile.webp',height: 35,)),
        ],
      ),
    );
  }

  Widget showForgetPasswordText() {
    return GestureDetector(
        onTap: () {
          Get.to(ForgetPassword());
        },
        child: Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Forget Password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 15.0,
                    fontFamily: 'Raleway',
                    color: Colors.black,
                  ),
                ))));
  }

Widget showNewUserText() {
    return GestureDetector(
        onTap: () {
          Get.to(RegisterPage());
        },
        child: Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "NEW USER ?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                    color: black,
                  ),
                ))));
  }



  Widget _onLoading(bool value) {
    var show = false;

    if (value) show = true;

    return Visibility(
      visible: show,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LoadingBouncingGrid.circle(
          borderColor: Colors.white,
          borderSize: 3.0,
          size: 40.0,
          backgroundColor: colorPrimary,
          duration: Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
