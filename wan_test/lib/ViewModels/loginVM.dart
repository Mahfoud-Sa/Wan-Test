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

  Future<String> LogIn(String userName, String password) async {
    try {
      UserModel user = await UserModel(
          id: 0,
          name: 'admin',
          password: '770266408',
          address: 'Hadramout',
          email: 'binsabbah@',
          fullName: 'Mahfoud Bin sabbah',
          phoneNum: 770266408,
          gender: true,
          image: 'null',
          idNumCard: 234855437); //await usersAPI().get(userName, password);

      SharedPreferences userData = await SharedPreferences.getInstance();
      userData.setInt('id', user.id!);
      userData.setString('name', user.name!);
      userData.setString('password', user.password!);
      userData.setString('fullName', user.fullName!);
      userData.setInt('idNumCard', user.idNumCard!);
      userData.setString('email', user.email!);
      userData.setInt('phoneNum', user.phoneNum!);
      userData.setString('address', user.address!);
      userData.setBool('gender', user.gender!);
      userData.setString('image', user.image!);

      //dio.close();
      return 'اهلا وسهلا';
    } catch (e) {
      dio.close();
      return e.toString();
    }
  }
}
