import 'package:e_commerce_ui/SCreens/login_screen.dart';
import 'package:e_commerce_ui/SCreens/navigation_screen.dart';
import 'package:e_commerce_ui/SCreens/onboarding_screen.dart';
import 'package:e_commerce_ui/SCreens/otp_verify_screen.dart';
import 'package:e_commerce_ui/SCreens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Commerce",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFEF6969),
      ),
      home: OnboardingScreen(),
    );
  }
}
