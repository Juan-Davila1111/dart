import 'package:hive/hive.dart';
import '../../domain/entities/cart_item.dart';

abstract class CartLocalDataSource {
  List<CartItem> getCartItems();
  Future<void> addToCart(CartItem item);
  Future<void> removeFromCart(String productId);
  Future<void> updateQuantity(String productId, int quantity);
  Future<void> clearCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  static const String boxName = 'cart';

  CartLocalDataSourceImpl();

  @override
  List<CartItem> getCartItems() {
    final box = Hive.box<CartItem>(boxName);
    return box.values.toList();
  }

  @override
  Future<void> addToCart(CartItem item) async {
    final box = Hive.box<CartItem>(boxName);
    final existingIndex =
        box.values.toList().indexWhere((i) => i.productId == item.productId && i.color == item.color);
    if (existingIndex != -1) {
      final existing = box.getAt(existingIndex)!;
      await box.putAt(existingIndex, existing.copyWith(quantity: existing.quantity + item.quantity));
    } else {
      await box.add(item);
    }
  }

  @override
  Future<void> removeFromCart(String productId) async {
    final box = Hive.box<CartItem>(boxName);
    final index = box.values.toList().indexWhere((i) => i.productId == productId);
    if (index != -1) {
      await box.deleteAt(index);
    }
  }

  @override
  Future<void> updateQuantity(String productId, int quantity) async {
    final box = Hive.box<CartItem>(boxName);
    final index = box.values.toList().indexWhere((i) => i.productId == productId);
    if (index != -1) {
      final item = box.getAt(index)!;
      if (quantity <= 0) {
        await box.deleteAt(index);
      } else {
        await box.putAt(index, item.copyWith(quantity: quantity));
      }
    }
  }

  @override
  Future<void> clearCart() async {
    final box = Hive.box<CartItem>(boxName);
    await box.clear();
  }
}

class CartItemAdapter extends TypeAdapter<CartItem> {
  @override
  final int typeId = 0;

  @override
  CartItem read(BinaryReader reader) {
    return CartItem(
      productId: reader.readString(),
      quantity: reader.readInt(),
      color: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, CartItem obj) {
    writer.writeString(obj.productId);
    writer.writeInt(obj.quantity);
    writer.writeString(obj.color);
  }
}
