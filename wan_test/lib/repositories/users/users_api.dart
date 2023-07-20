import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:wan_test/Modles/userModel.dart';
import 'package:wan_test/repositories/users/users_repositories.dart';

class usersAPI extends UserRepository {
  Dio dio = Dio();

  @override
  Future<UserModel> get(String name, String password) async {
    var respons = await dio.post(
      'http://localhost/usersApp/logIn.php',
    );
    if (respons.statusCode == HttpStatus.ok) {
      if (respons.data != 'null') {
        return UserModel.fromJson(jsonDecode(respons.data));
      } else {
        throw Exception();
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<UserModel> put(UserModel user) {
    throw UnimplementedError();
  }

  @override
  Future<bool> create(UserModel user) async {
    var respons = await dio.post('https://wantest123.000webhostapp.com/',
        queryParameters: UserModel().toJson(user));
    //print(respons);
    if (respons.statusCode == HttpStatus.ok) {
      if (respons.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
