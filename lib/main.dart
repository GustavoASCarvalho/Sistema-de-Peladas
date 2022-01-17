import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpfut/constants.dart';
import 'package:vpfut/pages/SignIn/signin_screen.dart';
import 'package:vpfut/pages/Welcome/welcome_screen.dart';

import 'package:vpfut/pages/splash.dart';
import 'package:vpfut/services/auth_service.dart';

import 'pages/SignUp/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
      ],
      builder: (ctx, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Vp Fut',
          initialRoute: WelcomeScreen.routeName,
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kPrimaryLightColor,
          ),
          routes: {
            Splash.routeName: (ctx) => const Splash(),
            WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
            SignInScreen.routeName: (ctx) => const SignInScreen(),
            SignUpScreen.routeName: (ctx) => const SignUpScreen(),
          },
        );
      },
    );
  }
}
