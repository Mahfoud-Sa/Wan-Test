import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:wan_test/Modles/userModel.dart';
import 'package:wan_test/repositories/users/users_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalDetailesEditVM {
  Dio dio = Dio();

  Future<String> edit(UserModel usr) async {
    SharedPreferences shrPre = await SharedPreferences.getInstance();
    try {
      UserModel user = await usersAPI().put(shrPre.getInt('id')!, usr);

      setCurrentUserDetailes(usr);

      return 'تم تعديل بياناتك بنجاح';
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> setCurrentUserDetailes(UserModel user) async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    //userData.setInt('id', user.id!);
    userData.setString('name', user.name!);
    userData.setString('password', user.password!);
    userData.setString('fullName', user.fullName!);
    userData.setInt('idNumCard', user.idNumCard!);
    userData.setString('email', user.email!);
    userData.setInt('phoneNum', user.phoneNum!);
    userData.setString('address', user.address!);
    userData.setInt('gender', user.gender!);
    userData.setString('image', user.image!);
  }
}
