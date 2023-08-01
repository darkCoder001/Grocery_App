import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/constants/global_variables.dart';
import 'package:grocery_app/features/cart/widgets/single_cart_product.dart';
import 'package:grocery_app/features/cart/widgets/subtotal.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "My Cart",
                  style: GoogleFonts.signikaNegative(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 05),
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 25,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            user.cart.length == 0
                ? Expanded(
                    child: Center(
                      child: Text(
                        "No products added to the cart!",
                        style: GoogleFonts.signikaNegative(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: user.cart.length + 1,
                      itemBuilder: (context, index) {
                        return index == user.cart.length
                            ? const Subtotal()
                            : SingleCartProduct(index: index);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
