import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  ProductModel? get _readProduct => context.read<ProductModel>();
  ProductModel? get _watchProduct => context.watch<ProductModel>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {
              _readProduct?.toggleFavoriteStatus();
            },
            icon: Icon(_readProduct?.isFavorite ?? false
                ? Icons.favorite
                : Icons.favorite_border),
            color: Colors.red,
          ),
          title: Text(
            _readProduct?.title ?? "",
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Colors.red,
          ),
        ),
        child: Image.network(
          fit: BoxFit.cover,
          _watchProduct?.imageUrl ?? "",
        ),
      ),
    );
  }
}
