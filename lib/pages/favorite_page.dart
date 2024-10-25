import 'package:flutter/material.dart';
import '../models/product.dart';

class FavoritePage extends StatelessWidget {
  final List<Product> favoriteProducts;

  FavoritePage({required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранные товары'),
        backgroundColor: Colors.blueAccent,
      ),
      body: favoriteProducts.isEmpty
          ? Center(child: Text('Нет избранных товаров.'))
          : ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteProducts[index].name),
            subtitle: Text('${favoriteProducts[index].description} - ${favoriteProducts[index].price.toStringAsFixed(2)} ₽'),
          );
        },
      ),
    );
  }
}
