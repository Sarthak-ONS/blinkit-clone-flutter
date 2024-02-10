import 'package:flutter/material.dart';

import 'package:ecom/UI/Widgets/Atoms/custom_text_field.dart';
import 'package:ecom/app_colors.dart';
import 'package:ecom/constants.dart';

class CouponsSelectionScreen extends StatefulWidget {
  const CouponsSelectionScreen({super.key});

  @override
  State<CouponsSelectionScreen> createState() => _CouponsSelectionScreenState();
}

class _CouponsSelectionScreenState extends State<CouponsSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyWhiteColor,
      appBar: AppBar(
        leadingWidth: 25,
        automaticallyImplyLeading: true,
        title: const Text("Coupons"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextField(
              hintText: "Type your coupon code here",
              isPhoneNumberField: false,
              suffixIcon: TextButton(
                onPressed: () => {},
                child: const Text("Apply"),
              ),
            ),
            Text(
              "Best Coupons for you",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: kDummyCoupons.length,
                itemBuilder: (context, index) {
                  var coupon = kDummyCoupons.elementAt(index);
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coupon["headline"],
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Use Code: ${coupon["couponCode"]}",
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ...coupon["dataPoints"]
                            .map(
                              (e) => Text(
                                e,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
