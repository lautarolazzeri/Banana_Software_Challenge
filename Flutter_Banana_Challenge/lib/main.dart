import 'package:app/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/constants/constants.dart';
import 'package:app/views/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banana Challenge Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: appColor,
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: routes,
    );
  }
}
