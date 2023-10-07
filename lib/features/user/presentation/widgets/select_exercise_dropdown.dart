import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';

class SelectExerciseDropDown extends StatelessWidget {
  const SelectExerciseDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 314.w,
      margin: EdgeInsets.only(
        top: 16.h,
        right: 24.w,
        left: 37.w,
        bottom: 14.h,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          color: ColorHelper.selectExerciseDropDownBack),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: 12.r,
            color: ColorHelper.green90E072,
          ),
          SizedBox(width: 6.w),
          Flexible(
            child: Text(
              "Жим в рычажном тренажере",
              style: TextHelper.w500s12
                  .copyWith(color: ColorHelper.defaultThemeColor),
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16.r,
            color: ColorHelper.defaultThemeColor,
          )
        ],
      ),
    );
  }
}
