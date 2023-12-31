import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelText extends StatelessWidget {
  final String data;
  final double fontSize;
  final FontWeight fontWeight;
  const LabelText(
      {super.key,
      required this.data,
      required this.fontSize,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
      )),
    );
  }
}
