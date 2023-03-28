import 'dart:convert';
import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_final/utils/shared_preference.dart';
import 'package:quiz_final/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/main_class.dart';



class AuthProvider with ChangeNotifier {
  String token = '';
  String _id = '';
  String student_id = '';
  String institute_id = '';
  String course = '';


  String type = '';
  String phone = '';
  String email = '';
  String langId = '';
  String catId = '';
  String message = '';
  String name = '';
  String otp = '';
  String studentName = '';
  String selected_country_code = '+91';
  String image = '';
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String verificationid = '';



 // final HomeRepository _homeRepo = HomeRepository();
  //   HomeRepository get homeRepo => _homeRepo;
  int status = 0;
  bool mobileError = false;
  bool loading = false;
  bool otpError = false;
  bool nameError = false;




  String classname = "All Classes";
  String sectionName = "All Sections";

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  final SharedPrefrence _saveData = SharedPrefrence();

  SharedPrefrence get saveData => _saveData;

  bool get isAuth {
    print("here" + _id != '');
    // ignore: avoid_print
    return _id.isNotEmpty && type != "register";
  }

  String get _token {
    if (token.isNotEmpty) {
      return token;
    }
    return '';
  }


  String get userId {
    return _id;
  }
  void updatePhone(String value)
{
  phone = value;
}
  void updatevid(String value)
  {
    verificationid = value;
  }
  void updateLoginStatus(int value, BuildContext context) {
    if (value == 0) {
      // Navigator.popAndPushNamed(
      //   context,
      //   Login.routeName,
      // );
    } else {
      // Navigator.popAndPushNamed(
      //   context,
      //   Otp.routeName,
      // );
    }

    // notifyListeners();
  }





}
