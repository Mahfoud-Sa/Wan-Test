import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:wan_test/Modles/userModel.dart';
import 'package:wan_test/repositories/users/users_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalDetailesVM {
  Dio dio = Dio();

  Future<String> deleteMyAccount(String passwordConfirm) async {
    try {
      SharedPreferences shrPre = await SharedPreferences.getInstance();
      if (passwordConfirm == shrPre.getString('password')) {
        await usersAPI().delete(shrPre.getInt('id')!);

        return 'تم حذف حسابك بنجاح';
      } else {
        return 'كلمة المرور خطاء';
      }
    } catch (e) {
      return "فشل في حذف حسابك";
    }
  }

  Future<UserModel> getCurrentUser() async {
    SharedPreferences shrPre = await SharedPreferences.getInstance();
    return UserModel(
        id: shrPre.getInt('id'),
        name: shrPre.getString('name'),
        password: shrPre.getString('password'),
        fullName: shrPre.getString('fullName'),
        idNumCard: shrPre.getInt('idNumCard'),
        email: shrPre.getString('email'),
        phoneNum: shrPre.getInt('phoneNum'),
        gender: shrPre.getInt('gender'),
        image: shrPre.getString('image'),
        address: shrPre.getString('address'));
  }
}
