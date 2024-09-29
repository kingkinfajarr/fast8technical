import 'package:flutter/material.dart';

import '../../features/cart/presentation/cart_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/main_screen/main_screen.dart';
import '../../features/search/presentation/search_screen.dart';
import '../../splash_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const SplashScreen(),
      '/main': (context) => const MainScreen(),
      '/home': (context) => const HomeScreen(),
      '/search': (context) => const SearchScreen(),
      '/cart': (context) => const CartScreen(),
    };
  }
}
