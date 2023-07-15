import 'package:flutter/material.dart';

import '../UI/Widgets/home_screen_app_bar.dart';
import '../UI/Widgets/home_screen_search_bar.dart';

const categoriesTitles = [
  "Paan Corner",
  "Dairy, Bread & Eggs",
  "Fruits & Vegetables",
  "Cold Drinks & Juices",
  "Snacks & Munchies",
  "Breakfast & Instandt Food",
  "Sweet Tooth",
  "Bakery & Biscuits",
  "Tea & Coffee",
  "Atta, Rice & Dal",
  "Masala & Oil",
  "Sauces & Spreads",
  "Chicken, Meat & Fish",
  "Organic & Healthy Living",
  "Baby Care",
  "Pharma & Wellness",
  "Cleaning Essentials",
  "Home & Office",
  "Personal Care",
  "Pet Care"
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void preCachImages() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Scaffold(
          primary: true,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const HomeScreenAppBar(),
              const HomeScreenSearchBar(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 240,
                  child: PageView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('Assets/cimgs/${index + 1}.jpg'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              const SliverToBoxAdapter(
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
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 0.65,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('Assets/Categories/${index + 1}.png'),
                          Text(
                            categoriesTitles[index],
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.alphabetic,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
