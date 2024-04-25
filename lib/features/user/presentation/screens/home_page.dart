import 'package:BodyPower/config/dependency_injection/locator.dart';
import 'package:BodyPower/features/achievement_screen/presentation/widgets/graphic_card.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/get_list_of_courses_in_section_bloc/get_list_of_courses_in_section_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/get_sections_list/get_list_of_sections_bloc.dart';
import 'package:BodyPower/features/user/presentation/blocs/cource_bloc/cource_bloc.dart';
import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:BodyPower/features/user/presentation/blocs/total_courses_bloc/get_total_user_courses_bloc.dart';
import 'package:BodyPower/features/user/presentation/blocs/user_info_bloc/user_info_bloc.dart';
import 'package:BodyPower/features/user/presentation/screens/sign_up_screen.dart';
import 'package:BodyPower/features/user/presentation/screens/video_player_screen.dart';
import 'package:BodyPower/features/user/presentation/widgets/course_isnot_bought_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/app_fonts.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  int selectedSection = 0;
  int selectedCourseId = 1;
  int selectedWeek = 0;
  late TabController _controller;
  List<Widget> tabs = const <Widget>[
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
  ];
  SharedPreferences preferences = locator<SharedPreferences>();

  String date = DateFormat("yyyy, dd - MMMM").format(DateTime.now());
  bool isBought = true;
  bool showTrainingSchedule = false;

  @override
  void initState() {
    _controller = TabController(length: tabs.length, vsync: this);
    BlocProvider.of<GetListOfSectionsBloc>(context)
        .add(const GetListOfSectionsEvent());
    BlocProvider.of<GetTotalUserCoursesBloc>(context)
        .add(const GetTotalUserCoursesEvent());
    BlocProvider.of<UserInfoBloc>(context).add(const UserInfoEvent());

    BlocProvider.of<CourceBloc>(context)
        .add(CourceEvent(courceId: selectedCourseId));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                  ? showTrainingSchedule
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: BlocBuilder<GetTotalUserCoursesBloc,
                              GetTotalUserCoursesState>(
                            builder: (context, state) {
                              if (state is GetTotalUserCoursesSuccess) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10.h),
                                      child: SizedBox(
                                        height: 20.h,
                                        child: ListView.builder(
                                            // padding: EdgeInsets.zero,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                state.model.data?.length ?? 0,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  right: 30.w,
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedCourseId = state
                                                              .model
                                                              .data?[index]
                                                              .id ??
                                                          1;
                                                      selectedSection = index;
                                                      BlocProvider.of<
                                                                  CourceBloc>(
                                                              context)
                                                          .add(CourceEvent(
                                                              courceId:
                                                                  selectedCourseId));
                                                    });
                                                  },
                                                  child: Text(
                                                    state.model.data?[index]
                                                            .name ??
                                                        "",
                                                    style: AppFonts.w500s16.copyWith(
                                                        color: selectedSection ==
                                                                index
                                                            ? const Color(
                                                                0xff90E072)
                                                            : const Color(
                                                                0xff808080)),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 180.h,
                                    //   child: ClipRRect(
                                    //     borderRadius: BorderRadius.circular(14.r),
                                    //     child: MyCoursesCard(
                                    //       courseImage: state
                                    //               .model
                                    //               .data?[selectedSection]
                                    //               .imageUrl ??
                                    //           "",
                                    //       courseTitle: state.model
                                    //               .data?[selectedSection].name ??
                                    //           "",
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                );
                              } else if (state is GetTotalUserCoursesLoading) {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              } else if (state is GetTotalUserCoursesError) {
                                return Center(
                                    child: Text(
                                  state.errorText,
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
                        )
                      : const CourseIsNotBoughtCard()
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
                      ? Expanded(child: BlocBuilder<CourceBloc, CourceState>(
                          builder: (context, state) {
                            if (state is CourceLoading) {
                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            } else if (state is CourceSuccess) {
                              return Column(children: [
                                SizedBox(
                                    height: 20.h,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            state.model.data?.weeks?.length ??
                                                0,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(left: 25.w),
                                            child: InkWell(
                                              onTap: () {
                                                print(index);
                                                setState(() {
                                                  selectedWeek = index;
                                                });
                                              },
                                              child: Text(
                                                "Неделя ${index + 1}",
                                                style: AppFonts.w500s16
                                                    .copyWith(
                                                        color: selectedWeek ==
                                                                index
                                                            ? const Color(
                                                                0xff90E072)
                                                            : const Color(
                                                                0xff808080)),
                                              ),
                                            ),
                                          );
                                        })),

                                //  const WeekScheduleTabbar()
                                Expanded(
                                  child: DefaultTabController(
                                    initialIndex: 0,
                                    length: 7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        TabBar(
                                            padding: EdgeInsets.only(
                                              bottom: 8.h,
                                              top: 10.h,
                                            ),
                                            labelStyle: AppFonts.w500s12
                                                .copyWith(
                                                    color: ColorHelper
                                                        .calendarColor),
                                            labelColor: ColorHelper
                                                .exerciseNameDefaultColor,
                                            unselectedLabelColor:
                                                const Color(0xff929292),
                                            indicatorColor: ColorHelper
                                                .exerciseNameDefaultColor,
                                            tabs: tabs),
                                        Expanded(
                                            child: TabBarView(
                                          // physics: NeverScrollableScrollPhysics(),
                                          children: <Widget>[
                                            for (int i = 0;
                                                i < tabs.length;
                                                i++)
                                              ListView.builder(
                                                  itemCount: state
                                                          .model
                                                          .data
                                                          ?.weeks
                                                          ?.first
                                                          .days?[i]
                                                          .exercises
                                                          ?.length ??
                                                      0,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        print(state
                                                            .model
                                                            .data
                                                            ?.weeks?[
                                                                selectedWeek]
                                                            .days?[_controller
                                                                .index]
                                                            .exercises?[i]
                                                            .video);
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => VideoPlayerScreen(
                                                                    videoLink: state
                                                                            .model
                                                                            .data
                                                                            ?.weeks?[selectedWeek]
                                                                            .days?[_controller.index]
                                                                            .exercises?[i]
                                                                            .video ??
                                                                        "")));
                                                      },
                                                      child: Container(
                                                        height: 170.h,
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 13.h),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .vertical(
                                                            top: index == 0
                                                                ? Radius
                                                                    .circular(
                                                                        14.r)
                                                                : const Radius
                                                                    .circular(
                                                                    0),
                                                            bottom: index ==
                                                                    (state.model.data?.weeks?.first.days?[i].exercises?.length ??
                                                                            0) -
                                                                        1
                                                                ? Radius
                                                                    .circular(
                                                                        14.r)
                                                                : const Radius
                                                                    .circular(
                                                                    0),
                                                          ),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(state
                                                                    .model
                                                                    .data
                                                                    ?.weeks
                                                                    ?.first
                                                                    .days?[i]
                                                                    .exercises?[
                                                                        index]
                                                                    .imageUrl ??
                                                                ""),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              state
                                                                      .model
                                                                      .data
                                                                      ?.weeks?[
                                                                          i]
                                                                      .days?[i]
                                                                      .exercises?[
                                                                          index]
                                                                      .name ??
                                                                  "",
                                                              style: AppFonts
                                                                  .w500s16
                                                                  .copyWith(
                                                                      color: ColorHelper
                                                                          .alwaysWhiteFFFFFF),
                                                            ),
                                                            Text(
                                                              "${index + 1} упражнение",
                                                              style: AppFonts.w500s10.copyWith(
                                                                  color: ColorHelper
                                                                      .alwaysWhiteFFFFFF
                                                                      .withOpacity(
                                                                          0.5)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  })
                                          ],
                                        ))
                                      ],
                                    ),
                                  ),
                                )
                              ]);
                            } else if (state is CourceError) {
                              return Center(
                                child: Text(state.errorText),
                              );
                            }
                            return const Text('dadrare');
                          },
                        ))
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
                    )
            ],
          ),
        ),

        // isBought
        //     ? const TrainingScheduleCard()
        //     : const TrainingsIsNotAddedCard(),
      ),
    );
  }
}
