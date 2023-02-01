import 'package:flutter/material.dart';
import 'package:onboarding/src/features/onboarding/views/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingPage(),
    );
  }
}
