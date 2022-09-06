import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/widgets/badge.dart';

import '../widgets/products_grid.dart';
import 'cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
  FilterPrice
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var _showOnlyFavorites = false;
  var _filterPrice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                  _filterPrice = false;
                } else if (selectedValue == FilterOptions.All) {
                  _showOnlyFavorites = false;
                  _filterPrice = false;
                } else {
                  _showOnlyFavorites = false;
                  _filterPrice = true;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text('Price < 30'),
                value: FilterOptions.FilterPrice,
              ),
            ],
          ),
          Consumer<CartController>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: ProductsGrid(showFavorite: _showOnlyFavorites, filterPrice: _filterPrice),
    );
  }
}
