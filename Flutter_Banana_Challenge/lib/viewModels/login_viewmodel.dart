import 'package:app/models/user_model.dart';
import 'package:app/service/login_service.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginService loginService;

  LoginViewModel({required this.loginService});

  LoginViewModel.checkAuthStatus({required this.loginService}) {
    checkAuthStatus();
  }

  String appToken = '';
  UserModel _user = UserModel.cleanUser;
  UserModel get user => _user;
  bool get isUserLogged => appToken != '';

  Future<bool> login(String email, String password) async {
    //obtenemos el usuario mediante el email y password
    final user = await loginService.userLogin(email, password);
    //si el usuario es igual al usuario vacio, devolvemos false
    if (user == UserModel.cleanUser) return false;
    _user = user;
    notifyListeners();
    return true;
  }

  //verificar si el usuario ya esta autenticado mediante el token
  Future<void> checkAuthStatus() async {
    final tokenResponse = await loginService.isAuthenticated();
    appToken = tokenResponse;
    notifyListeners();
  }


  //logout
  Future<void> logout() async {
    await loginService.logout();
    _user = UserModel.cleanUser;
    appToken = '';
    notifyListeners();
  }


}
