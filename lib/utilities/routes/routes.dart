import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thingistan/view/bottom_navigation_view.dart';
import 'package:thingistan/view/product_view.dart';
import 'package:thingistan/view/subcategory_view.dart';

import '../../view/home_view.dart';
import '../../view/login_view.dart';
import '../../view/splash_view.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutesName.navigation:
        return MaterialPageRoute(
          builder: (BuildContext context) => const BottomNavigation(),
        );
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeView(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView(),
        );
      case RoutesName.subcategory:
        dynamic jsonArgument = convertJson(args);
        dynamic data = jsonArgument['data'];
        dynamic catId = jsonArgument['catId'];
        if (catId != "" && catId is String) {
          return MaterialPageRoute(
            builder: (_) => SubcategoryView(data: data, catId: catId),
          );
        }
        return _errorRoute();
      case RoutesName.product:
        dynamic jsonArgument = convertJson(args);
        var catId = jsonArgument['catId'];
        var subCatId = jsonArgument['subCatId'];
        var subcategoryName = jsonArgument['subcategoryName'];
        if (catId != "" && subCatId != "" && catId is String) {
          return MaterialPageRoute(
            builder: (_) => ProductView(
              catId: catId,
              subCatId: subCatId,
              appBarName: subcategoryName,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Some Error Found'),
        ),
      );
    });
  }
}

convertJson(object) {
  var jsonEncodeValue = jsonEncode(object);
  Map<String, dynamic> jsonDecodeValue = jsonDecode(jsonEncodeValue);
  return jsonDecodeValue;
}
