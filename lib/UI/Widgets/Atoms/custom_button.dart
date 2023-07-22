import 'package:flutter/material.dart';

import '../../../app_colors.dart';

Widget customTextButton(
  context, {
  String? title = "Continue",
  required Function callback,
  EdgeInsets? padding,
  Color? color,
}) =>
    ElevatedButton(
      onPressed: () => callback(),
      style: TextButton.styleFrom(
        backgroundColor: color ?? AppColors.redAccentColor,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        padding: padding,
      ),
      child: const Text(
        'Continue',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
