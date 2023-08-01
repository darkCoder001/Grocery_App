import 'package:flutter/material.dart';
import 'package:grocery_app/constants/global_variables.dart';

class AccountTextButton extends StatelessWidget {
  const AccountTextButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed});
  final Icon icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Expanded(
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(Colors.black),
              backgroundColor:
                  MaterialStatePropertyAll(GlobalVariables.backgroundColor),
            ),
          ),
        )
      ],
    );
  }
}
