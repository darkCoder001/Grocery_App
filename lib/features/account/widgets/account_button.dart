import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/constants/global_variables.dart';

class AccountButtons extends StatelessWidget {
  const AccountButtons({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      child: Container(
        width: (11.534 * height) / 100,
        height: (11.534 * height) / 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: GlobalVariables.unSelectedBavBarColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            text,
            softWrap: true,
            style: GoogleFonts.signikaNegative(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
