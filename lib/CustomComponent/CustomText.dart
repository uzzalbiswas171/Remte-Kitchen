
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom15TExt extends StatelessWidget {
  Custom15TExt({super.key,required this.text});
String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 8.0,top: 2),
      child: Text(
          "$text",
      style: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.40,
        color: Colors.black87
        ),
      ),
    );
  }
}
