import 'package:app/constants/constants.dart';
import 'package:app/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  final securestorage = const FlutterSecureStorage();

  //obtener el token del usuario
  Future<String> getUserToken() async {
    return await securestorage.read(key: 'auth_token') ?? '';
  }

  // autenticar usuario con userName y password
  Future<UserModel> _authUser(String userName, String password) async {
    try {
      //call api with user data
      final response = await dio.post(
        '$api/auth/login',
        data: {'username': userName, 'password': password},
      );
      //convert response to UserModel
      final user = UserModel.fromJson(response.data);
      return user;
    } catch (e) {
      return UserModel.cleanUser;
    }
  }

  // autenticar usuario con email y password. mediante el modelo UserModel
  Future<UserModel> userLogin(String email, String password) async {
    //obtenemos usuario autenticado mediante email y password
    UserModel user = await _authUser(email, password);
    await securestorage.write(key: 'auth_token', value: user.token);
    return user;
  }


  //verificar si el usuario ya esta autenticado mediante el token
  Future<String> isAuthenticated() async {
    return await securestorage.read(key: 'auth_token') ?? '';
  }


  //logout
  Future<void> logout() async {
    await securestorage.delete(key: 'auth_token');
  }

}
