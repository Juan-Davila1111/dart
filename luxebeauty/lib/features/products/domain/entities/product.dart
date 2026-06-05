class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String description;
  final List<String> colors;
  final String imageUrl;
  final String? badge;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.colors,
    required this.imageUrl,
    this.badge,
  });
}
