import 'dart:ui';

import 'package:ecommerceapp/controllers/auth_controller.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/view/setting_screen.dart';
import 'package:ecommerceapp/view/signinscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'My Account',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: isdark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(SettingScreen());
            },
            icon: Icon(
              CupertinoIcons.settings,
              color: isdark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildProfileSection(context),
            SizedBox(height: 5),
            buildMenuSection(context),
          ],
        ),
      ),
    );
  }

  //profile section
  Widget buildProfileSection(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: .symmetric(vertical: 40),
      width: double.infinity,

      decoration: BoxDecoration(
        color: isdark ? Colors.grey[900] : Colors.grey[200],
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?semt=ais_hybrid&w=740&q=80',
            ),
            radius: 40,
          ),
          SizedBox(height: 14),
          Text(
            'Alex Johnson',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: isdark ? Colors.white : Colors.grey[900],
            ),
          ),
          Text(
            'user@gmail.com',
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: isdark ? Colors.white : Colors.grey[900],
            ),
          ),
          SizedBox(height: 14),
          InkWell(
            onTap: () {},
            child: Container(
              padding: .all(10),
              width: 130,

              decoration: BoxDecoration(
                border: BoxBorder.all(width: 1.5, color: Colors.blue),
                borderRadius: .circular(9),
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(
                  'Edit Profile',
                  style: GoogleFonts.poppins(color: Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // menu section
  Widget buildMenuSection(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    final menuItems = [
      {'icon': Icons.shopping_bag_outlined, 'title': 'My orders'},
      {'icon': Icons.location_on_outlined, 'title': 'Shopping Address'},
      {'icon': Icons.help_outline, 'title': 'Help center'},
      {'icon': Icons.logout, 'title': 'Logout'},
    ];
    return Column(
      children: menuItems.map((item) {
        return Container(
          padding: .all(3),
          margin: .all(5),
          decoration: BoxDecoration(
            color: isdark ? Colors.grey[900] : Colors.grey[100],
            borderRadius: .circular(10),
          ),
          child: ListTile(
            leading: Icon(
              item['icon'] as IconData?,
              color: AppTheme.light.primaryColor,
            ),
            title: Text(
              item['title'] as String,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: isdark ? Colors.white : Colors.black,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppTheme.light.primaryColor,
            ),
            onTap: () {
              if (item['title'] == 'Logout') {
                showLogoutDialogue(context);
              } else if (item['title'] == 'My orders') {
                // navigate to m order screen
              } else if (item['title'] == 'Help center') {
                // navigate to help center
              } else if (item['title'] == 'Shopping Address') {
                // navigate to shopping screen
              }
            },
          ),
        );
      }).toList(),
    );
  }

  void showLogoutDialogue(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    AuthController authController = Get.put(AuthController());
    Get.dialog(
      barrierColor: Colors.black.withOpacity(0.5), // dim background
      barrierDismissible: true,
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // blur strength
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              decoration: BoxDecoration(
                color: isdark
                    ? Colors.white.withOpacity(0.08)
                    : Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.logout, color: Colors.red, size: 32),

                  const SizedBox(height: 12),

                  Text(
                    'Are you sure to logout?',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.blue, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            authController.logout();
                            Get.offAll(Signinscreen());
                            Get.snackbar(
                              'Logout Successfully',
                              colorText: Colors.green,
                              'logout successfully',

                              borderRadius: 50,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: BoxBorder.all(
                                width: 2,
                                color: isdark
                                    ? Colors.grey[800]!
                                    : Colors.grey[400]!,
                              ),
                              borderRadius: BorderRadius.circular(50),
                              color: isdark
                                  ? Colors.grey[800]
                                  : Colors.grey[400],
                            ),
                            child: Center(
                              child: Text(
                                'Logout',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
