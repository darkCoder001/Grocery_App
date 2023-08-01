import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/common/widgets/loader.dart';
import 'package:grocery_app/features/search/services/search_services.dart';

import '../../../constants/global_variables.dart';
import '../../../models/product.dart';
import '../../admin/widgets/single_product.dart';
import '../../product_details/screens/product_details.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({
    super.key,
    required this.searchQuery,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSearchedProducts();
  }

  fetchSearchedProducts() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  void navigateToProductDetails(BuildContext context, Product product) {
    Navigator.pushNamed(
      context,
      ProductDetailsScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
            leading: const BackButton(
              color: GlobalVariables.unSelectedBavBarColor,
            ),
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: GlobalVariables.backgroundColor,
              ),
            ),
            title: Center(
              child: Text(
                "Searches for \"${widget.searchQuery}\"",
                style: GoogleFonts.signikaNegative(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromARGB(255, 80, 78, 78),
                ),
              ),
            )),
      ),
      body: products == null
          ? const Loader()
          : GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final productData = products![index];
                return InkWell(
                  onTap: () {
                    navigateToProductDetails(context, productData);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 08, vertical: 05),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 140,
                          child: SingleProduct(image: productData.images[0]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Text(
                                  productData.name,
                                  style:
                                      GoogleFonts.signikaNegative(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                '₹${productData.price.toString()}',
                                style: GoogleFonts.signikaNegative(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
