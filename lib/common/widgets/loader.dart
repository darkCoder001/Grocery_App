import 'package:flutter/material.dart';
import 'package:grocery_app/constants/global_variables.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: GlobalVariables.unSelectedBavBarColor,
        strokeWidth: 05,
      ),
    );
  }
}
