import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpfut/pages/auth.dart';
import 'package:vpfut/pages/home.dart';
import 'package:vpfut/services/auth_service.dart';

class Splash extends StatelessWidget {
  static const routeName = '/splash';

  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return authService.logado ? const Home() : const Auth();
  }
}
