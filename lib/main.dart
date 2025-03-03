import 'package:flutter/material.dart';
import 'package:tiket_wisata/screens/splash_screen.dart';
import 'package:tiket_wisata/screens/login_screen.dart';
import 'package:tiket_wisata/screens/home_screen.dart';
import 'package:tiket_wisata/screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aplikasi mobile',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: const SplashScreen()
    );
  }
}
