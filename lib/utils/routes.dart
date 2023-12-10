
import 'package:ecommerce_app/utils/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../view/productScreen.dart';


class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.productScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text('No Route Found'),
            ),
          );
        });
    }
  }

}