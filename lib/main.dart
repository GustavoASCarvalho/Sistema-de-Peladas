import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpfut/utils/constants.dart';

import 'pages/SignIn/signin_screen.dart';
import 'pages/Welcome/welcome_screen.dart';
import 'pages/splash.dart';
import 'pages/Home/home_screen.dart';
import 'pages/SignUp/signup_screen.dart';
import 'pages/MarkSoccer/mark_soccer_screen.dart';
import 'pages/SoccerFieldRegister/soccer_field_register_screen.dart';

import 'package:vpfut/repository/user_repository.dart';
import 'package:vpfut/services/auth_service.dart';

import 'utils/constants.dart';

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
        ChangeNotifierProxyProvider<AuthService, UserRepository>(
          create: (ctx) => UserRepository(
            Provider.of<AuthService>(ctx, listen: false),
          ),
          update: (ctx, authService, anterior) => UserRepository(authService),
        ),
      ],
      builder: (ctx, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Vp Fut',
          initialRoute: Splash.routeName,
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kPrimaryLightColor,
          ),
          routes: {
            Splash.routeName: (ctx) => const Splash(),
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
            SignInScreen.routeName: (ctx) => const SignInScreen(),
            SignUpScreen.routeName: (ctx) => const SignUpScreen(),
            MarkSoccerScrenn.routeName: (ctx) => const MarkSoccerScrenn(),
            SoccerFieldRegisterScreen.routeName: (ctx) =>
                const SoccerFieldRegisterScreen(),
          },
        );
      },
    );
  }
}
