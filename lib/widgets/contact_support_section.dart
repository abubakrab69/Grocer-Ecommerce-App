import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSupportSection extends StatelessWidget {
  const ContactSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;

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
          Icon(
            Icons.headset_mic_outlined,
            size: 45,
            color: AppTheme.light.primaryColor,
          ),
          SizedBox(height: 10),
          Text(
            'Still need help?',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Contact our support team',
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: .symmetric(horizontal: 44, vertical: 15),
              padding: .all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.light.primaryColor,
                borderRadius: .circular(50),
              ),
              child: Center(
                child: Text(
                  'Contact support',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
