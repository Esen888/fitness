import 'package:BodyPower/features/user/presentation/widgets/training_schedule_card.dart';
import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_fonts.dart';

class WeekScheduleTabbar extends StatelessWidget {
  const WeekScheduleTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        initialIndex: 0,
        length: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabBar(
              padding: EdgeInsets.only(
                bottom: 8.h,
                top: 10.h,
              ),
              labelStyle: AppFonts.w500s12.copyWith(color: ColorHelper.calendarColor),
              labelColor: ColorHelper.exerciseNameDefaultColor,
              unselectedLabelColor: const Color(0xff929292),
              indicatorColor: ColorHelper.exerciseNameDefaultColor,
              tabs: const <Widget>[
                Tab(
                  text: "Пн",
                ),
                Tab(
                  text: "Вт",
                ),
                Tab(
                  text: "Ср",
                ),
                Tab(
                  text: "Чт",
                ),
                Tab(
                  text: "Пт",
                ),
                Tab(
                  text: "Сб",
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                // physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  TrainingScheduleCard(),
                  TrainingScheduleCard(),
                  TrainingScheduleCard(),
                  TrainingScheduleCard(),
                  TrainingScheduleCard(),
                  TrainingScheduleCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
