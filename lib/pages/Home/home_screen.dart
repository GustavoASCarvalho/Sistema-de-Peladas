import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpfut/services/auth_service.dart';
import 'package:vpfut/utils/constants.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    print('HomeScreen');

    var authServiceProvider = Provider.of<AuthService>(context, listen: false);

    var user = authServiceProvider.usuario;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryLightColor,
        //leading user name
        title: RichText(
          text: TextSpan(
            text: 'Bem-Vindo, ',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            children: <TextSpan>[
              TextSpan(
                text: authServiceProvider.logado ? user!.name : '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
            ),
            onPressed: () {
              authServiceProvider.logout();
            },
          ),
        ],
      ),
      body: Body(),
    );
  }
}
