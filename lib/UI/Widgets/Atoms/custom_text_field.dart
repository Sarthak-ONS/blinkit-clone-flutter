import 'package:flutter/material.dart';

const kBorderTextField = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
);

Widget customTextField({
  TextEditingController? textEditingController,
  String? hintText,
  bool? isPhoneNumberField = false,
  String? prefix = "",
  int? maxLength = 10,
}) =>
    TextFormField(
      controller: textEditingController,
      maxLength: maxLength,
      autofocus: true,
      cursorColor: Colors.grey,
      keyboardType:
          isPhoneNumberField! ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        enabledBorder: kBorderTextField,
        focusedBorder: kBorderTextField,
        disabledBorder: kBorderTextField,
        errorBorder: kBorderTextField,
        focusedErrorBorder: kBorderTextField,
        hintText: hintText ?? 'Enter Mobile Number',
        prefix: Text(
          prefix ?? "+91  ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () => textEditingController!.clear(),
          icon: const Icon(
            Icons.cancel,
            color: Colors.black,
          ),
        ),
      ),
      style: const TextStyle(fontWeight: FontWeight.bold),
    );