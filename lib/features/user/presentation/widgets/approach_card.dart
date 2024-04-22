import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../screens/training_screen.dart';

class ApproachCards extends StatefulWidget {
  const ApproachCards({
    super.key,
  });

  @override
  State<ApproachCards> createState() => _ApproachCardsState();
}

class _ApproachCardsState extends State<ApproachCards> {
  String dropdownValue = approachList.first;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            // width: 168.w,
            height: 94.h,
            margin: EdgeInsets.only(
              top: 16.h,
              left: 16.w,
              right: 4.w,
              bottom: 16.h,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: ColorHelper.cardsBackground),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50.w,
                  height: 49.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 6.h),
                  decoration: BoxDecoration(
                      color: ColorHelper.approachCardBack,
                      borderRadius: BorderRadius.circular(14.r)),
                  child: Text(
                    "20",
                    style: AppFonts.w500s24
                        .copyWith(color: ColorHelper.splashIconColor),
                  ),
                ),
                Text(
                  "Повторений требуется",
                  style: AppFonts.w500s12
                      .copyWith(color: ColorHelper.defaultThemeColor),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            // width: 168.w,
            height: 94.h,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 16.h,
              left: 4.w,
              right: 16.w,
              bottom: 16.h,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: ColorHelper.cardsBackground),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50.w,
                  height: 49.h,
                  margin: EdgeInsets.only(bottom: 6.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorHelper.approachCardBack,
                      borderRadius: BorderRadius.circular(14.r)),
                  child: Text(
                    "1/2",
                    style: AppFonts.w500s24
                        .copyWith(color: ColorHelper.splashIconColor),
                  ),
                ),
                Text(
                  "Подходов выполнено",
                  style: AppFonts.w500s12
                      .copyWith(color: ColorHelper.defaultThemeColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
