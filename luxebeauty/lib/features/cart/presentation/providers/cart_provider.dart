import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luxebeauty/injection_container.dart';
import 'package:luxebeauty/features/cart/domain/entities/cart_item.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super(InjectionContainer.cartLocalDataSource.getCartItems());

  Future<void> addToCart(CartItem item) async {
    await InjectionContainer.cartLocalDataSource.addToCart(item);
    state = InjectionContainer.cartLocalDataSource.getCartItems();
  }

  Future<void> removeFromCart(String productId) async {
    await InjectionContainer.cartLocalDataSource.removeFromCart(productId);
    state = InjectionContainer.cartLocalDataSource.getCartItems();
  }

  Future<void> updateQuantity(String productId, int quantity) async {
    await InjectionContainer.cartLocalDataSource.updateQuantity(productId, quantity);
    state = InjectionContainer.cartLocalDataSource.getCartItems();
  }

  Future<void> clearCart() async {
    await InjectionContainer.cartLocalDataSource.clearCart();
    state = [];
  }
}
