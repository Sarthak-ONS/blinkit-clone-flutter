import 'package:flutter/material.dart';

import '../../../app_colors.dart';

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