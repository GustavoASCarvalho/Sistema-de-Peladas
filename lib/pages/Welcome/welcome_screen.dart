import 'package:flutter/material.dart';

import 'components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    print('WelcomeScreen.build');
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            opacity: 0.2,
          ),
        ),
        child: const Body(),
      ),
    );
  }
}
