import 'package:ecommerceapp/repository/notification_repository.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/utils/notification_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  NotificationRepository repository = NotificationRepository();

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    final notification = repository.getNotifications();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyActions: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Mark all as read',
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: isdark
                    ? AppTheme.light.primaryColor
                    : AppTheme.light.primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: .all(7),
        itemCount: NotificationRepository().getNotifications().length,
        itemBuilder: (context, index) => buildNotificationCard(context, index),
      ),
    );
  }

  Widget buildNotificationCard(BuildContext context, int index) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    final notification = repository.getNotifications();
    return Container(
      margin: .symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: isdark ? Colors.grey[900] : Colors.grey[100],
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: isdark ? Colors.grey[700]! : Colors.grey[200]!,
            spreadRadius: 0.3,
            blurRadius: 0.5,
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          NotificationUtils.getNotificationIcon(notification[index].type),
        ),
      ),
    );
  }
}
