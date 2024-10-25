import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:pks_5/pages/index_page.dart';
import 'package:pks_5/pages/favorite_page.dart';
import 'package:pks_5/pages/lk_page.dart';

void main() {
  runApp(MyShopApp());
}

class MyShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  int _selectedIndex = 0;
  List<Product> _products = []; // Список товаров
  List<Product> _favoriteProducts = []; // Список избранных товаров

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _toggleFavorite(Product product) {
    setState(() {
      product.isFavorite = !product.isFavorite;
      if (product.isFavorite) {
        if (!_favoriteProducts.contains(product)) {
          _favoriteProducts.add(product);
        }
      } else {
        _favoriteProducts.remove(product);
      }
    });
  }


  List<Widget> _pages() {
    return [
      IndexPage(
        onProductAdded: _addProduct,
        favoriteProducts: _favoriteProducts,
      ),
      FavoritePage(
        favoriteProducts: _favoriteProducts,
      ),
      LkPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 2, 14, 115),
        onTap: _onItemTapped,
      ),
    );
  }
}
