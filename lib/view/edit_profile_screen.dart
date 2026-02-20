import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Icon(Icons.arrow_back_ios_new_sharp),
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(child: Column(children: [
            
          ],
        )),
    );
  }
}
