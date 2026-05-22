class Product {
  String name;
  double price;
  int stock;

  Product(this.name, this.price, this.stock);

  static void validateName(String name) {
    if (name.trim().isEmpty) {
      throw ArgumentError('El nombre no puede estar vacío');
    }
  }

  static void validatePrice(double price) {
    if (price < 0) {
      throw ArgumentError('El precio no puede ser negativo');
    }
  }

  static void validateStock(int stock) {
    if (stock < 0) {
      throw ArgumentError('El stock no puede ser negativo');
    }
  }

  static void validate(Product product) {
    validateName(product.name);
    validatePrice(product.price);
    validateStock(product.stock);
  }

  @override
  String toString() {
    return 'Product{name: $name, price: $price, stock: $stock}';
  }
}
