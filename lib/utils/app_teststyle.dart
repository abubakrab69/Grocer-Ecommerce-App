import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTeststyle {
  final TextStyle h1 = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );
  final TextStyle h2 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );
  final TextStyle h3 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
  );

  //body

  final TextStyle bodyLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  final TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  final TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  //button

  final TextStyle buttonLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  final TextStyle buttonMadium = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  final TextStyle buttonSmall = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  //label

  final TextStyle labelLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  final TextStyle labelMedium = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  final TextStyle labelSmall = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withweight(TextStyle style, FontWeight fontweight) {
    return style.copyWith(fontWeight: fontweight);
  }
}
