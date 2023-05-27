import 'package:ambulance_app/utils/app_constants.dart';
import 'package:ambulance_app/widgets/text_widget.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget loginWidget(CountryCode countryCode, Function onCountryChanged, Function onSubmit) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hello text
        textWidget(text: AppConstants.helloNiceToMeetYou),

        // Ambulance book text
        textWidget(
          text: AppConstants.getMovingWithambulance,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 40,
        ),

        // Container for phone number input
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 3,
                blurRadius: 3,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              // Country code input
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => onCountryChanged(),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          child: countryCode.flagImage(),
                        ),
                      ),
                      textWidget(text: countryCode.dialCode),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ),

              // Divider
              Container(
                width: 1,
                height: 55,
                color: Colors.black.withOpacity(0.2),
              ),

              // Text field for phone number input
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onSubmitted: (String? input)=> onSubmit(input),
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: AppConstants.enterMobileNumber,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 40,
        ),

        // Footer text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 12,
              ),
              children: [
                const TextSpan(
                  text: "${AppConstants.byCreating} ",
                ),
                TextSpan(
                  text: "${AppConstants.termsOfService} ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: "and ",
                ),
                TextSpan(
                  text: "${AppConstants.privacyPolicy} ",
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
