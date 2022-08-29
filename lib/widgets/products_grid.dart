import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../models/product_model.dart';
import '../controllers/product_controller.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  ProductController get _readProductController =>
      context.read<ProductController>();
  ProductController get _watchProductController =>
      context.watch<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: _watchProductController.allProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider<ProductModel?>.value(
        value: _readProductController.allProducts[i],
        child: const ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
