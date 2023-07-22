import 'package:ecom/Services/Helpers/request_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Services/Exceptions/api_exception.dart';
import '../../../app_colors.dart';
import '../Atoms/custom_button.dart';
import '../Atoms/custom_text_field.dart';

class LoginwithMobileWidget extends StatefulWidget {
  const LoginwithMobileWidget({
    super.key,
  });

  @override
  State<LoginwithMobileWidget> createState() => _LoginwithMobileWidgetState();
}

class _LoginwithMobileWidgetState extends State<LoginwithMobileWidget> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  Future _authorizeWithPhoneNumber(context) async {
    FocusScope.of(context).unfocus();
    if (_textEditingController.text.isEmpty ||
        _textEditingController.text.length != 10) return;
    try {
      final data = await ApiService().postFormData(
        '/v2/auth/otp/send',
        {
          "phoneNumber": _textEditingController.text,
        },
      );
      Navigator.of(context).popAndPushNamed('/otp/verify', arguments: data);
    } on ApiException catch (e) {
      Fluttertoast.showToast(msg: e.message);
    }
  }

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
                prefix: "+91  ",
                validator: (p0) {
                  print(p0);
                  if (p0 == null || p0.isEmpty) {
                    return "Please enter a valid phone number";
                  }
                  if (p0.length != 10) {
                    return "Please enter a valid phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              customTextButton(
                context,
                callback: () async {
                  _authorizeWithPhoneNumber(context);
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
