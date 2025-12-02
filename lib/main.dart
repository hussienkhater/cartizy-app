import 'package:cartizy_app/feature/app_section/app_section.dart';
import 'package:cartizy_app/feature/auth/view/login_screen.dart';
import 'package:cartizy_app/feature/auth/view/register_screen.dart';
import 'package:cartizy_app/feature/onboarding/onboarding_screen.dart';

import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User App",
      initialRoute: AppSection.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        AppSection.routeName: (context) => const AppSection(),
      },
    );
  }
}
