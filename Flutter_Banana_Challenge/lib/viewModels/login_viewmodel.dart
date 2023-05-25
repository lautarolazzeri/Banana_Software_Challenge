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
    //call the service to login
    final user = await loginService.userLogin(email, password);
    //si el usuario es igual al usuario vacio, entonces no se logueo
    if (user == UserModel.cleanUser) return false;
    _user = user;
    notifyListeners();
    return true;
  }

  Future<void> checkAuthStatus() async {
    final tokenResponse = await loginService.isAuthenticated();
    appToken = tokenResponse;
    notifyListeners();
  }
}
