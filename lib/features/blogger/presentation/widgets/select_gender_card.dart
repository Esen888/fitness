import 'package:fitness/core/utils/app_colors.dart';
import 'package:fitness/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectGenderCard extends StatelessWidget {
  const SelectGenderCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161.h,
      width: 343.w,
      margin: EdgeInsets.only(
        top: 30.h,
        bottom: 18.h,
      ),
      padding: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        color: ColorHelper.cardsBackground,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20.h,
                  left: 34.w,
                ),
                width: 100.r,
                height: 100.r,
                decoration: BoxDecoration(
                  color: ColorHelper.green90E072,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Image.asset(
                  "assets/images/male.png",
                  width: 122.w,
                  height: 172.h,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 24.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 22.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Курс для Мужчин 👱‍♂️‍️",
                  style: AppFonts.w600s10
                      .copyWith(color: ColorHelper.defaultThemeColor),
                ),
                SizedBox(
                  width: 156.w,
                  child: Text(
                    "Если хотите изменить пол на женский, нажмите кнопку “Изменить пол”",
                    style: AppFonts.w500s10
                        .copyWith(color: ColorHelper.alwaysGrey929292),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r)),
                    minimumSize: Size(
                      157.w,
                      28.h,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "Изменить пол",
                        style: AppFonts.w500s12
                            .copyWith(color: ColorHelper.buttonTextColor),
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12.r,
                        color: ColorHelper.buttonTextColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
