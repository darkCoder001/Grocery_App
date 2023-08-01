import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/constants/global_variables.dart';
import 'package:grocery_app/features/account/screens/accounts_screen.dart';
import 'package:grocery_app/features/cart/screens/cart_screens.dart';
import 'package:grocery_app/features/home/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void _navigateToAccountScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AccountsScreen()));
  }

  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorder = 05;

  List<Widget> pages = [
    const HomeScreen(),
    const Center(
      child: Text("Orders Page"),
    ),
    const CartScreen(),
  ];

  void updatePage(page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user.name;
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    print(userCartLen);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.backgroundColor,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _navigateToAccountScreen(context);
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: GlobalVariables.greyBg,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Icon(
                          Icons.person_2_rounded,
                          color: GlobalVariables.selectedNavBarColor,
                          fill: BorderSide.strokeAlignCenter,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 08,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi!",
                          style: GoogleFonts.signikaNegative(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        Text(
                          user,
                          style: GoogleFonts.signikaNegative(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Card(
                    elevation: 05,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ),
                  )
                ],
              )
              // Column(
              //   children: [
              //     IconButton(
              //         onPressed: () {},
              //         icon: Card(
              //           elevation: 07,
              //           color: GlobalVariables.backgroundColor,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(50)),
              //           child: Center(
              //             child: Container(
              //               height: 100,
              //               width: 100,
              //               decoration: const BoxDecoration(
              //                 shape: BoxShape.circle,
              //                 color: Colors.white,
              //               ),
              //               child: const Center(
              //                 child: Icon(
              //                   Icons.notifications,
              //                   color: Colors.black,
              //                   size: 35,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ))
              //   ],
              // )
            ],
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          elevation: 05,
          fixedColor: Colors.white,
          currentIndex: _page,
          backgroundColor: Colors.white,
          onTap: updatePage,
          items: [
            BottomNavigationBarItem(
              icon: _page == 0
                  ? Card(
                      elevation: 10,
                      color: GlobalVariables.selectedNavBarColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: 42,
                        width: 42,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: GlobalVariables.selectedNavBarColor,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.home_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 42,
                      width: 42,
                      child: const Icon(
                        Icons.home_rounded,
                        color: GlobalVariables.unSelectedBavBarColor,
                        size: 35,
                      ),
                    ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _page == 1
                  ? Card(
                      elevation: 10,
                      color: GlobalVariables.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        height: 42,
                        width: 42,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: GlobalVariables.selectedNavBarColor,
                        ),
                        child: const Icon(
                          Icons.account_balance_wallet_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    )
                  : Container(
                      height: 42,
                      width: 42,
                      child: const Icon(
                        Icons.account_balance_wallet_rounded,
                        color: GlobalVariables.unSelectedBavBarColor,
                        size: 35,
                      ),
                    ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _page == 2
                  ? Card(
                      elevation: 10,
                      color: GlobalVariables.backgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: 42,
                        width: 42,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: GlobalVariables.selectedNavBarColor,
                        ),
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    )
                  : Container(
                      height: 42,
                      width: 42,
                      child: const Icon(
                        Icons.shopping_cart,
                        color: GlobalVariables.unSelectedBavBarColor,
                        size: 30,
                      ),
                    ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
