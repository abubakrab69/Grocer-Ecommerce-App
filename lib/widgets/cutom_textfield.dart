import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CutomTextfield extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final bool isPassword;
  final IconData? preficIcon;
  final TextInputType keyboardType;
  final void Function(String)? onchange;
  final String? Function(String?) validator;

  const CutomTextfield({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.isPassword,
    required this.preficIcon,
    this.onchange,
    this.controller,
    required this.validator,
    required this.keyboardType,
  });

  @override
  State<CutomTextfield> createState() => _CutomTextfieldState();
}

class _CutomTextfieldState extends State<CutomTextfield> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ?? _obsecureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onchange,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        labelText: widget.labelText,
        labelStyle: GoogleFonts.poppins(fontSize: 15),
        prefixIcon: Icon(
          widget.preficIcon,
          color: isdark ? Colors.grey : Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(13),
          borderSide: BorderSide(
            width: 1.5,
            color: isdark
                ? Colors.grey
                : const Color.fromARGB(255, 216, 216, 216),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(13),
          borderSide: BorderSide(width: 2, color: AppTheme.light.primaryColor),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obsecureText = !_obsecureText;
                  });
                },
                icon: Icon(Icons.visibility_off_rounded),
              )
            : null,
      ),
    );
  }
}
