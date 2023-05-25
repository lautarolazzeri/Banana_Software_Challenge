import 'package:app/constants/constants.dart';
import 'package:app/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  final securestorage = const FlutterSecureStorage();

  Future<String> getUserToken() async {
    return await securestorage.read(key: 'auth_token') ?? '';
  }

  // autenticar usuario con email y password. mediante el modelo UserModel
  Future<UserModel> userLogin(String email, String password) async {
    UserModel user = await _authUser(email, password);
    await securestorage.write(key: 'auth_token', value: user.token);
    return user;
  }

  // autenticar usuario con user y password
  Future<UserModel> _authUser(String userName, String password) async {
    try {
      final response = await dio.post(
        '$api/auth/login',
        data: {'username': userName, 'password': password},
      );
      final user = UserModel.fromJson(response.data);
      return user;
    } catch (e) {
      return UserModel.cleanUser;
    }
  }

  //verificar si el usuario ya esta autenticado mediante el token
  Future<String> isAuthenticated() async {
    return await securestorage.read(key: 'auth_token') ?? '';
  }
}
