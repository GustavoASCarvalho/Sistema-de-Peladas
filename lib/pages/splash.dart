import 'package:flutter/material.dart';
import 'package:vpfut/pages/auth.dart';

class Splash extends StatelessWidget {
  static const routeName = '/splash';

  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context);

    return const Auth();
  }
}
