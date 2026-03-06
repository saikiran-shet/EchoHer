import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const SafetyApp());
}

class SafetyApp extends StatelessWidget {
  const SafetyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency Evidence Capsule',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}