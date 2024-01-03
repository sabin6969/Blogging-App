import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// bodyLarge
// bodyMedium -->for buttons
// bodySmall
// caption

class AppTheme {
  static ThemeData appThemeData(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ThemeData(
      brightness: Brightness.light,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          shape: const MaterialStatePropertyAll(StadiumBorder()),
          backgroundColor: const MaterialStatePropertyAll(
            Color.fromARGB(255, 178, 22, 217),
          ),
          fixedSize: MaterialStatePropertyAll(
            Size(
              size.width,
              40.h,
            ),
          ),
          textStyle: MaterialStatePropertyAll(
            GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16.h,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),
    );
  }
}
