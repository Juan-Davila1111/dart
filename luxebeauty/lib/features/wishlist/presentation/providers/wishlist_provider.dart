import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luxebeauty/injection_container.dart';

final wishlistProvider = StateNotifierProvider<WishlistNotifier, List<String>>((ref) {
  return WishlistNotifier();
});

class WishlistNotifier extends StateNotifier<List<String>> {
  WishlistNotifier() : super(InjectionContainer.wishlistLocalDataSource.getWishlist());

  Future<void> toggleWishlist(String productId) async {
    if (state.contains(productId)) {
      await InjectionContainer.wishlistLocalDataSource.removeFromWishlist(productId);
      state = [...state]..remove(productId);
    } else {
      await InjectionContainer.wishlistLocalDataSource.addToWishlist(productId);
      state = [...state, productId];
    }
  }

  bool isWishlisted(String productId) {
    return state.contains(productId);
  }
}
