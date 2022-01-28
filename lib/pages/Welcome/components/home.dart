import 'package:flutter/material.dart';
import 'package:vpfut/components/rounded_button.dart';
import 'package:vpfut/components/rounded_outline_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        RoundedButton(
          text: 'Entrar',
          onPressed: () {
            // SchedulerBinding.instance?.addPostFrameCallback((_) {
            Navigator.pushNamed(context, '/signin');
            // });
          },
        ),
        RoundedOutlineButton(
          text: 'Cadastrar',
          onPressed: () {
            // SchedulerBinding.instance?.addPostFrameCallback((_) {
            Navigator.pushNamed(context, '/signup');
            // });
          },
        ),
      ],
    );
  }
}
