import 'package:ambulance_app/utils/app_constants.dart';
import 'package:ambulance_app/widgets/pinput_widget.dart';
import 'package:ambulance_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


Widget otpVerificationWidhget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hello text
        textWidget(text: AppConstants.phoneVerification),

        // Ambulance book text
        textWidget(
          text: AppConstants.enterOtp,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 40,
        ),

        SizedBox(width: Get.width, height: 50, child: RoundedWithShadow()),

        const SizedBox(
          height: 40,
        ),

        // Footer text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 12,
              ),
              children: [
                const TextSpan(
                  text: "${AppConstants.resendCode} ",
                ),
                TextSpan(
                  text: "10 Seconds",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
