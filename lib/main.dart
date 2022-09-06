import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/home_screen.dart';

import './controllers/product_controller.dart';
import './screens/product_detail_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductController()..getData(),
        ),
        ChangeNotifierProvider(create: (context) => CartController())
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',
        ),
        home: const HomeScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
        },
      ),
    );
  }
}
