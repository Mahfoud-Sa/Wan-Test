//import 'dart:js_interop';

import 'dart:convert';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:wan_test/Modles/userModel.dart';
import 'package:wan_test/repositories/users/users_api.dart';

class LoginVM {
  Dio dio = Dio();
  Future<bool> checkInternet() {
    //return Future(() => false);
    return InternetConnectionChecker().hasConnection;
  }

  Future<bool> LogIn(String userName, String password) async {
    try {
      UserModel user = await usersAPI().get(userName, password);

      SharedPreferences userData = await SharedPreferences.getInstance();
      userData.setString('name', user.name!);
      userData.setString('password', user.password!);
      userData.setString('fullName', user.fullName!);
      userData.setString('email', user.email!);
      userData.setInt('phoneNum', user.phoneNum!);
      userData.setString('address', user.address!);
      userData.setBool('gender', user.gender!);
      userData.setString('image', user.image!);

      dio.close();
      return true;
    } catch (e) {
      dio.close();
      return false;
    }
  }
}
