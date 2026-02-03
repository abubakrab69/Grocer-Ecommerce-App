import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/widgets/cutom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final isdark = AppTheme.light.brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: .symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              SizedBox(height: 85),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: isdark ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Reset Password',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: isdark ? Colors.white : Colors.black,
                ),
              ),
              Text(
                'Enter your email to reset your password',
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(height: 30),
              CutomTextfield(
                hintText: 'Email',
                labelText: 'Email',
                isPassword: false,
                preficIcon: Icons.mail_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email address';
                  }
                  if (!value.contains('@')) {
                    return 'Invalid email address';
                  }
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Get.snackbar(
                    'Sent Link',
                    'Check your email',
                    colorText: Colors.white,
                    backgroundColor: Colors.green,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    color: AppTheme.light.primaryColor,
                    borderRadius: .circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'Send Reset Link',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
