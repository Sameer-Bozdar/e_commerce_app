import 'package:ecommerce_app/view/productScreen.dart';
import 'package:ecommerce_app/viewModel/storeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => StoreViewModel())
        ],child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductScreen()
    )
    );
  }
}
