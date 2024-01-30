
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:r_kitchen/const.dart';


class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color customButton_color;
  final double button_text_fontSize,button_height;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.button_text_fontSize,
    required this.button_height,
    required this.customButton_color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: button_height,
        decoration: BoxDecoration(
       //   color: Color(0xffffa152),
          color: customButton_color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            text,
            style:  GoogleFonts.poppins(
                color: customButtonText_color,
                letterSpacing: 0.50,
                fontWeight: FontWeight.w700,
                fontSize: button_text_fontSize),
          ),
        ),
      ),
    );
  }
}