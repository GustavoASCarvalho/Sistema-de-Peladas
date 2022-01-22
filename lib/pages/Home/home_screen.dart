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
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        //leading user name
        title: RichText(
          text: TextSpan(
            text: 'Bem-Vindo, Erick Pinheiro',
            style: const TextStyle(
              color: kPrimaryLightColor,
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
              color: kPrimaryLightColor,
            ),
            onPressed: () {
              authServiceProvider.logout();
            },
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
