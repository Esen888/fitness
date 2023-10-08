import 'package:BodyPower/features/user/presentation/widgets/training_schedule_card.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/text_helper.dart';

class WeekScheduleTabbar extends StatefulWidget {
  const WeekScheduleTabbar({super.key});

  @override
  State<WeekScheduleTabbar> createState() => _WeekScheduleTabbarState();
}

class _WeekScheduleTabbarState extends State<WeekScheduleTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    _checkDayOfTheWeek();

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _checkDayOfTheWeek() {
    final dayOfTheWeek = DateTime.now().weekday;
    switch (dayOfTheWeek) {
      case 1:
        _tabController.animateTo(0);
        break;
      case 2:
        _tabController.animateTo(1);
        break;
      case 3:
        _tabController.animateTo(2);
        break;
      case 4:
        _tabController.animateTo(3);
        break;
      case 5:
        _tabController.animateTo(4);
        break;
      case 6:
        _tabController.animateTo(5);
        break;
      default:
        _tabController.animateTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: _tabController,
            padding: EdgeInsets.only(
              bottom: 8.h,
              top: 10.h,
            ),
            labelStyle: TextHelper.w500s12,
            labelColor: ColorHelper.exerciseNameDefaultColor,
            unselectedLabelColor: ColorHelper.alwaysGreyColor,
            indicatorColor: ColorHelper.exerciseNameDefaultColor,
            tabs: const [
              Tab(text: "Пн"),
              Tab(text: "Вт"),
              Tab(text: "Ср"),
              Tab(text: "Чт"),
              Tab(text: "Пт"),
              Tab(text: "Сб"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                TrainingScheduleCard(dayOfTheWeek: 'Monday'),
                TrainingScheduleCard(dayOfTheWeek: 'Tuesday'),
                TrainingScheduleCard(dayOfTheWeek: 'Wednesday'),
                TrainingScheduleCard(dayOfTheWeek: 'Thursday'),
                TrainingScheduleCard(dayOfTheWeek: 'Friday'),
                TrainingScheduleCard(dayOfTheWeek: 'Saturday'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
