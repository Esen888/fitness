import 'package:BodyPower/features/blogger/data/models/model.dart';
import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/training_screen.dart';

class TrainingScheduleCard extends StatelessWidget {
  const TrainingScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Первая тренировка",
              style: AppFonts.w500s12.copyWith(color: ColorHelper.green90E072),
            ),
            SizedBox(width: 10.w),
            Text(
              "1 час 35 мин",
              style: AppFonts.w500s12
                  .copyWith(color: ColorHelper.defaultThemeColor),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 8.h),
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrainingScreen(
                                exerciseName: trainingNames[index],
                              )));
                },
                child: Container(
                  width: 343.w,
                  height: 76.h,
                  padding: EdgeInsets.only(top: 13.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: index == 0
                          ? Radius.circular(14.r)
                          : const Radius.circular(0),
                      bottom: index == trainingImages.length - 1
                          ? Radius.circular(14.r)
                          : const Radius.circular(0),
                    ),
                    image: DecorationImage(
                      image: AssetImage("${trainingImages[index]}"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        trainingNames[index],
                        style: AppFonts.w500s16
                            .copyWith(color: ColorHelper.alwaysWhiteFFFFFF),
                      ),
                      Text(
                        "${index + 1} упражнение",
                        style: AppFonts.w500s10.copyWith(
                            color:
                                ColorHelper.alwaysWhiteFFFFFF.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: trainingImages.length,
          ),
        ),
      ],
    );
  }
}
