import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';

class AppsBar extends StatelessWidget {
  const AppsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: GlobalVariables.greyBg,
          ),
        ),
      ),
    );
  }
}
