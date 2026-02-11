import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          'Account',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: isdark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
                border: BoxBorder.all(
                  width: 1,
                  color: isdark ? Colors.white : Colors.black,
                ),
                borderRadius: .circular(9),
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(
                  'Edit Profile',
                  style: GoogleFonts.poppins(
                    color: isdark ? Colors.white : Colors.black,
                  ),
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
      {'icon': Icons.shopping_bag, 'title': 'My orders'},
      {'icon': Icons.location_on, 'title': 'Shopping Address'},
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
              color: isdark
                  ? AppTheme.light.primaryColor
                  : AppTheme.light.primaryColor,
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
                // navigate to logout screen
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
}
