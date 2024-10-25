import 'package:flutter/material.dart';
import '../models/product.dart';

class ItemPage extends StatelessWidget {
  final Product product;

  const ItemPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Image.network(
                product.image,
                height: screenHeight * 0.4,
                width: screenWidth * 0.8,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Ошибка загрузки изображения',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  );
                },
              ),
              const SizedBox(height: 16),
              Text(
                product.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                '${product.price.toStringAsFixed(2)} ₽',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    product.description,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
