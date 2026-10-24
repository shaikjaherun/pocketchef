import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const PocketChefApp());
}

class PocketChefApp extends StatelessWidget {
  const PocketChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PocketChef',

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFBF5),
        fontFamily: 'Roboto',

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF8A00),
        ),
      ),

      home: const SplashScreen(),
    );
  }
}