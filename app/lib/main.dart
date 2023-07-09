import 'package:app/screens/home/main_screen.dart';
import 'package:app/screens/signin_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SplashScreen(),
        "/sign-in": (context) => const SignInScreen(),
        "/sign-up": (context) => const SignUpScreen(),
        "/home": (context) => const MainScreen()
      },
    );
  }
}
