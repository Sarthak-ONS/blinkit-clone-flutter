import 'dart:async';

import 'package:ecom/UI/Widgets/Atoms/custom_text_field.dart';
import 'package:ecom/app_colors.dart';
import 'package:flutter/material.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  int _secondsRemaining = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_secondsRemaining == 1) {
          timer.cancel();
          setState(() {});
        } else {
          setState(() {
            _secondsRemaining--;
          });
        }
      },
    );
  }

  void _restartTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    setState(() {
      _secondsRemaining = 30;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP verification'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("We've sent a verification code to "),
              const Text(
                "+91 1234567890",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Enter the code below to verify your account"),
              const SizedBox(
                height: 10,
              ),
              customTextField(
                hintText: "Please enter OTP",
                isPhoneNumberField: true,
                maxLength: 6,
                textEditingController: _otpController,
              ),
              const SizedBox(
                height: 10,
              ),
              _timer.isActive
                  ? Text(
                      'Resend OTP in $_secondsRemaining',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Container(),
              _timer.isActive == false
                  ? TextButton(
                      onPressed: _restartTimer,
                      child: const Text(
                        "Resend OTP",
                        style: TextStyle(
                          color: AppColors.primaryGreenColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
