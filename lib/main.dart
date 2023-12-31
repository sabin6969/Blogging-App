import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mvc_app/constants/app_theme.dart';
import 'package:mvc_app/constants/routes.dart';
import 'package:mvc_app/view/fluid_screen_one.dart';
import 'package:mvc_app/view/fluid_screen_two.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appThemeData(context),
          onGenerateRoute: Routes.generateRoute,
          home: LiquidSwipe(
            enableLoop: false,
            positionSlideIcon: 0.5,
            slideIconWidget: Icon(
              Icons.arrow_back_ios,
              size: 28.sp,
            ),
            pages: const [
              FluidScreenOne(),
              FluidScreenTwo(),
            ],
          ),
        );
      },
    );
  }
}
