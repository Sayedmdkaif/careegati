import 'dart:async';

class Validator {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (Validator.isEmail(value.trim())) {
      sink.add(value);
    } else {
      sink.addError("This is not valid email");
    }
  });



  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
  if (value.length > 4) {
  sink.add(value);
  } else {
  sink.addError("password must be more than 5 letters");
  }
  });

  static bool isEmail(String email) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
    return emailValid;
  }





}
