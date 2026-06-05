import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:luxebeauty/injection_container.dart';
import 'package:luxebeauty/features/home/domain/entities/category.dart';

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  return await InjectionContainer.getCategoriesUseCase();
});

final selectedCategoryProvider = StateProvider<String?>((ref) => null);
