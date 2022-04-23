import 'package:flutter/material.dart';
import 'product_item.dart';

class ShoppingList extends StatelessWidget {
  final List<ProductItem> products;

  const ShoppingList({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return products[index];
      },
      itemCount: products.length,
    );
  }

}

