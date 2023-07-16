import 'package:ecom/Screens/app_about_screen.dart';
import 'package:ecom/Screens/error_screen.dart';
import 'package:ecom/Screens/home_screen.dart';
import 'package:ecom/Screens/order_summary_screen.dart';
import 'package:ecom/Screens/products_screen.dart';
import 'package:ecom/Screens/profile_screen.dart';
import 'package:ecom/Screens/user_address_screen.dart';
import 'package:ecom/Screens/user_cart_screen.dart';
import 'package:ecom/Screens/user_orders_screen.dart';
import 'package:flutter/material.dart';

import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/animations/scale_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/products':
        print(settings.arguments);
        return PageAnimationTransition(
          page: ProductsScreen(
            categoryName: settings.arguments.toString(),
          ),
          pageAnimationType: ScaleAnimationTransition(),
        );
      case "/cart":
        return PageAnimationTransition(
          page: const CartScreen(),
          pageAnimationType: ScaleAnimationTransition(),
        );
      case "/orders":
        return PageAnimationTransition(
          page: const OrdersScreen(),
          pageAnimationType: ScaleAnimationTransition(),
        );
      case "/order":
        return PageAnimationTransition(
          page: const OrderSummaryScreen(),
          pageAnimationType: ScaleAnimationTransition(),
        );

      case '/profile':
        return PageAnimationTransition(
          page: const ProfileScreen(),
          pageAnimationType: RightToLeftFadedTransition(),
        );
      case '/user/address':
        return PageAnimationTransition(
          page: const UserAddressScreen(),
          pageAnimationType: RightToLeftFadedTransition(),
        );
      case '/app/about':
        return PageAnimationTransition(
          page: const AppAboutScreen(),
          pageAnimationType: RightToLeftFadedTransition(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreem(),
        );
    }
  }
}
