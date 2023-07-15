import 'package:ecom/Screens/error_screen.dart';
import 'package:ecom/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';

import 'package:page_animation_transition/page_animation_transition.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/error':
        return PageAnimationTransition(
            page: const ErrorScreem(),
            pageAnimationType: BottomToTopTransition());
      default:
        // Handle unknown routes
        return MaterialPageRoute(builder: (_) => const ErrorScreem());
    }
  }
}
