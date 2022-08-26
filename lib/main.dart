import 'package:flutter/material.dart';
import 'package:shop_app/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Lato',
      ),
      home: HomeScreen(),
      // routes: {
      //   ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
      //   CartScreen.routeName: (ctx) => CartScreen(),
      //   OrdersScreen.routeName: (ctx) => OrdersScreen(),
      // }
    );
  }
}
