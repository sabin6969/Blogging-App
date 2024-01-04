import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  const CustomTextButton(
      {super.key,
      required this.name,
      required this.onPressed,
      required this.fontSize,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        name,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        )),
      ),
    );
  }
}
