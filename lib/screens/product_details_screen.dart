// lib/screens/product_details_page.dart
import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';

@RoutePage(name: 'ProductDetailsScreenRoute', deferredLoading: true)
class ProductDetailsPage extends StatelessWidget {
  final String productId;
  final String name;
  final String price;

  const ProductDetailsPage({
    super.key,
    required this.productId,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Product ID: $productId"),
            Text("Name: $name"),
            Text("Price: \$$price"),
          ],
        ),
      ),
    );
  }
}
