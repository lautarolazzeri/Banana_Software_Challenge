import 'package:app/service/login_service.dart';
import 'package:app/viewModels/login_viewmodel.dart';
import 'package:app/viewModels/products_viewmodel.dart';
import 'package:app/views/routes/routes.dart';
import 'package:app/views/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:app/constants/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loginService = LoginService();
    return MultiProvider(
        //set all the providers
        providers: [
          ChangeNotifierProvider<ProductViewModel>(create: (context) => ProductViewModel()),
          ChangeNotifierProvider<LoginViewModel>(
            create: (context) => LoginViewModel(loginService: loginService),
          )
        ],
        child: MaterialApp(
      title: 'Banana Challenge Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: appColor,
        ),
        useMaterial3: true,
      ),
          home: Consumer<LoginViewModel>(
            builder: (context, loginViewModel, child) {
              loginViewModel.checkAuthStatus();

              if (loginViewModel.appToken == '') {
                return const LoginPage();
              }
              return const HomeScreen();
            },
          ),
      routes: routes,
        ));
  }
}
