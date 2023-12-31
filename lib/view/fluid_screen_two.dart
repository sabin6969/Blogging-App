import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_app/constants/constant_image_path.dart';
import 'package:mvc_app/constants/constant_text.dart';
import 'package:mvc_app/constants/route_names.dart';

class FluidScreenTwo extends StatelessWidget {
  const FluidScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 106, 164, 211),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ConstantImagePath.blogAppLogoTwo,
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              ConstantText.blogAppWelcomeTextSecond,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50.h,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RouteName.loginPage);
              },
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
