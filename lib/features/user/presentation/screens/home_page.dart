import 'package:BodyPower/features/error_screen/error_screen.dart';
import 'package:BodyPower/features/user/presentation/widgets/course_isnot_bought_card.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../../../blogger/presentation/logic/bloc/blogger_bloc.dart';
import '../widgets/my_course_card.dart';
import '../widgets/week_schedule_tabbar.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String date = DateFormat("yyyy, dd - MMMM").format(DateTime.now());
  bool isBought = true;
  @override
  void initState() {
    getBloggers(context);
    super.initState();
  }

  void getBloggers(context) {
    BlocProvider.of<BloggerBloc>(context).add(
      GetBloggersEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BloggerBloc, BloggerState>(
      listener: (context, state) {
        if (state is ErrorState) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ErrorScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is BloggerLoadingState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (state is FetchedBloggersState) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Мои курсы",
                    style: TextHelper.w700s16
                        .copyWith(color: ColorHelper.defaultThemeColor),
                  ),
                  isBought
                      ? const MyCourseCard()
                      : const CourseIsNotBoughtCard(),
                  Text(
                    "Расписание тренировок",
                    style: TextHelper.w700s16
                        .copyWith(color: ColorHelper.defaultThemeColor),
                  ),
                  SizedBox(height: 28.h),
                  Text(
                    date.toString(),
                    style: TextHelper.w500s10
                        .copyWith(color: ColorHelper.alwaysGreyColor),
                  ),
                  WeekScheduleTabbar(),
                  // isBought
                  //     ? const TrainingScheduleCard()
                  //     : const TrainingsIsNotAddedCard(),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
