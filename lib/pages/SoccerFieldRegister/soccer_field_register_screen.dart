import 'package:flutter/material.dart';
import 'package:vpfut/utils/constants.dart';

import 'components/body.dart';

class SoccerFieldRegisterScreen extends StatelessWidget {
  const SoccerFieldRegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/soccerFieldRegister';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('soccerFieldRegisterScreen');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor.withOpacity(0.5),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // texto no centro do appBar
        title: const Text(
          'Cadastro de quadra',
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
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
