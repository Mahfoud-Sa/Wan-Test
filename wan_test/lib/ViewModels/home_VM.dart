import 'dart:convert';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:wan_test/Modles/userModel.dart';
import 'package:wan_test/repositories/users/users_api.dart';

class HomeVM {
  Future<String> getAcount() async {
    SharedPreferences personShrpre = await SharedPreferences.getInstance();
    return personShrpre.get('email').toString();
  }

  Future<String> getFullName() async {
    SharedPreferences personShrpre = await SharedPreferences.getInstance();
    return personShrpre.get('fullName').toString();
  }
}
