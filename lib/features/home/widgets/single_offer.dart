import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleOffer extends StatelessWidget {
  const SingleOffer({
    super.key,
    required this.boldText,
    required this.image,
    required this.descrip,
    required this.gradient,
  });
  final String image;
  final String boldText;
  final String descrip;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.only(
          left: 05,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: gradient,
        ),
        width: 230,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 05),
                  child: Text(
                    boldText,
                    softWrap: true,
                    style: GoogleFonts.signikaNegative(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                SizedBox(
                  width: 110,
                  child: Text(
                    descrip,
                    softWrap: true,
                    style: GoogleFonts.signikaNegative(
                      color: Color(0xFFF5F5F5),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 20,
                  width: 100,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    child: Text(
                      "Shop Now",
                      style: GoogleFonts.signikaNegative(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 115,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
