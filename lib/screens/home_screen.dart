import 'package:flutter/material.dart';

enum FilterOptions {
  favorites,
  all,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          // PopupMenuButton(
          //   onSelected: (FilterOptions selectedValue) {
          //     setState(() {
          //       if (selectedValue == FilterOptions.Favorites) {
          //         _showOnlyFavorites = true;
          //       } else {
          //         _showOnlyFavorites = false;
          //       }
          //     });
          //   },
          //   icon: Icon(
          //     Icons.more_vert,
          //   ),
          //   itemBuilder: (_) => [
          //         PopupMenuItem(
          //           child: Text('Only Favorites'),
          //           value: FilterOptions.Favorites,
          //         ),
          //         PopupMenuItem(
          //           child: Text('Show All'),
          //           value: FilterOptions.All,
          //         ),
          //       ],
          // ),
          // Consumer<Cart>(
          //   builder: (_, cart, ch) => Badge(
          //         child: ch,
          //         value: cart.itemCount.toString(),
          //       ),
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.shopping_cart,
          //     ),
          //     onPressed: () {
          //       Navigator.of(context).pushNamed(CartScreen.routeName);
          //     },
          //   ),
          // ),
        ],
      ),
      // drawer: AppDrawer(),
      body: Container(),
    );
  }
}
