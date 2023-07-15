import 'package:ecom/app_colors.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyWhiteColor,
      appBar: AppBar(
        leadingWidth: 25,
        automaticallyImplyLeading: true,
        title: Text(categoryName),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: buildSubCategory()),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: const Text('List of sub category'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSubCategory() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            print(subCategory[index]);
            // Navigate to
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: index == 1
                  ? const Border(
                      right: BorderSide(
                        color: AppColors.primaryGreenColor,
                        width: 3,
                      ),
                    )
                  : null,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.greyWhiteColor,
                  child: Image.asset(
                    "Assets/SubCategories/${index + 1}.png",
                    height: 45,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  subCategory[index],
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        );
      },
      itemCount: subCategory.length,
    );
  }
}

const subCategory = [
  "Milk",
  "Bread & Pav",
  "Butter & Cheese",
  "Paneer & Curd",
  "Eggs",
  "Oats",
  "Flakes & Cereals",
  "Vermicelli",
  "Peanut Butter",
  "Condensed Milk"
];
