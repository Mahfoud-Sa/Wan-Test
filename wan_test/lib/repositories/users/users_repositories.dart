import 'package:wan_test/Modles/userModel.dart';

abstract class UserRepository {
  Future<UserModel> put(UserModel user);
  Future<bool> create(UserModel user);
  Future<UserModel> get(String name, String password);
  Future<bool> delete(int id);
}
