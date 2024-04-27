import 'package:BodyPower/bottom_navigation_bar.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/buy_course_bloc/buy_course_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/get_trial_version_bloc/get_trial_version_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/provider/default_course_index.dart';
import 'package:BodyPower/features/blogger/presentation/screens/buy_course_screen.dart';
import 'package:BodyPower/internal/custom_appbar.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/about_course_card.dart';

class CourseInformationScreen extends StatelessWidget {
  final String titleOfCourse;
  final String description;
  final int courseId;
  const CourseInformationScreen(
      {super.key,
      required this.titleOfCourse,
      required this.description,
      required this.courseId});

  @override
  Widget build(BuildContext context) {
    print(courseId);
    return LoaderOverlay(
      child: Scaffold(
        appBar: const CustomAppBar(),
        backgroundColor: ColorHelper.backgroundColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 34.h,
              horizontal: 16.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 24.r,
                        color: ColorHelper.defaultThemeColor,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titleOfCourse,
                            // "Стань повелителем своего тела с курсом по похудению",
                            style: AppFonts.w700s20
                                .copyWith(color: ColorHelper.defaultThemeColor),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "24 тренировочных дня (3 тренировки в неделю)",
                            style: AppFonts.w500s12.copyWith(
                                color: ColorHelper.exercisesListColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                AboutCourseCard(
                  description: description,
                ),
                Center(
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: 12.h,
                        bottom: 18.h,
                      ),
                      child: BlocListener<GetTrialVersionBloc,
                          GetTrialVersionState>(
                        listener: (context, state) {
                          if (state is GetTrialVersionSucces) {
                            context
                                .read<DefaultCourseIndexProvider>()
                                .changeIndex(index: courseId);
                          

                            QuickAlert.show(
                              context: context,
                              title: "Успех",
                              type: QuickAlertType.success,
                              text: "Вы успешно получили пробную версию",
                              barrierDismissible: false,
                              confirmBtnText: "Ок",
                              onConfirmBtnTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BottomNavBar(
                                              selectedTab: 0,
                                            )));
                              },
                            );
                          } else if (state is GetTrialVersionError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.errorText)));
                          }
                        },
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                            263.w,
                            40.h,
                          )),
                          onPressed: () {
                            print(courseId);
                            BlocProvider.of<GetTrialVersionBloc>(context)
                                .add(GetTrialVersionEvent(courseId: courseId));
                          },
                          child: Text(
                            "Получить пробную версию",
                            style: AppFonts.w600s12
                                .copyWith(color: ColorHelper.buttonTextColor),
                          ),
                        ),
                      )),
                ),
                BlocListener<BuyCourseBloc, BuyCourseState>(
                  listener: (context, state) {
                    if (state is BuyCourseSuccess) {
                      context.loaderOverlay.hide();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BuyCourseScreen(
                                  urlOfWeb: state.model.data?.url ?? "")));
                    } else if (state is BuyCourseError) {
                      context.loaderOverlay.hide();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorText)));
                    } else if (state is BuyCourseLoading) {
                      context.loaderOverlay.show();
                    }
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorHelper.green90E072),
                      onPressed: () {
                        BlocProvider.of<BuyCourseBloc>(context)
                            .add(BuyCourseEvent(courseId: courseId));
                      },
                      child: Text(
                        "Получить курс",
                        style: AppFonts.w600s12
                            .copyWith(color: ColorHelper.buttonTextColor),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Курс поможет:",
                  style: AppFonts.w500s16
                      .copyWith(color: ColorHelper.defaultThemeColor),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 18.h,
                    bottom: 20.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 108.w,
                        height: 64.h,
                        decoration: BoxDecoration(
                            color: ColorHelper.cardsBackground,
                            borderRadius: BorderRadius.circular(14.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/charger.png",
                              width: 24.r,
                            ),
                            Expanded(
                              child: Text(
                                "Сжечь жиры и углеводы",
                                style: AppFonts.w500s10.copyWith(
                                    color: ColorHelper.defaultThemeColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 108.w,
                        height: 64.h,
                        decoration: BoxDecoration(
                            color: ColorHelper.cardsBackground,
                            borderRadius: BorderRadius.circular(14.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/health_and_safety.png",
                              width: 24.r,
                            ),
                            Expanded(
                              child: Text(
                                "Укрепить свой здоровый вес",
                                style: AppFonts.w500s10.copyWith(
                                    color: ColorHelper.defaultThemeColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 108.w,
                        height: 64.h,
                        decoration: BoxDecoration(
                            color: ColorHelper.cardsBackground,
                            borderRadius: BorderRadius.circular(14.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/nutrition.png",
                              width: 24.r,
                            ),
                            Expanded(
                              child: Text(
                                "Пополнить запасы  нужных витаминов",
                                style: AppFonts.w500s10.copyWith(
                                    color: ColorHelper.defaultThemeColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
