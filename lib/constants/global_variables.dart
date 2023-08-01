import 'package:flutter/material.dart';

String uri = "http://<your_ip>";

class GlobalVariables {
  static const OffersGradient = LinearGradient(
    colors: [
      Color(0xFF888888),
      GlobalVariables.greyBg,
    ],
    stops: [0.5, 1.0],
  );

  static const OffersGradient1 = LinearGradient(
    colors: [
      Color(0xFF8e9e55),
      Color(0xFFFFD700),
    ],
    stops: [0.5, 1.0],
  );

  static const backgroundColor = Color(0xFFEBEBEB);
  static const greyBg = Color(0xFFC6C6C6);
  static const secondaryColor = Color(0xFFC321C0);
  static const selectedNavBarColor = Color(0xFF2ECC71);
  static const unSelectedBavBarColor = Color(0xFF818589);
}
