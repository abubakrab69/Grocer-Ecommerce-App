import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class SaleBanners extends StatelessWidget {
  const SaleBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 15, vertical: 9),
      margin: .symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppTheme.light.primaryColor,
        borderRadius: .circular(20),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Get your',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
              ),
              Text(
                'Special Sale',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'upto 40%',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Get.snackbar(
                'Implementation Error',
                'There is no implementation',
                borderRadius: 50,
              );
            },
            child: Container(
              padding: .symmetric(vertical: 10, horizontal: 16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .circular(30),
              ),
              child: Text(
                'Apply Now',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
