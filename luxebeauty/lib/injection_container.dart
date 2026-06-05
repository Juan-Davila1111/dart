import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:luxebeauty/features/auth/data/datasources/user_local_data_source.dart';
import 'package:luxebeauty/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:luxebeauty/features/auth/domain/repositories/auth_repository.dart';
import 'package:luxebeauty/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:luxebeauty/features/auth/domain/usecases/login_usecase.dart';
import 'package:luxebeauty/features/auth/domain/usecases/logout_usecase.dart';
import 'package:luxebeauty/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:luxebeauty/features/cart/domain/entities/cart_item.dart';
import 'package:luxebeauty/features/home/data/datasources/category_local_data_source.dart';
import 'package:luxebeauty/features/home/data/repositories/category_repository_impl.dart';
import 'package:luxebeauty/features/home/domain/repositories/category_repository.dart';
import 'package:luxebeauty/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:luxebeauty/features/products/data/datasources/product_local_data_source.dart';
import 'package:luxebeauty/features/products/data/repositories/product_repository_impl.dart';
import 'package:luxebeauty/features/products/domain/repositories/product_repository.dart';
import 'package:luxebeauty/features/products/domain/usecases/get_product_by_id_usecase.dart';
import 'package:luxebeauty/features/products/domain/usecases/get_products_usecase.dart';
import 'package:luxebeauty/features/wishlist/data/datasources/wishlist_local_data_source.dart';

class InjectionContainer {
  static late final SharedPreferences sharedPreferences;
  static late final ProductLocalDataSource productLocalDataSource;
  static late final ProductRepository productRepository;
  static late final GetProductsUseCase getProductsUseCase;
  static late final GetProductByIdUseCase getProductByIdUseCase;
  static late final CategoryLocalDataSource categoryLocalDataSource;
  static late final CategoryRepository categoryRepository;
  static late final GetCategoriesUseCase getCategoriesUseCase;
  static late final UserLocalDataSource userLocalDataSource;
  static late final AuthRepository authRepository;
  static late final LoginUseCase loginUseCase;
  static late final GetCurrentUserUseCase getCurrentUserUseCase;
  static late final LogoutUseCase logoutUseCase;
  static late final CartLocalDataSource cartLocalDataSource;
  static late final WishlistLocalDataSource wishlistLocalDataSource;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await Hive.initFlutter();
    Hive.registerAdapter(CartItemAdapter());
    await Hive.openBox<CartItem>('cart');
    await Hive.openBox<String>('wishlist');

    productLocalDataSource = ProductLocalDataSourceImpl();
    productRepository = ProductRepositoryImpl(productLocalDataSource);
    getProductsUseCase = GetProductsUseCase(productRepository);
    getProductByIdUseCase = GetProductByIdUseCase(productRepository);

    categoryLocalDataSource = CategoryLocalDataSourceImpl();
    categoryRepository = CategoryRepositoryImpl(categoryLocalDataSource);
    getCategoriesUseCase = GetCategoriesUseCase(categoryRepository);

    userLocalDataSource = UserLocalDataSourceImpl();
    authRepository = AuthRepositoryImpl(userLocalDataSource, sharedPreferences);
    loginUseCase = LoginUseCase(authRepository);
    getCurrentUserUseCase = GetCurrentUserUseCase(authRepository);
    logoutUseCase = LogoutUseCase(authRepository);

    cartLocalDataSource = CartLocalDataSourceImpl();
    wishlistLocalDataSource = WishlistLocalDataSourceImpl();
  }
}
