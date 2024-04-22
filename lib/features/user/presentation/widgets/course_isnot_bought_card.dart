import 'package:BodyPower/bottom_navigation_bar.dart';
import 'package:BodyPower/features/blogger/presentation/screens/all_available_courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class CourseIsNotBoughtCard extends StatelessWidget {
  final String text;
  final String emoji;
  const CourseIsNotBoughtCard({
    this.emoji = "🥱",
    this.text = "К сожалению вы еще никуда \nне записаны",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: 16.h,
        bottom: 42.h,
      ),
      color: ColorHelper.cardsBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
      child: SizedBox(
        width: 343.w,
        height: 172.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: AppFonts.w500s24,
            ),
            SizedBox(height: 4.h),
            Text(
              text,
              textAlign: TextAlign.center,
              style: AppFonts.w500s12.copyWith(
                color: ColorHelper.defaultThemeColor,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavBar(
                              selectedTab: 2,
                            )));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    152.w,
                    32.h,
                  ),
                  backgroundColor: ColorHelper.buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14))),
              child: Text(
                "+ Добавить курс",
                style: AppFonts.w500s10
                    .copyWith(color: ColorHelper.buttonTextColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
