import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class TrainingGiftCard extends StatelessWidget {
  const TrainingGiftCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset("assets/images/splash.png"),
      // Lottie.asset(
      //   "assets/images/lottie_777.json",
      //   fit: BoxFit.cover,
      // ),
      Padding(
        padding: EdgeInsets.all(12.r),
        child: Icon(
          Icons.info_outline_rounded,
          size: 24.r,
          color: ColorHelper.green90E072,
        ),
      ),
    ]);
  }
}
