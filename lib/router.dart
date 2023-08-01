import 'package:flutter/material.dart';
import 'package:grocery_app/common/widgets/bottom_bar.dart';
import 'package:grocery_app/features/address/screens/address_screen.dart';
import 'package:grocery_app/features/admin/screens/add_products.dart';
import 'package:grocery_app/features/admin/screens/admin_screen.dart';
import 'package:grocery_app/features/auth/screens/auth_screen.dart';
import 'package:grocery_app/features/home/screens/home_screen.dart';
import 'package:grocery_app/features/product_details/screens/product_details.dart';
import 'package:grocery_app/features/search/screens/search_screen.dart';

import 'models/product.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (builder) => const AuthScreen());

    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (builder) => const HomeScreen());

    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (builder) => const BottomBar());

    case AdminScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (builder) => const AdminScreen());

    case AddProductsScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (builder) => const AddProductsScreen());

    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (builder) => ProductDetailsScreen(
                product: product,
              ));

    case AddressScreen.routeName:
      int sum = routeSettings.arguments as int;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (builder) => AddressScreen(
                totalSum: sum,
              ));

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (builder) => SearchScreen(
                searchQuery: searchQuery,
              ));

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (builder) => const Scaffold(
                body: Center(child: Text("Error 404!, Screen does not exist")),
              ));
  }
}
