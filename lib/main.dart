import 'package:flutter/material.dart';
import 'package:project_one/pages/cart_page.dart';
import 'package:project_one/pages/home_page.dart';
import 'package:project_one/pages/menu_page.dart';
import 'package:project_one/pages/sign_in_page.dart';
import 'package:project_one/pages/onboarding.dart';
import 'package:project_one/pages/sign_up_page.dart';
import 'package:project_one/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      routes: {
        '/signInPage': (context) => SignInPage(),
        '/signUpPage': (context) => SignUpPage(),
        '/homePage': (context) => HomePage(),
        '/menuPage': (context) => MenuPage(),
        '/cartPage': (context) => CartPage(),
      },
    );
  }
}
