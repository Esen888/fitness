import 'package:fitness/bottom_navigation_bar.dart';
import 'package:fitness/core/utils/app_colors.dart';
import 'package:fitness/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.splashBackgroundColor,
      body: Center(
        child: FittedBox(
            fit: BoxFit.none,
          child: Image.asset(
            AppIcons.bodyPowerIcon,
            height: 175.h,
            width: 200.w,
            color: ColorHelper.splashIconColor,
          ),
        ),
      ),
    );
  }

  Future navigate() async {
    // var box = Hive.box("tokenBox");
    // String token = box.get("token", defaultValue: "");
    await Future.delayed(const Duration(seconds: 4)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const BottomNavBar()),
        ),
      ),
    );
  }
}
