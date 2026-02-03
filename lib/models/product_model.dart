class Product {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavourite;
  final String discription;

  const Product({
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.discription,
    this.oldPrice,
    this.isFavourite = false,
  });
}

final List<Product> products = [
  Product(
    name: 'Apple',
    category: 'Fruit',
    price: 50,
    imageUrl: 'assets/images/apple.png',
    discription: 'this is an apple',
    oldPrice: 100,
  ),
  Product(
    name: 'Banana',
    category: 'Fruit',
    price: 27,
    imageUrl: 'assets/images/banana.png',
    discription: 'this is banana',
    oldPrice: 32,
  ),
  Product(
    name: 'Pinapple',
    category: 'Fruit',
    price: 20,
    imageUrl: 'assets/images/pinapple.png',
    discription: 'this is an Pinapple',
    oldPrice: 25,
  ),
];
