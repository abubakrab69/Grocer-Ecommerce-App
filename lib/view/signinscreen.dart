import 'package:ecommerceapp/controllers/auth_controller.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/view/forget_password.dart';
import 'package:ecommerceapp/view/mainscreen.dart';
import 'package:ecommerceapp/view/signup_screen.dart';
import 'package:ecommerceapp/widgets/cutom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;

    void handleSigninBtn() {
      final AuthController authController = Get.find<AuthController>();
      authController.login();
      Get.off(() => const Mainscreen());
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: .symmetric(horizontal: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  'assets/images/login_cartoon.png',
                  width: double.infinity,
                ),
              ),
              Text(
                'Welcome Back',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: isdark ? Colors.white : Colors.black,
                ),
              ),
              Text(
                'Signin to continiue shopping',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              CutomTextfield(
                hintText: 'Enter Your Email',
                labelText: 'Email',
                isPassword: false,
                preficIcon: Icons.mail_outline_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 17),
              CutomTextfield(
                hintText: 'Enter your Password',
                labelText: 'Password',
                isPassword: true,
                preficIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: .end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(ForgetPassword());
                    },
                    child: Text(
                      'Forget Password?',
                      textAlign: TextAlign.end,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  handleSigninBtn();
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
                      'Signin',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: isdark ? Colors.white : Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignupScreen());
                    },
                    child: Text(
                      'Signup',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
