import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16.h,
        bottom: 21.h,
      ),
      padding: EdgeInsets.only(top: 25.h),
      width: 343.w,
      height: 172.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: ColorHelper.cardsBackground,
        image: DecorationImage(
          image: AssetImage("assets/images/my_course_image.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Быстрое похудение",
            style: TextHelper.w600s16
                .copyWith(color: ColorHelper.alwaysWhiteFFFFFF),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 47.w,
              ),
              Expanded(
                child: Text(
                  "24 тренировочных дня (3 тренировки в неделю)",
                  style: TextHelper.w500s10
                      .copyWith(color: ColorHelper.trainingTypeColor),
                ),
              ),
              Card(
                margin: EdgeInsets.only(
                  left: 24.w,
                  right: 47.w,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r)),
                color: ColorHelper.trainingTypeColor,
                child: SizedBox(
                  height: 28.h,
                  width: 104.w,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/barbell_icon.png"),
                          size: 10.r,
                        ),
                        SizedBox(width: 7.w),
                        Text(
                          "Курс для зала",
                          style: TextHelper.w500s10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                202.w,
                32.h,
              ),
              backgroundColor: ColorHelper.black101010.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_border,
                  color: ColorHelper.alwaysWhiteFFFFFF,
                  size: 12.r,
                ),
                SizedBox(width: 4.w),
                Text(
                  "Посмотреть мои достижения",
                  style: TextHelper.w500s10
                      .copyWith(color: ColorHelper.alwaysWhiteFFFFFF),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
