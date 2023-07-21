import 'package:flutter/material.dart';

import '../../../app_colors.dart';
import '../Atoms/custom_button.dart';
import '../Atoms/custom_text_field.dart';

class LoginwithMobileWidget extends StatelessWidget {
  LoginwithMobileWidget({
    super.key,
  });

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0),
            topRight: Radius.circular(18.0),
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Log in or Sign up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              customTextField(
                isPhoneNumberField: true,
                textEditingController: _textEditingController,
              ),
              const SizedBox(
                height: 10,
              ),
              customTextButton(
                context,
                callback: () {
                  Navigator.of(context).pushNamed('/otp/verify');
                },
                title: "Continue",
                padding: const EdgeInsets.symmetric(
                  horizontal: 110,
                  vertical: 8,
                ),
                color: AppColors.primaryGreenColor,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'By continuing, you agree to our terms of service and privacy policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
