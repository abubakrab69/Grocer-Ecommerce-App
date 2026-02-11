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
          style: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSection(context, 'Appearance', [buildThemeToggle(context)]),
            buildSection(context, 'Notification', [
              buildSwitchTile(
                context,
                'Push Notification',
                'Recieve push notification about orders and promotions',
                false,
              ),
              buildSwitchTile(
                context,
                'Email Notification',
                'Recieve Email notification and others',
                true,
              ),
            ]),
            buildSection(context, 'Privacy', [
              buildNavigationTile(
                context,
                'Privacy policy',
                'view our privacy policy',
                Icons.privacy_tip_outlined,
              ),
              buildNavigationTile(
                context,
                'Term of Services',
                'view our term of services',
                Icons.description_outlined,
              ),
            ]),
            buildSection(context, 'App version', [
              buildNavigationTile(context, 'App version', '1.0.0', Icons.info),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSection(BuildContext context, title, List<Widget> childern) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: .start,
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
        ...childern,
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
          color: isdark ? Colors.grey[900] : Colors.grey[200],
          borderRadius: .circular(50),
        ),
        child: ListTile(
          leading: Icon(
            isdark ? Icons.nightlight_round_sharp : Icons.light_mode_sharp,
            color: isdark
                ? Colors.white
                : const Color.fromARGB(255, 190, 124, 0),
          ),
          title: Text(
            isdark ? 'Light Mode' : 'Dark Mode',
            style: GoogleFonts.poppins(
              fontSize: 17,
              color: isdark ? Colors.white : Colors.black,
            ),
          ),
          trailing: Switch.adaptive(
            value: controller.isDarkMode,
            onChanged: (value) => controller.toggleTheme(),
            activeColor: Colors.blue,
            inactiveThumbColor: const Color.fromARGB(255, 190, 124, 0),
          ),
        ),
      ),
    );
  }

  Widget buildSwitchTile(
    BuildContext context,
    String title,
    String subtitle,
    bool initialView,
  ) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.all(6),
      padding: .all(6),
      decoration: BoxDecoration(
        borderRadius: .circular(10),
        color: isdark ? Colors.grey[900] : Colors.grey[200],
      ),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 17,
            color: isdark ? Colors.grey[200] : Colors.grey[800],
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: isdark ? Colors.grey[200] : Colors.grey[800],
          ),
        ),
        trailing: Switch.adaptive(
          value: initialView,
          onChanged: (value) => {},
          activeColor: Colors.blue,
          inactiveThumbColor: Colors.black,
        ),
      ),
    );
  }

  Widget buildNavigationTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
  ) {
    final isdark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: .all(6),
      decoration: BoxDecoration(
        color: isdark ? Colors.grey[900] : Colors.grey[200],
        borderRadius: .circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.red),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: isdark ? Colors.grey[200] : Colors.grey[800],
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: isdark ? Colors.grey[200] : Colors.grey[800],
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios_sharp, size: 16),
        onTap: () {},
      ),
    );
  }
}
