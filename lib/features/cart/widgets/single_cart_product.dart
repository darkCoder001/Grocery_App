import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/features/cart/services/cart_services.dart';
import 'package:grocery_app/features/product_details/services/product_services.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class SingleCartProduct extends StatefulWidget {
  const SingleCartProduct({super.key, required this.index});
  final int index;

  @override
  State<SingleCartProduct> createState() => _SingleCartProductState();
}

class _SingleCartProductState extends State<SingleCartProduct> {
  final ProductDetailServices pds = ProductDetailServices();
  final CartServices cs = CartServices();

  void increaseQuantity(Product product) {
    pds.addToCart(
      context: context,
      product: product,
    );
  }

  void decreaseQuantity(Product product) {
    cs.removefromCart(
      context: context,
      product: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userCart = context.watch<UserProvider>().user.cart[widget.index];
    var user = Product.fromMap(userCart['product']);
    final quantity = userCart['quantity'];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            height: double.infinity,
            width: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                user.images[0],
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        user.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.signikaNegative(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '₹${user.price.toString()}',
                            style: GoogleFonts.signikaNegative(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[800],
                            ),
                          ),
                          Text("Quantity: ${quantity.toString()}")
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => increaseQuantity(user),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: GlobalVariables.selectedNavBarColor,
                        child: Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(quantity.toString()),
                    InkWell(
                      onTap: () => decreaseQuantity(user),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: GlobalVariables.selectedNavBarColor,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
