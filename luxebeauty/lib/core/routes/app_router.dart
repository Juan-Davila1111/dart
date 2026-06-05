import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:luxebeauty/features/auth/presentation/pages/login_page.dart';
import 'package:luxebeauty/features/home/presentation/pages/home_page.dart';
import 'package:luxebeauty/features/products/presentation/pages/product_detail_page.dart';
import 'package:luxebeauty/features/cart/presentation/pages/cart_page.dart';
import 'package:luxebeauty/features/wishlist/presentation/pages/wishlist_page.dart';
import 'package:luxebeauty/features/profile/presentation/pages/profile_page.dart';
import 'package:luxebeauty/features/profile/presentation/pages/settings_page.dart';
import 'package:luxebeauty/features/auth/presentation/providers/auth_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/product/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProductDetailPage(productId: id);
        },
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartPage(),
      ),
      GoRoute(
        path: '/wishlist',
        builder: (context, state) => const WishlistPage(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
});
