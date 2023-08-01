import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final Icon icon;
  final void Function(String)? onFieldSubmitted;
  const Search({
    Key? key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.maxLines = 1,
    required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      style: GoogleFonts.signikaNegative(
        color: Colors.black38,
      ),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        label: Text(
          hintText,
          style: GoogleFonts.signikaNegative(
            fontSize: 18,
          ),
        ),
        border: InputBorder.none,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: icon,
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => controller.clear(),
        ),
      ),
      maxLines: maxLines,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
    );
  }
}
