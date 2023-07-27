import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:wan_test/Modles/userModel.dart';
import 'package:wan_test/repositories/users/users_repositories.dart';
import 'dart:convert';

class usersAPI extends UserRepository {
  String baseURL = 'http://192.168.1.122/';
  Dio dio = Dio();

  @override
  Future<UserModel> get(String name, String password) async {
    var respons;
    try {
      respons = await dio.post('${baseURL}usersApp/logIn.php',
          queryParameters: {'userName': name, 'password': password});
    } catch (e) {
      throw 'خطاء في الاتصال في السيرفر';
    }

    //print(respons.statusMessage);
    switch (respons.statusCode) {
      case HttpStatus.ok:
        {
          // statements;
          if (respons.data != 'null') {
            return UserModel.fromJson(jsonDecode(respons.data));
          } else {
            throw 'خطاء في اسم المستخدم او كلمة المرور';
          }
        }
      case HttpStatus.badRequest:
        {
          //statements;
          throw 'طلب خاطئ';
        }
      case HttpStatus.forbidden:
        {
          //statements;
          throw 'غير مصرح لك القيام بهذه العملية';
        }

      default:
        {
          //statements;
          throw 'خطاء غير متوقع';
        }
    }
  }

  @override
  Future<bool> create(UserModel user) async {
    var _queryParameters = UserModel().toJson(user);

    var respons;
    try {
      respons = await dio.post('${baseURL}usersApp/singin.php',
          queryParameters: _queryParameters);
      print(user.gender);
    } catch (e) {
      throw 'خطاء في الاتصال في السيرفر';
    }

    //print(_queryParameters);

    switch (respons.statusCode) {
      case HttpStatus.ok:
        {
          if (respons.data == '1') {
            return true;
          } else if (respons.data.contains('name')) {
            throw "اسم المستخدم موجود بالفعل";
          } else if (respons.data.contains('email')) {
            throw "عنوان البريد موجود بالفعل";
          } else {
            throw '${respons.data}';
          }
        }
      case HttpStatus.badRequest:
        {
          //statements;
          throw 'طلب خاطئ';
        }
      case HttpStatus.forbidden:
        {
          //statements;
          throw 'غير مصرح لك القيام بهذه العملية';
        }

      default:
        {
          //statements;
          throw 'خطاء غير متوقع';
        }
    }
  }

  @override
  Future<bool> delete(int id) async {
    var respons;
    try {
      respons = await dio.post('${baseURL}usersApp/delete.php',
          queryParameters: {'userId': id});
      return true;
    } catch (e) {
      throw 'خطاء بالاتصال بالسيرفر';
    }
  }

  @override
  Future<UserModel> put(int id, UserModel user) async {
    Map<String, dynamic> userParameters = UserModel().toJson(user)
      ..addAll({'userID': id});
    var respons;
    try {
      respons = await dio.post('${baseURL}usersApp/update.php',
          queryParameters: userParameters);

      return user;
    } catch (e) {
      throw 'خطاء بالاتصال بالسيرفر';
    }
  }
}
