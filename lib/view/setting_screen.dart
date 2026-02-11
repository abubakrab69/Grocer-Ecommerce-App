import 'package:ecommerceapp/controllers/theme_controller.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/view/my_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSection(context, 'Appearence', [buildThemeToggle(context)]),
          ],
        ),
      ),
    );
  }

  Widget buildSection(BuildContext context, title, List<Widget> childern) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Padding(
          padding: .fromLTRB(24, 24, 24, 8),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 17,
              color: isdark ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildThemeToggle(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<ThemeController>(
      builder: (controller) => Container(
        margin: .all(7),
        padding: .all(5),
        decoration: BoxDecoration(
          color: isdark ? Colors.grey[200] : Colors.grey[900],
          borderRadius: .circular(50),
        ),
        child: ListTile(
          leading: Icon(
            isdark ? Icons.nightlight_round_sharp : Icons.light_mode_sharp,
            color: isdark ? Colors.white : Colors.yellow,
          ),
          title: Text(
            'Light Mode',
            style: GoogleFonts.poppins(
              fontSize: 17,
              color: isdark ? Colors.white : Colors.black,
            ),
          ),
          trailing: Switch.adaptive(
            value: controller.isDarkMode,
            onChanged: (value) => controller.toggleTheme(),
            activeColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
