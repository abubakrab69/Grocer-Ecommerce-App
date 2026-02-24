import 'package:ecommerceapp/widgets/info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Privacy Policy',
          style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .start,
          children: [
            SizedBox(height: 10),
            const InfoSection(
              title: 'Information we collect',
              content:
                  'we collect information that provide directly to us, including name , email address, shipping address',
            ),
            SizedBox(height: 10),
            const InfoSection(
              title: 'How we use your information',
              content:
                  'We use information that we collect to maintain and improve our services',
            ),
            SizedBox(height: 10),
            const InfoSection(
              title: 'Information sharing',
              content:
                  'we collect information that provide directly to us, including name , email address, shipping address',
            ),
            SizedBox(height: 10),
            const InfoSection(
              title: 'Data security',
              content:
                  'we collect information that provide directly to us, including name , email address, shipping address',
            ),
            SizedBox(height: 10),
            const InfoSection(
              title: 'Your rights',
              content:
                  'we collect information that provide directly to us, including name , email address, shipping address',
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
