import 'package:flutter/material.dart';
import 'package:tiket_wisata/constants/colors.dart';
import 'package:tiket_wisata/gen/assets.gen.dart';
import 'package:tiket_wisata/screens/home_screen.dart';
import 'package:tiket_wisata/screens/login_screen.dart';
import 'package:tiket_wisata/utils/navigation_extension.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Image.asset(
          Assets.images.logo.path,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
