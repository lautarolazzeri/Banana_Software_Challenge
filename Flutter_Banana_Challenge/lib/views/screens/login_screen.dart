import 'package:app/constants/constants.dart';
import 'package:app/viewModels/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void handleLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final loginViewModel = context.read<LoginViewModel>();
      final login = await loginViewModel.login(
        userController.text.trim(),
        passwordController.text.trim(),
      );
      if (!login && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario o contraseña incorrectos'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 48),
                  Image.asset(
                    'assets/banana-logo.png',
                    height: 100,
                  ),
                  const SizedBox(height: 48),
                  Text('Bienvenido'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: appColor,
                      )),
                  const SizedBox(height: 24),
                  const Text(
                    'Inicia sesión para continuar',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  LoginInput(
                    textEditingController: userController,
                    hintText: 'Usuario',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 16),
                  LoginInput(
                    textEditingController: passwordController,
                    hintText: 'Contraseña',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.visibility_off_outlined),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      handleLogin(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Ingresar', style: TextStyle(color: white)),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

