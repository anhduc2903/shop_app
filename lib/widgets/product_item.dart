import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/cart_controller.dart';

import '../models/product_model.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  ProductModel? get _watchProduct => context.watch<ProductModel>();

  ProductModel? get _readProduct => context.read<ProductModel>();

  CartController get _readCartController => context.read<CartController>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<ProductModel>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Colors.red,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            _watchProduct?.title ?? "",
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              _readCartController.addItem(
                _readProduct?.id ?? "",
                double.parse("${_readProduct?.price ?? 0}"),
                _readProduct?.title ?? "");

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Thành công"),
              ));
            },
            color: Colors.red,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: _readProduct?.id,
            );
          },
          child: Image.network(
            _watchProduct?.imageUrl ?? "",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
