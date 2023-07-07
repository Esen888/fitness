import 'package:BodyPower/features/achievement_screen/presentation/widgets/graphic_card.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/my_achievement_widget.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 46.h,
          horizontal: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAchievementWidget(),
            SizedBox(height: 22.h),
            Text(
              "График текущего веса",
              style: TextHelper.w700s16.copyWith(
                color: ColorHelper.defaultThemeColor,
              ),
            ),
            GraphicCard(
              error: 'Текущего веса нет',
              emodji: '🙃',
            ),
            Text(
              "Максимальные показатели",
              style: TextHelper.w700s16.copyWith(
                color: ColorHelper.defaultThemeColor,
              ),
            ),
            GraphicCard(
              error: 'Пока достижений нет',
              emodji: '🤔',
            ),
          ],
        ),
      ),
    );
  }
}
