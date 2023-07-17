//import 'dart:js_interop';

import 'dart:convert';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:wan_test/Views/pages/Modles/userModel.dart';

class LoginVM {
  Dio dio = Dio();
  Future<bool> checkInternet() {
    //return Future(() => false);
    return InternetConnectionChecker().hasConnection;
  }

  Future<bool> LogIn(String userName, String password) async {
    try {
      var respons = await dio.post('https://wantest123.000webhostapp.com/',
          queryParameters: {'userName': userName, 'password': password});
      if (respons.data == 'nullnull') {
        return false;
      }
      //print();
      UserModel user = UserModel.fromJson(jsonDecode(respons.data));

      SharedPreferences userData = await SharedPreferences.getInstance();
      userData.setString('name', user.name!);
      userData.setString('password', user.password!);
      userData.setString('fullName', user.fullName!);
      userData.setString('email', user.email!);
      userData.setInt('phoneNum', user.phoneNum!);
      userData.setString('address', user.address!);
      userData.setBool('gender', user.gender!);
      userData.setString('image', user.image!);
      //userData.setString('fullName', respons.data['1']);

      dio.close();
      return true;
    } catch (e) {
      dio.close();
      return false;
    }
  }
}
