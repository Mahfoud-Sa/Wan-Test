import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:wan_test/Modles/userModel.dart';
import 'package:wan_test/repositories/users/users_api.dart';

class signinVM {
  Dio dio = Dio();

  Future<bool> checkInternet() {
    //return Future(() => false);
    return InternetConnectionChecker().hasConnection;
  }

  Future<bool> signIN(UserModel user) async {
    try {
      usersAPI().create(user);
      dio.close();
      return true;
    } catch (e) {
      dio.close();
      return false;
    }
  }
}
