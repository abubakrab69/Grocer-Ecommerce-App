import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSupportSection extends StatelessWidget {
  const ContactSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: .all(10),
      padding: .all(24),
      decoration: BoxDecoration(
        color: AppTheme.light.primaryColor.withOpacity(.1),
        borderRadius: .circular(7),
      ),
      child: Column(
        children: [
          Icon(Icons.headset_mic_outlined, size: 25),
          SizedBox(height: 10),
          Text(
            'Still need help?',
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
