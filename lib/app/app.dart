import 'package:flutter/material.dart';
import 'package:welcome/feature/main_screen/presentation/main_screen.dart';

class WelcomeApp extends StatelessWidget {
  const WelcomeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
