import 'package:ecommerceapp/controllers/auth_controller.dart';
import 'package:ecommerceapp/utils/app_teststyle.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/view/mainscreen.dart';
import 'package:ecommerceapp/view/signinscreen.dart';
import 'package:ecommerceapp/view/widgets/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2500), () {
      if (authController.isFirstTime) {
        Get.to(OnboardingScreen());
      } else if (authController.isLoggesIn) {
        Get.to(Mainscreen());
      } else {
        Get.to(Signinscreen());
      }
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.light.primaryColor,
              const Color.fromARGB(255, 190, 246, 125),
            ],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Container(
                padding: .all(70),
                margin: EdgeInsets.only(bottom: 100),
                child: Image.asset('assets/images/app_logo.png'),
              ),
              Positioned.fill(
                top: 280,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'GROCER',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 30,
                          letterSpacing: 11,
                        ),
                      ),
                      Text(
                        'STORE',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          letterSpacing: 8,
                        ),
                      ),

                      Text(
                        'Style meets simpicity',
                        style: GoogleFonts.poppins(
                          color: Colors.white,

                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                    ],
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
