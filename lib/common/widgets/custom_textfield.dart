import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final Icon icon;
  final bool obsecuretext;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.maxLines = 1,
    this.obsecuretext = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.signikaNegative(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        label: Text(
          hintText,
          style: GoogleFonts.signikaNegative(
            fontSize: 18,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 1),
        icon: icon,
      ),
      maxLines: maxLines,
      obscureText: obsecuretext,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
    );
  }
}
