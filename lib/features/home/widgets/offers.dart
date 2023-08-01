import 'package:flutter/material.dart';
import 'package:grocery_app/constants/global_variables.dart';
import 'package:grocery_app/features/home/widgets/single_offer.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    List boldText = [
      "Up to 10% off",
      "Up to 5% off",
      "Up to 20% off",
      "Up to 25% off",
    ];
    List image = [
      'assets/images/dairy.jpg',
      'assets/images/bread.jpg',
      'assets/images/egg.jpeg',
      'assets/images/daily.jpeg',
    ];
    return Container(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: boldText.length,
        itemBuilder: (context, index) {
          return SingleOffer(
            boldText: boldText[index],
            image: image[index],
            descrip: "Enjoy our big offers every day!",
            gradient: index % 2 == 0
                ? GlobalVariables.OffersGradient
                : GlobalVariables.OffersGradient1,
          );
        },
      ),
    );
  }
}
