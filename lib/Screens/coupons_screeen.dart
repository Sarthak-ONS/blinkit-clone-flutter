import 'package:ecom/UI/Widgets/Atoms/custom_text_field.dart';
import 'package:ecom/app_colors.dart';
import 'package:flutter/material.dart';

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
          children: [
            customTextField(
              hintText: "Type your coupon code here",
              isPhoneNumberField: false,
              suffixIcon: TextButton(
                onPressed: () => {},
                child: const Text("Apply"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
