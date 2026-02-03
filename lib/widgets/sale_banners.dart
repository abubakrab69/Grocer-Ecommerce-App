import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaleBanners extends StatelessWidget {
  const SaleBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(15),
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
                'upto 50%',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: .all(10),
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
