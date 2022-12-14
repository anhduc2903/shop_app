import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String? id;
  final String? description;
  final String? imageUrl;
  final String? title;
  final num? price;
  bool isFavorite;

  ProductModel({
    this.id,
    this.description,
    this.imageUrl,
    this.title,
    this.price,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] is String ? (json)["id"] as String : null,
        description: json["description"] is String
            ? (json)["description"] as String
            : null,
        imageUrl:
            json["imageUrl"] is String ? (json)["imageUrl"] as String : null,
        title: json["title"] is String ? (json)["title"] as String : null,
        price: json["price"] is num ? (json)["price"] as num : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "imageUrl": imageUrl,
        "title": title,
        "price": price
      };

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
