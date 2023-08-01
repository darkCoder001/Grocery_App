import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/features/admin/screens/products_screen.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../../../providers/user_provider.dart';
import '../../account/screens/accounts_screen.dart';

class AdminScreen extends StatefulWidget {
  static const String routeName = '/admin-home';
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  void _navigateToAccountScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AccountsScreen()));
  }

  int _page = 0;
  List<Widget> pages = [
    ProductsScreen(),
    const Center(
      child: Text("Analytics Page"),
    ),
    const Center(
      child: Text("Cart Page"),
    ),
  ];

  void updatePage(page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user.name;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.selectedNavBarColor,
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
              Text(
                "Admin",
                style: GoogleFonts.signikaNegative(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.grey[800]),
              ),
            ],
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 05,
        fixedColor: Colors.white,
        currentIndex: _page,
        backgroundColor: Colors.white,
        iconSize: 25,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: _page == 0
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
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: GlobalVariables.selectedNavBarColor,
                      ),
                      child: const Icon(
                        Icons.analytics_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                : Container(
                    height: 42,
                    width: 42,
                    child: const Icon(
                      Icons.analytics_outlined,
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
                        Icons.all_inbox_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                : Container(
                    height: 42,
                    width: 42,
                    child: const Icon(
                      Icons.all_inbox_rounded,
                      color: GlobalVariables.unSelectedBavBarColor,
                      size: 30,
                    ),
                  ),
            label: "",
          ),
        ],
      ),
    );
  }
}
