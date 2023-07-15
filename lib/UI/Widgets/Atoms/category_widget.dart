import 'package:flutter/material.dart';

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

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(
          context,
          '/products',
          arguments: categoriesTitles[index],
        ),
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffEEF5FF),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Image.asset(
              'Assets/Categories/${index + 1}.png',
              fit: BoxFit.cover,
            ),
          ),
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
  }
}
