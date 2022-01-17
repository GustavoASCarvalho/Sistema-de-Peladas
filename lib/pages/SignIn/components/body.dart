import 'package:flutter/material.dart';
import 'package:vpfut/components/rounded_button.dart';

import 'rounded_input_field.dart';
import 'rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),
          Image.asset(
            "assets/images/logo.png",
            width: size.width * 0.6,
            height: size.width * 0.6,
          ),
          RoundedInputField(
            hintText: "Email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "Entrar",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
