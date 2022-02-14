import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpfut/models/user.dart';
import 'package:vpfut/services/auth_service.dart';
import 'package:vpfut/utils/constants.dart';

import '../../repository/user_repository.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _init = true;
    var authServiceProvider = Provider.of<AuthService>(context, listen: false);

    @override
    void didChangeDependencies() async {
      if (_init) {
        await Provider.of<UserRepository>(context, listen: false).loadUsers();

        _init = false;

        authServiceProvider.setUser(
          await Provider.of<UserRepository>(context, listen: false)
              .searchByEmail(authServiceProvider.usuario!.email),
        );
      }
      _init = false;
      super.didChangeDependencies();
    }

    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        //leading user name
        title: RichText(
          text: TextSpan(
            text: 'Bem-Vindo, ',
            style: const TextStyle(
              color: kPrimaryLightColor,
              fontSize: 14,
            ),
            children: <TextSpan>[
              TextSpan(
                text: authServiceProvider.usuario!.email,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: kPrimaryLightColor),
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
