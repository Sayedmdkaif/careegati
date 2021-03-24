import 'package:careergati/activity/instructionpage.dart';
import 'package:careergati/util/AppColor.dart';
import 'package:careergati/util/GlobalView.dart';
import 'package:careergati/util/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:loading_animations/loading_animations.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword>{


  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController cnewPasswordController = TextEditingController();


final formKey = GlobalKey<FormState>();
bool showLoading = false;
  bool passwordVisible = true;
  bool loginSuccess = false;
  var u_password ="";


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

                    SizedBox(height: 20,),


                    Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          _onLoading(showLoading),

                          showOldPasswordWidget(oldPasswordController),
                          showNewPasswordWidget(newPasswordController),
                          showCNewPasswordWidget(newPasswordController,cnewPasswordController),

                          SizedBox(height: 20,),
                          showLoginButton(
                              oldPasswordController, newPasswordController,cnewPasswordController),





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
      "CHANGE PASSWORD",
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



  Widget showOldPasswordWidget(TextEditingController passwordController) {
    var enableObscureText = true;
    var showSuffixIcon = true;

    return Padding(
      padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty)
            return 'Please enter password';
          else if (value.length < 5)
            return 'password must be more than 5';
          else if(u_password!=value)
          {
            print("kaif"+u_password+" "+value);
            return 'old password not matched';
          }
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
  } Widget showNewPasswordWidget(TextEditingController passwordController) {
    var enableObscureText = true;
    var showSuffixIcon = true;

    return Padding(
      padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty)
            return 'Please enter New password';
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
          labelText: 'New Password',
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          helperText: 'Please Enter New Password',
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
  } Widget showCNewPasswordWidget(TextEditingController newPasswordController ,TextEditingController passwordController) {
    var enableObscureText = true;
    var showSuffixIcon = true;

    return Padding(
      padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty)
            return 'Please enter Confirm New password';
          else if (value.length < 5)
            return 'password must be more than 5 words';
          else if(newPasswordController.text.toString().trim()!=value.toString().trim())
          {
            //print('kkkkkk'+newPasswordController.text.toString());
            return 'confirm password not matched';
          }

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
          labelText: 'Confirm New Password',
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          helperText: 'Please Enter Confirm New Password',
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

  Widget showLoginButton(TextEditingController oldPasswordController,
      TextEditingController newPasswordController, TextEditingController cnewPasswordController) {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0, bottom: 20.0),
      child: RaisedButton(
        onPressed: () {


          if (formKey.currentState.validate())
          {


            if(!checkInternet())
            {

             showSweetError("Please check your internet connection", context);

            }
            else
            {

              setState(() {
                showLoading = true;
              });

          //hide keyborad
          SystemChannels.textInput.invokeMethod('TextInput.hide');


          // loginAPI(user_id,cnewPasswordController.text.toString())

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
          child: const Text('CHANGE',
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
