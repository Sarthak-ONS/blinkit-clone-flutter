import 'package:ecom/UI/Widgets/Organisms/home_screen_carousel.dart';
import 'package:flutter/material.dart';

import '../UI/Widgets/Organisms/home_screen_app_bar.dart';
import '../UI/Widgets/Organisms/home_screen_category_builder.dart';
import '../UI/Widgets/home_screen_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void preCachImages() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: const Scaffold(
          primary: true,
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              HomeScreenAppBar(),
              HomeScreenSearchBar(),
              HomeScreenCarousel(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              )),
              HomeScreenCateogoryWidget()
            ],
          ),
        ),
      ),
    );
  }
}
