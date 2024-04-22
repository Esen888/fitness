import 'package:BodyPower/config/dependency_injection/locator.dart';
import 'package:BodyPower/features/achievement_screen/presentation/widgets/graphic_card.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/get_list_of_courses_in_section_bloc/get_list_of_courses_in_section_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/get_sections_list/get_list_of_sections_bloc.dart';
import 'package:BodyPower/features/error_screen/error_screen.dart';
import 'package:BodyPower/features/user/presentation/blocs/get_user_courses_bloc/get_user_courses_bloc.dart';
import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:BodyPower/features/user/presentation/blocs/total_courses_bloc/get_total_user_courses_bloc.dart';
import 'package:BodyPower/features/user/presentation/blocs/user_info_bloc/user_info_bloc.dart';
import 'package:BodyPower/features/user/presentation/screens/sign_up_screen.dart';
import 'package:BodyPower/features/user/presentation/widgets/course_isnot_bought_card.dart';
import 'package:BodyPower/features/user/presentation/widgets/my_courses_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/app_fonts.dart';
import '../widgets/week_schedule_tabbar.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  int selectedSection = 0;
  SharedPreferences preferences = locator<SharedPreferences>();

  String date = DateFormat("yyyy, dd - MMMM").format(DateTime.now());
  bool isBought = true;
  bool showTrainingSchedule = false;

  @override
  void initState() {
    BlocProvider.of<GetListOfSectionsBloc>(context)
        .add(const GetListOfSectionsEvent());
    BlocProvider.of<GetTotalUserCoursesBloc>(context)
        .add(const GetTotalUserCoursesEvent());
    BlocProvider.of<UserInfoBloc>(context).add(const UserInfoEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isAuthorized = preferences.getString("access_token") != null;

    return BlocListener<UserInfoBloc, UserInfoState>(
      listener: (context, state) {
        if (state is UserInfoError) {
          if (state.exception.response?.statusCode == 401) {
            setState(() {
              preferences.remove("access_token");
            });
          }
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  BlocProvider.of<GetListOfCoursesInSectionBloc>(context)
                      .add(const GetListOfCoursesInSectionEvent(id: 1));
                },
                child: Text(
                  "Мои курсы",
                  style: AppFonts.w700s16
                      .copyWith(color: ColorHelper.defaultThemeColor),
                ),
              ),
              isAuthorized
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: SizedBox(
                            height: 20.h,
                            child: BlocBuilder<GetListOfSectionsBloc,
                                GetListOfSectionsState>(
                              builder: (context, state) {
                                if (state is GetListOfSectionsSuccess) {
                                  BlocProvider.of<GetUserCoursesBloc>(context)
                                      .add(GetUserCoursesEvent(
                                          sectionId: selectedSection));
                                  return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.model.data.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 30.w),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedSection = index;
                                                BlocProvider.of<
                                                            GetUserCoursesBloc>(
                                                        context)
                                                    .add(GetUserCoursesEvent(
                                                        sectionId:
                                                            selectedSection));
                                              });
                                            },
                                            child: Text(
                                              state.model.data[index].name,
                                              style: AppFonts.w500s16.copyWith(
                                                  color: selectedSection ==
                                                          index
                                                      ? const Color(0xff90E072)
                                                      : const Color(
                                                          0xff808080)),
                                            ),
                                          ),
                                        );
                                      });
                                } else if (state
                                    is GetListOfCoursesInSectionLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is GetListOfSectionsError) {
                                  if (state.exception.type ==
                                          DioExceptionType.sendTimeout ||
                                      state.exception.type ==
                                          DioExceptionType.connectionError ||
                                      state.exception.type ==
                                          DioExceptionType.receiveTimeout) {
                                    return Center(
                                        child: Text(
                                      "Проблемы соединения с интернетом, Проверьте интернет подключение.",
                                      style: AppFonts.w500s12.copyWith(
                                          color: ColorHelper.defaultThemeColor),
                                    ));
                                    // return const ErrorScreen(
                                    //   isInternetError: true,
                                    // );
                                  } else if (state
                                          .exception.response?.statusCode ==
                                      401) {
                                    return Center(
                                      child: GraphicCard(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUpScreen()));
                                        },
                                        error: "Вы еще не авторизовались",
                                        emodji: '🙃',
                                        buttonTitle: "Войти в аккаунт",
                                      ),
                                    );
                                  }
                                  return Center(
                                      child: Text(
                                    "Что то пошло не так",
                                    style: AppFonts.w500s12.copyWith(
                                        color: ColorHelper.defaultThemeColor),
                                  ));
                                  // return const ErrorScreen(
                                  //   isInternetError: false,
                                  // );
                                }
                                return const SizedBox();
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 180.h,
                          child: BlocBuilder<GetUserCoursesBloc,
                              GetUserCoursesState>(
                            builder: (context, state) {
                              if (state is GetUserCoursesLoading) {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              } else if (state is GetUserCoursesSuccess) {
                                int amountOfMyCourses =
                                    state.model.data?.data?.length ?? 0;
                                // showTrainingSchedule = amountOfMyCourses != 0;
                                return amountOfMyCourses != 0
                                    ? ListView.builder(
                                        itemCount:
                                            state.model.data?.data?.length ?? 0,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4.h),
                                            child: MyCoursesCard(
                                              courseImage: state.model.data
                                                      ?.data?[index].imageUrl ??
                                                  "",
                                              courseTitle: state
                                                      .model
                                                      .data
                                                      ?.data?[index]
                                                      .description ??
                                                  "",
                                            ),
                                          );
                                        })
                                    : const Center(
                                        child: CourseIsNotBoughtCard(
                                        text:
                                            "У вас еще нет\nкурсов в этом разделе",
                                      ));
                              } else if (state is GetUserCoursesError) {
                                return Center(
                                  child: Text(
                                    state.errorText,
                                    style: AppFonts.w500s12.copyWith(
                                        color: ColorHelper.defaultThemeColor),
                                  ),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        )
                      ],
                    )
                  : GraphicCard(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      error: "Вы еще не авторизовались",
                      emodji: '🙃',
                      buttonTitle: "Войти в аккаунт",
                    ),

              Text(
                "Расписание тренировок",
                style: AppFonts.w700s16
                    .copyWith(color: ColorHelper.defaultThemeColor),
              ),
              BlocListener<GetTotalUserCoursesBloc, GetTotalUserCoursesState>(
                listener: (context, state) {
                  if (state is GetTotalUserCoursesSuccess) {
                    if (state.model.data?.isNotEmpty ?? false) {
                      setState(() {
                        showTrainingSchedule = true;
                      });
                    }
                  }
                },
                child: SizedBox(height: 28.h),
              ),
              Text(
                date.toString(),
                style:
                    AppFonts.w500s10.copyWith(color: ColorHelper.calendarColor),
              ),
              isAuthorized
                  ? showTrainingSchedule
                      ? const WeekScheduleTabbar()
                      : GraphicCard(
                          buttonTitle: "Сделать расписание",
                          onTap: () {},
                          error: "Расписание нет, пока вы не добавите курсы",
                          emodji: '🤨',
                        )
                  : GraphicCard(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      error: "Вы еще не авторизовались",
                      emodji: '🙃',
                      buttonTitle: "Войти в аккаунт",
                    ),
              // isBought
              //     ? const TrainingScheduleCard()
              //     : const TrainingsIsNotAddedCard(),
            ],
          ),
        ),
      ),
    );
  }
}
