import 'package:fitness/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_fonts.dart';

class WeekScheduleTabbar extends StatelessWidget {
 final List<Widget> tabbarViewChildren;
  const WeekScheduleTabbar({super.key, required this.tabbarViewChildren});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        initialIndex: 0,
        length: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabBar(
              padding: EdgeInsets.only(
                bottom: 8.h,
                top: 10.h,
              ),
              labelStyle:
                  AppFonts.w500s12.copyWith(color: ColorHelper.calendarColor),
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
                Tab(
                  text: "Вс",
                ),
              ],
            ),
             Expanded(
              child: TabBarView(
                // physics: NeverScrollableScrollPhysics(),
                children: tabbarViewChildren
              ),
            )
          ],
        ),
      ),
    );
  }
}
