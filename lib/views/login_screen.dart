import 'package:ambulance_app/views/otp_verification.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/intro_widget.dart';
import '../widgets/login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final countryPicker = const FlCountryCodePicker();

  CountryCode countryCode =
      const CountryCode(name: 'India', code: "IN", dialCode: "+91");

  onSubmit(String? input) {
    Get.to(() => otpVerificationScreen(countryCode.dialCode+input!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              greenIntroWidget(),
              const SizedBox(
                height: 45,
              ),
              loginWidget(countryCode, () async {
                final code = await countryPicker.showPicker(context: context);
                // Null check
                if (code != null) {
                  setState(() {
                    countryCode = code;
                  });
                }
              }, onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}
