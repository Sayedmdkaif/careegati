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

class ProfileUpdate extends StatefulWidget {
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate>{

TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController mobileController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController cpasswordController = TextEditingController();

final formKey = GlobalKey<FormState>();
bool showLoading = false;
int radioId = -1;

List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
String _selectedLocation; // Option 2
bool passwordVisible = true;
bool cpasswordVisible = true;
var passwordValue = "";

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


                    Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          _onLoading(showLoading),
                          showFirstNameWidget(firstNameController),
                          showLastNameWidget(lastNameController),
                          showRadioWidget(),
                          showCountryDropDown(),
                          showStateDropDown(),
                          showCityDropDown(),
                          showOccupationDropDown(),
                          showMobileWidget(mobileController),
                          showEmailWidget(emailController),
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


Widget showMobileWidget(TextEditingController mobileController) {
  return Padding(
    padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
    child: TextFormField(
      controller: mobileController,
      keyboardType: TextInputType.phone,
      cursorColor: Theme.of(context).cursorColor,
      autocorrect: true,
      validator: (value) {
        if (value.isEmpty)
          return 'Please enter mobile';
        else
          return null;
      },
      decoration: InputDecoration(
        labelText: 'Mobile',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        helperText: 'Please Enter Mobile',
        prefixIcon: Icon(FontAwesomeIcons.mobileAlt, color: colorPrimary),
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

Widget showEmailWidget(TextEditingController emailController) {
  return Padding(
    padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
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
        prefixIcon: Icon(FontAwesomeIcons.envelope, color: colorPrimary),
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
        /*if (formKey.currentState.validate()) {
          if (!GlobalView.checkInternet()) {
            GlobalView.showSweetError(
                "Please check your internet connection", context);
          } else {

          }*/


        Get.to(QuizInstructionPage());

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
        child: const Text('UPDATE',
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

  Widget showFirstNameWidget(TextEditingController nameController) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
        child: TextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          cursorColor: Theme.of(context).cursorColor,
          autocorrect: true,
          validator: (value) {
            if (value.isEmpty)
              return 'Please enter first name';
            else if (value.length < 3)
              return 'Please enter valid first name';
            else
              return null;
          },
          decoration: InputDecoration(
            labelText: 'First Name',
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
            helperText: 'Please Enter First Name',
            prefixIcon:
            Icon(FontAwesomeIcons.user, color: colorPrimary),
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
      ),
    );
  }


  Widget showLastNameWidget(TextEditingController nameController) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
        child: TextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          cursorColor: Theme.of(context).cursorColor,
          autocorrect: true,

          decoration: InputDecoration(
            labelText: 'Last Name',
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
            helperText: 'Please Enter Last Name',
            prefixIcon:
            Icon(FontAwesomeIcons.user, color: colorPrimary),
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
      ),
    );
  }



Widget showRadioWidget() {
  return Container(
    margin: EdgeInsets.only(left: 20,right: 20,top: 10),
    child: Row(
      children: [
        Expanded(
          child: Text(
            "Gender",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                color: textColor),
          ),
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: ListTile(
            dense:true,
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            title: const Text(
             "Male",
            ),
            leading: Radio(
              activeColor: colorPrimary,
              value: 1,
              groupValue: radioId,
              onChanged: (value) {
                setState(() {
                  radioId = value;
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ListTile(

            dense:true,
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            title: const Text(
              "Female",
            ),
            leading: Radio(
              activeColor: colorPrimary,
              value: 2,
              groupValue: radioId,
              onChanged: (value) {
                setState(() {
                  radioId = value;
                });
              },
            ),
          ),
        ),
      ],
    ),
  );
}


Widget showHeading() {
    return  Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "PROFILE",
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

 Widget showCountryDropDown() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: colorPrimary,
        style: BorderStyle.solid,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),

    margin: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
    child: Padding(
      padding: EdgeInsets.only(left: 2,right: 2),
      child: DropdownButtonFormField(
        icon:  Icon(FontAwesomeIcons.caretSquareDown, color: colorPrimary),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: colorPrimary))),
        iconEnabledColor: Colors.black,
        isExpanded: true,
        hint: Text('Choose Country'), // Not necessary for Option 1
        value: _selectedLocation,
        onChanged: (newValue) {
          setState(() {
            _selectedLocation = newValue;
          });
        },
        items: _locations.map((location) {
          return DropdownMenuItem(


            child: new Text(location),
            value: location,
          );
        }).toList(),
      ),
    ),
  );
 }

 Widget showStateDropDown() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: colorPrimary,
        style: BorderStyle.solid,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),

    margin: EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 10),
    child: Padding(
      padding: EdgeInsets.only(left: 2,right: 2),

      child: DropdownButtonFormField(
        icon:  Icon(FontAwesomeIcons.caretSquareDown, color: colorPrimary),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: colorPrimary))),
        iconEnabledColor: Colors.black,
        isExpanded: true,
        hint: Text('Choose State'), // Not necessary for Option 1
        value: _selectedLocation,
        onChanged: (newValue) {
          setState(() {
            _selectedLocation = newValue;
          });
        },
        items: _locations.map((location) {
          return DropdownMenuItem(


            child: new Text(location),
            value: location,
          );
        }).toList(),
      ),
    ),
  );
 }
 Widget showCityDropDown() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: colorPrimary,
        style: BorderStyle.solid,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),

    margin: EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 10),
    child: Padding(
      padding: EdgeInsets.only(left: 2,right: 2),
      child: DropdownButtonFormField(
        icon:  Icon(FontAwesomeIcons.caretSquareDown, color: colorPrimary),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: colorPrimary))),
        iconEnabledColor: Colors.black,
        isExpanded: true,
        hint: Text('Choose City'), // Not necessary for Option 1
        value: _selectedLocation,
        onChanged: (newValue) {
          setState(() {
            _selectedLocation = newValue;
          });
        },
        items: _locations.map((location) {
          return DropdownMenuItem(


            child: new Text(location),
            value: location,
          );
        }).toList(),
      ),
    ),
  );
 }

 Widget showOccupationDropDown() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: colorPrimary,
        style: BorderStyle.solid,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),

    margin: EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 10),
    child: Padding(
      padding: EdgeInsets.only(left: 2,right: 2),
      child: DropdownButtonFormField(
        icon:  Icon(FontAwesomeIcons.caretSquareDown, color: colorPrimary),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: colorPrimary))),
        iconEnabledColor: Colors.black,
        isExpanded: true,
        hint: Text('Choose Occupation'), // Not necessary for Option 1
        value: _selectedLocation,
        onChanged: (newValue) {
          setState(() {
            _selectedLocation = newValue;
          });
        },
        items: _locations.map((location) {
          return DropdownMenuItem(


            child: new Text(location),
            value: location,
          );
        }).toList(),
      ),
    ),
  );
 }



}
