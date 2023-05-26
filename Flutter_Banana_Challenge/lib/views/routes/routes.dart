import 'package:app/views/screens/screens.dart';
import 'package:flutter/material.dart';

//all routes are exported here for easy access from main.dart

Map<String, Widget Function(BuildContext)> routes = {
  'login': (BuildContext context) => const LoginPage(),
  'product-info': (BuildContext context) => ProductInfo(),
  'home': (BuildContext context) => const HomeScreen(),
};
