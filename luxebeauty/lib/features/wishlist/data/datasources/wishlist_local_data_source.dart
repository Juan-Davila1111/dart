import 'package:hive/hive.dart';

abstract class WishlistLocalDataSource {
  List<String> getWishlist();
  Future<void> addToWishlist(String productId);
  Future<void> removeFromWishlist(String productId);
  bool isWishlisted(String productId);
}

class WishlistLocalDataSourceImpl implements WishlistLocalDataSource {
  static const String boxName = 'wishlist';

  @override
  List<String> getWishlist() {
    final box = Hive.box<String>(boxName);
    return box.values.toList();
  }

  @override
  Future<void> addToWishlist(String productId) async {
    final box = Hive.box<String>(boxName);
    if (!box.values.contains(productId)) {
      await box.add(productId);
    }
  }

  @override
  Future<void> removeFromWishlist(String productId) async {
    final box = Hive.box<String>(boxName);
    final index = box.values.toList().indexOf(productId);
    if (index != -1) {
      await box.deleteAt(index);
    }
  }

  @override
  bool isWishlisted(String productId) {
    final box = Hive.box<String>(boxName);
    return box.values.contains(productId);
  }
}
