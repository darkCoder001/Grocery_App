import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/constants/global_variables.dart';
import 'package:grocery_app/features/account/widgets/account_button.dart';
import 'package:grocery_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final user = Provider.of<UserProvider>(context).user.name;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        title: Row(
          children: [
            Text(
              "Hello, $user",
              style: GoogleFonts.signikaNegative(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AccountButtons(text: "Your Account", onTap: () {}),
                const SizedBox(
                  width: 25,
                ),
                AccountButtons(text: "Your Orders", onTap: () {}),
                const SizedBox(
                  width: 25,
                ),
                AccountButtons(text: "Rewards", onTap: () {}),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AccountButtons(text: "Reach us", onTap: () {}),
                const SizedBox(
                  width: 25,
                ),
                AccountButtons(text: "Rate us", onTap: () {}),
                const SizedBox(
                  width: 25,
                ),
                AccountButtons(text: "Help", onTap: () {}),
              ],
            ),
            Container(
              height: height - 400,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.expand(width: 500, height: 50),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    alignment: Alignment.center),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
