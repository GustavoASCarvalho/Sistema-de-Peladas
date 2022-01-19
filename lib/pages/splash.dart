import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpfut/pages/Home/home_screen.dart';
import 'package:vpfut/pages/Welcome/welcome_screen.dart';
import 'package:vpfut/services/auth_service.dart';

class Splash extends StatelessWidget {
  static const routeName = '/splash';

  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    print('Splash');
    print(authService.logado);
    return authService.logado ? const HomeScreen() : const WelcomeScreen();
  }
}
