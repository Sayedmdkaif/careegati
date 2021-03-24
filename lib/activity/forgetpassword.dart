import 'package:careergati/activity/instructionpage.dart';
import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:careergati/util/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:loading_animations/loading_animations.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>{


TextEditingController emailController = TextEditingController();


final formKey = GlobalKey<FormState>();
bool showLoading = false;



@override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  var  mediaQuiry = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/starbg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
          toolBarWidget(context,true,false),
            Container(

              margin: EdgeInsets.only(top:30,left: 10,right: 10),
              child: Card(shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),

                child: Column(

                  children: [


                     showHeading(),

                    SizedBox(height: 40,),


                    Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          _onLoading(showLoading),

                          showEmailWidget(emailController),

                          SizedBox(height: 20,),
                          showLoginButton()



                        ],
                      ),
                    ),




                  ],
                ),


              ),
            )

          ],
        ),
      ),
    );
  }


Widget showHeading() {
  return  Padding(
    padding: EdgeInsets.only(top: 10),
    child: Text(
      "FORGET PASSWORD",
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
Widget showEmailWidget(TextEditingController emailController) {
  return Padding(
    padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
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
        labelText: 'Email',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        helperText: 'Please Enter Email',
        prefixIcon: Icon(Icons.email, color: colorPrimary),
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white70,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: colorPrimary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: colorPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
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


Widget showLoginButton() {
  return Container(
    margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0, bottom: 20.0),
    child: RaisedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          if (!checkInternet()) {
           showSweetError(
                "Please check your internet connection", context);
          } else {

          }
        }


      },
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
        child: const Text('PROCEED',
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
