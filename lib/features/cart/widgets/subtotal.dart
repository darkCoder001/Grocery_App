import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/constants/global_variables.dart';
import 'package:grocery_app/features/address/screens/address_screen.dart';
import 'package:grocery_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Subtotal extends StatelessWidget {
  const Subtotal({super.key});

  void navigateToAddressPage(BuildContext context, int sum) {
    Navigator.pushNamed(context, AddressScreen.routeName, arguments: sum);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Subtotal:",
              style: GoogleFonts.signikaNegative(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 04,
            ),
            Text(
              "₹${sum.toString()}",
              style: GoogleFonts.signikaNegative(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        ConstrainedBox(
          constraints:
              BoxConstraints.expand(width: double.infinity, height: 50),
          child: TextButton(
              onPressed: () {
                navigateToAddressPage(context, sum);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    GlobalVariables.selectedNavBarColor,
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  alignment: Alignment.center),
              child: Text(
                "Proceed to Buy",
                style: GoogleFonts.signikaNegative(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),
        ),
      ],
    );
  }
}
