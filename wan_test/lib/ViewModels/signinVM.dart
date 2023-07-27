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

  Future<String> signIN(UserModel user) async {
    try {
      await usersAPI().create(user);
      dio.close();
      return 'تم تسجيلك بنجاح';
    } catch (e) {
      dio.close();
      return e.toString();
    }
  }
}
