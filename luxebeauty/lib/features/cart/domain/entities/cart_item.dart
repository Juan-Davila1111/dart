class CartItem {
  final String productId;
  final int quantity;
  final String color;

  CartItem({
    required this.productId,
    required this.quantity,
    required this.color,
  });

  CartItem copyWith({
    String? productId,
    int? quantity,
    String? color,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
    );
  }
}
