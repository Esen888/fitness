
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class AboutCourseCard extends StatelessWidget {
  final String description;
  const AboutCourseCard({
    super.key, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorHelper.cardsBackground,
      margin: EdgeInsets.only(top: 22.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 18.w,
              right: 18.w,
              top: 10.h,
            ),
            child: Text(
description,
              // "Курс без боли и травм для вашего организма, поможет вам сбросить вес максимально быстро и восстановить тонус мышц.",
              style: AppFonts.w500s12
                  .copyWith(color: ColorHelper.defaultThemeColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.emergency,
                  size: 12.r,
                  color: ColorHelper.green90E072,
                ),
                SizedBox(width: 6.w),
                Text(
                  "Игорь Войтенко",
                  style: AppFonts.w500s12
                      .copyWith(color: ColorHelper.defaultThemeColor),
                ),
                const Spacer(),
                Text(
                  "“Road to the Dream”",
                  style: AppFonts.w500s12
                      .copyWith(color: ColorHelper.defaultThemeColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
