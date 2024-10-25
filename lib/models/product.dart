class Product {
  String name;
  String image;
  String description;
  double price;
  bool isFavorite;

  Product({required this.name, required this.image, required this.description, required this.price, this.isFavorite = false});
}