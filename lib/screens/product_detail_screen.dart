import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/product_controller.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(),
    );
  }
}
