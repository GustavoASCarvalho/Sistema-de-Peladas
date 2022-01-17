import 'package:flutter/material.dart';

import 'home.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: size.width * 0.5,
            ),
            SizedBox(height: size.height * 0.07),
            const Home(),
          ],
        ),
      ),
    );
  }
}
