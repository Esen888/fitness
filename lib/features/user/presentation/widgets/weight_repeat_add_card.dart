import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class WeightRepeatAddCard extends StatelessWidget {
  const WeightRepeatAddCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 110.w,
          height: 35.h,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: "Килограммы",
              hintStyle:
                  AppFonts.w500s12.copyWith(color: ColorHelper.grey878787),
              filled: true,
              fillColor: ColorHelper.cardsBackground,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            width: 110.w,
            height: 35.h,
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "Повторений",
                hintStyle:
                    AppFonts.w500s12.copyWith(color: ColorHelper.grey878787),
                filled: true,
                fillColor: ColorHelper.cardsBackground,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(
              51.w,
              35.h,
            ),
            backgroundColor: ColorHelper.green90E072,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
          ),
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 24.r,
            color: ColorHelper.buttonTextColor,
          ),
        )
      ],
    );
  }
}
