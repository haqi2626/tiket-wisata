import 'package:flutter/material.dart';
import 'package:tiket_wisata/widgets/custom_text.dart';
import 'package:tiket_wisata/widgets/custom_button.dart';
import 'package:tiket_wisata/widgets/custom_textfield.dart';
import 'package:tiket_wisata/constants/colors.dart';
import 'package:tiket_wisata/utils/navigation_extension.dart'; // Import extension
import 'package:tiket_wisata/screens/home_screen.dart'; // Import HomeScreen

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 149, 15),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomText(
                text: "Login",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 20),
            
            CustomText(
              text: "Email",
              fontSize: 16,
              color: AppColors.text,
            ),
            const SizedBox(height: 5),
            CustomTextField(hintText: "Enter your email"),
            const SizedBox(height: 10),
            
            CustomText(
              text: "Password",
              fontSize: 16,
              color: AppColors.text,
            ),
            const SizedBox(height: 5),
            CustomTextField(hintText: "Enter your password", isPassword: true),
            const SizedBox(height: 20),
            
            Center(
              child: CustomButton(
                text: "Login",
                onPressed: () {
                  context.pushReplacementTo(const HomeScreen()); // ✅ Ganti ke HomeScreen
                },
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
