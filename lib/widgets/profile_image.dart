import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Stack(
        children: [
          Container(
            width: 115,
            height: 115,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: AppTheme.light.primaryColor),
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?semt=ais_hybrid&w=740&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: InkWell(
              onTap: () {
                _showCameraPickerBottomSheet(context, isdark);
              },
              child: Container(
                padding: .all(9),
                decoration: BoxDecoration(
                  color: AppTheme.light.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCameraPickerBottomSheet(BuildContext context, bool isdark) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: isdark ? Colors.grey[900] : Colors.grey[200],
          borderRadius: .circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'Change your profile',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              _buildOptionTile(
                context,
                Icons.camera_alt_outlined,
                'Take a photo',
                () {
                  Get.back();
                },
                isdark,
                Icons.arrow_forward_ios_rounded,
              ),
              _buildOptionTile(
                context,
                Icons.camera_alt_outlined,
                'Choose from gallery',
                () {
                  Get.back();
                },
                isdark,
                Icons.arrow_forward_ios_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile(
    BuildContext context,
    IconData Icons,
    String title,
    VoidCallback onTap,
    bool isdark,
    IconData iconArrow,
  ) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Icon(Icons),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              color: isdark ? Colors.grey[200] : Colors.grey[900],
            ),
          ),
          trailing: Icon(iconArrow, color: AppTheme.light.primaryColor),
        ),
      ],
    );
  }
}
