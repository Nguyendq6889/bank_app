import 'package:bank_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'screens/my_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Mulish',
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}