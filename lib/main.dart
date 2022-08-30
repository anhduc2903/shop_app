import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/home_screen.dart';

import './controllers/product_controller.dart';
import './screens/product_detail_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductController()..getData(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',
        ),
        home: const HomeScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        },
      ),
    );
  }
}
