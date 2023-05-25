import 'package:app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/widgets.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 48.0),
                Image.asset(
                  'assets/banana-logo.png',
                  height: 100.0,
                ),
                const SizedBox(height: 48.0),
                const Text('Bienvenido!',
                    style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: appColor)),
                const SizedBox(height: 24.0),
                LoginInput(
                  textEditingController: userController,
                  hintText: 'Usuario',
                  prefixIcon: const Icon(Icons.person),
                ),
                const SizedBox(height: 16.0),
                LoginInput(
                  textEditingController: passwordController,
                  hintText: 'Contraseña',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility_off_outlined),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Ingresar', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

