import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const BiciApp());
}

class BiciApp extends StatelessWidget {
  const BiciApp({super.key});

  @override
  Widget build(BuildContext context) {
    const verde = Color(0xFF2D6A4F);

    return MaterialApp(
      title: 'CicloNet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: verde,
          secondary: const Color(0xFFE76F51),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F5EF),
        appBarTheme: const AppBarTheme(
          backgroundColor: verde,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
