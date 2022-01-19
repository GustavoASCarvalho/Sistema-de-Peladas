import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('signUpScreen');
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            opacity: 0.2,
          ),
        ),
        child: const SingleChildScrollView(
          child: Body(),
        ),
      ),
    );
  }
}
