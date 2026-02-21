import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/widgets/cutom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.light.cardColor,
              borderRadius: .circular(12),
            ),
            child: CutomTextfield(
              initialValue: 'Alex Jognson',
              hintText: 'Full Name',
              labelText: 'Full Name',
              isPassword: false,
              preficIcon: Icons.person,
              validator: (value) {},
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.light.cardColor,
              borderRadius: .circular(12),
            ),
            child: CutomTextfield(
              initialValue: 'user@gmail.com',
              hintText: 'Email',
              labelText: 'Email',
              isPassword: false,
              preficIcon: Icons.mail_outline_outlined,
              validator: (value) {},
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.light.cardColor,
              borderRadius: .circular(12),
            ),
            child: CutomTextfield(
              initialValue: '4536788668',
              hintText: 'Phone',
              labelText: 'Phone',
              isPassword: false,
              preficIcon: Icons.phone,
              validator: (value) {},
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 22),
          InkWell(
            onTap: () {},
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: AppTheme.light.primaryColor,
                borderRadius: .circular(55),
              ),
              child: Center(
                child: Text(
                  'Save Changes',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
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
