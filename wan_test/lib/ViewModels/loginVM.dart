import 'dart:convert';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:wan_test/Modles/userModel.dart';
import 'package:wan_test/repositories/users/users_api.dart';

class LoginVM {
  Dio dio = Dio();
  bool password_visivility = true;

  Future<bool> checkInternet() {
    return InternetConnectionChecker().hasConnection;
  }

  void passwordVisivility() {
    password_visivility = !password_visivility;
  }

  Future<String> LogIn(String userName, String password) async {
    try {
      UserModel user = await usersAPI().get(userName, password);

      SharedPreferences userData = await SharedPreferences.getInstance();
      userData.setInt('id', user.id!);
      userData.setString('name', user.name!);
      userData.setString('password', user.password!);
      userData.setString('fullName', user.fullName!);
      userData.setInt('idNumCard', user.idNumCard!);
      userData.setString('email', user.email!);
      userData.setInt('phoneNum', user.phoneNum!);
      userData.setString('address', user.address!);
      userData.setInt('gender', user.gender!);
      userData.setString('image', user.image!);

      dio.close();
      return 'اهلا وسهلا';
    } catch (e) {
      dio.close();
      return e.toString();
    }
  }
}
