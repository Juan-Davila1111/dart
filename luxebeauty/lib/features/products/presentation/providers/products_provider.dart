import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luxebeauty/injection_container.dart';
import 'package:luxebeauty/features/products/domain/entities/product.dart';

final productsProvider = FutureProvider<List<Product>>((ref) async {
  return await InjectionContainer.getProductsUseCase();
});

final productByIdProvider = FutureProvider.family<Product?, String>((ref, id) async {
  return await InjectionContainer.getProductByIdUseCase(id);
});
