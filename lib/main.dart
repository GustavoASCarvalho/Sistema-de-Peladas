import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vpfut/pages/splash.dart';
import 'package:vpfut/services/auth_service.dart';

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
          initialRoute: Splash.routeName,
          routes: {
            Splash.routeName: (ctx) => const Splash(),
          },
        );
      },
    );
  }
}
