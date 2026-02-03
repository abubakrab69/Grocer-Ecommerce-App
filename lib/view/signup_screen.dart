import 'package:ecommerceapp/controllers/auth_controller.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/view/mainscreen.dart';
import 'package:ecommerceapp/view/signinscreen.dart';
import 'package:ecommerceapp/widgets/cutom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final isdark = AppTheme.light.brightness == Brightness.dark;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void handleSignupBtn() {
    AuthController authController = Get.find<AuthController>();
    authController.login();
    Get.to(() => const Mainscreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: .symmetric(horizontal: 20),
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
                'Create Account',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: isdark ? Colors.white : Colors.black,
                ),
              ),
              Text(
                'Signup to get started',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: isdark ? Colors.grey : Colors.grey,
                ),
              ),
              SizedBox(height: 17),
              CutomTextfield(
                hintText: 'Enter your Name',
                labelText: 'Name',
                isPassword: false,
                preficIcon: Icons.person,
                keyboardType: TextInputType.name,
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 17),
              CutomTextfield(
                hintText: 'Enter your Email',
                labelText: 'Email',
                isPassword: false,
                preficIcon: Icons.mail_outline_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  if (!value.contains("@")) {
                    return 'Invalid email address';
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
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Password';
                  }
                  return null;
                },
              ),

              SizedBox(height: 17),
              CutomTextfield(
                hintText: 'Confirm Password',
                labelText: 'Confirm Password',
                isPassword: true,
                preficIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Confirm Password';
                  }
                  if (value != passwordController.text) {
                    return 'password do not match';
                  }
                  return null;
                },
              ),

              SizedBox(height: 35),

              InkWell(
                onTap: () {
                  handleSignupBtn();
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
                      'Signup',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: isdark ? Colors.white : Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(Signinscreen());
                    },
                    child: Text(
                      'Signin',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
