import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/common/widgets/loader.dart';
import 'package:grocery_app/features/home/services/home_services.dart';
import 'package:grocery_app/features/home/widgets/category_product.dart';
import 'package:grocery_app/features/home/widgets/offers.dart';
import 'package:grocery_app/features/home/widgets/search_bar.dart';
import 'package:grocery_app/constants/global_variables.dart';
import 'package:grocery_app/features/search/screens/search_screen.dart';
import 'package:grocery_app/models/product.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  final List<String> categories = ["Eggs", "Bakery", "Snacks", "Daily"];
  List list = [
    Icon(
      Icons.egg_sharp,
      color: Color(0xFFF0EAD6),
    ),
    Icon(
      Icons.bakery_dining,
      color: Colors.grey[800],
    ),
    Icon(
      Icons.bike_scooter,
      color: Colors.grey[800],
    ),
    Icon(
      Icons.accessibility_sharp,
      color: Colors.grey[800],
    ),
  ];

  final HomeServicer homeServicer = HomeServicer();
  List<Product>? productList;
  int _category = 0;
  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServicer.fetchCategoryProducts(
      context: context,
      category: categories[_category],
    );
    setState(() {});
  }

  void updateCategory(int cat) {
    setState(() {
      _category = cat;
      fetchCategoryProducts();
    });
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;

    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height - kBottomNavigationBarHeight,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4.86 * width / 100, vertical: 1.84 * height / 100),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 05),
                  child: Row(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.expand(
                            width: (76.6 * width) / 100,
                            height: 5.76 * height / 100),
                        child: Card(
                          elevation: 10,
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 05),
                              child: Search(
                                controller: _searchController,
                                icon: Icon(Icons.search),
                                hintText: "Search...",
                                onFieldSubmitted: navigateToSearchScreen,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        shadowColor: Colors.white,
                        color: GlobalVariables.selectedNavBarColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        child: IconButton(
                          onPressed: () {
                            navigateToSearchScreen(_searchController.text);
                          },
                          icon: Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style: GoogleFonts.signikaNegative(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 05),
                        child: OutlinedButton(
                          style: ButtonStyle(
                            shadowColor: MaterialStatePropertyAll(Colors.white),
                            elevation: MaterialStatePropertyAll(
                              index == _category ? 08 : 00,
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                                index == _category
                                    ? GlobalVariables.selectedNavBarColor
                                    : Colors.white),
                            // side: MaterialStatePropertyAll(
                            //     BorderSide(color: Colors.black)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          child: Row(
                            children: [
                              list[index],
                              const SizedBox(
                                width: 05,
                              ),
                              Text(
                                categories[index],
                                style: GoogleFonts.signikaNegative(
                                  color: index == _category
                                      ? Colors.white
                                      : Colors.grey[800],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            updateCategory(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5.5 * height / 100,
                ),
                Offers(),
                SizedBox(
                  height: 5.5 * height / 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Favourites",
                      style: GoogleFonts.signikaNegative(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                productList == null
                    ? Loader()
                    : productList!.length == 0
                        ? Text(
                            "There are no products here currently!",
                            style: GoogleFonts.signikaNegative(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        : SizedBox(
                            height: 240,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productList!.length,
                              itemBuilder: (context, index) {
                                return CategoryProduct(
                                    product: productList![index]);
                              },
                            ),
                          ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     TextButton(
                //         onPressed: () {},
                //         child: Text(
                //           "see all..",
                //           style: GoogleFonts.signikaNegative(),
                //         )),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
