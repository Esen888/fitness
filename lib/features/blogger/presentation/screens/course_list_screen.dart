import 'package:BodyPower/config/dependency_injection/locator.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/get_courses_for_guests_bloc/get_courses_for_guests_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/get_list_of_courses_in_section_bloc/get_list_of_courses_in_section_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/get_sections_list/get_list_of_sections_bloc.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:BodyPower/features/blogger/presentation/screens/course_information_screen.dart';
import 'package:BodyPower/features/blogger/presentation/widgets/custom_cource_card.dart';
import 'package:BodyPower/features/error_screen/error_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/app_colors.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen>
    with SingleTickerProviderStateMixin {
  int selectedSection = 0;
  SharedPreferences preferences = locator<SharedPreferences>();

  @override
  void initState() {
    BlocProvider.of<GetListOfSectionsBloc>(context)
        .add(const GetListOfSectionsEvent());
    BlocProvider.of<GetCoursesForGuestsBloc>(context)
        .add(const GetCoursesForGuestsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetListOfCoursesInSectionBloc>(context)
        .add(GetListOfCoursesInSectionEvent(id: selectedSection));
    bool isAuthorized = preferences.getString("access_token") != null;
    return isAuthorized
        ? BlocBuilder<GetListOfSectionsBloc, GetListOfSectionsState>(
            builder: (context, state) {
            if (state is GetListOfSectionLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is GetListOfSectionsSuccess) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 28.h, top: 10.h),
                      child: Text(
                        "Программы тренировок",
                        style: AppFonts.w700s20
                            .copyWith(color: ColorHelper.defaultThemeColor),
                      ),
                    ),
                    // CustomCourseContainer(
                    //   gender: context.watch<ChangeGenderProvider>().gender,
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: SizedBox(
                        height: 20.h,
                        child: BlocBuilder<GetListOfSectionsBloc,
                            GetListOfSectionsState>(
                          builder: (context, state) {
                            if (state is GetListOfSectionsSuccess) {
                              return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.model.data.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: 30.w,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedSection = index;
                                          });
                                          BlocProvider.of<
                                                      GetListOfCoursesInSectionBloc>(
                                                  context)
                                              .add(
                                                  GetListOfCoursesInSectionEvent(
                                                      id: selectedSection));
                                        },
                                        child: Text(
                                          state.model.data[index].name,
                                          style: AppFonts.w500s16.copyWith(
                                              color: selectedSection == index
                                                  ? (isDarkMode
                                                      ? const Color(0xffE1E1E1)
                                                      : Colors.black)
                                                  : const Color(0xff929292)),
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
                                return const ErrorScreen(
                                  isInternetError: true,
                                );
                              }
                              return const ErrorScreen(
                                isInternetError: false,
                              );
                            }
                            return const Text(
                              "",
                              style: TextStyle(color: Colors.white),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      // height: 343.h,
                      child: BlocBuilder<GetListOfCoursesInSectionBloc,
                          GetListOfCoursesInSectionState>(
                        builder: (context, state) {
                          if (state is GetListOfCoursesInSectionSuccess) {
                            int itemCount = state.model.data?.data?.length ?? 0;
                            return itemCount != 0
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: state.model.data?.data?.length,
                                    itemBuilder: (context, index) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7.h),
                                          child: CustomCourceCard(
                                              onTap: () {
                                                print(state.model.data?.data?[index].id);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CourseInformationScreen(
                                                              courseId: state
                                                                      .model
                                                                      .data
                                                                      ?.data?[
                                                                          index]
                                                                      .id ??
                                                                  0,
                                                              titleOfCourse: state
                                                                      .model
                                                                      .data
                                                                      ?.data?[
                                                                          index]
                                                                      .name ??
                                                                  "",
                                                              description: state
                                                                      .model
                                                                      .data
                                                                      ?.data?[
                                                                          index]
                                                                      .name ??
                                                                  "",
                                                            ))
                                                            );
                                              },
                                              photoOfCource: state.model.data
                                                      ?.data?[index].imageUrl ??
                                                  "",
                                              nameOfCource: state.model.data
                                                      ?.data?[index].name ??
                                                  "name",
                                              nameOfBloger: state
                                                      .model
                                                      .data
                                                      ?.data?[index]
                                                      .blogger
                                                      ?.name ??
                                                  ""),
                                        ))
                                : Center(
                                    child: Text("Список пуст",
                                        style: AppFonts.w600s16.copyWith(
                                            color:
                                                ColorHelper.defaultThemeColor)),
                                  );
                          } else if (state
                              is GetListOfCoursesInSectionLoading) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (state is GetListOfCoursesInSectionError) {
                            return Center(
                              child: Text(
                                "Список пуст",
                                style: AppFonts.w700s16
                                    .copyWith(color: Colors.white),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    )
                  ],
                ),
              );
            }
            return const SizedBox();
          })
        : Expanded(
            child:
                BlocBuilder<GetCoursesForGuestsBloc, GetCoursesForGuestsState>(
              builder: (context, state) {
                if (state is GetCoursesForGuestsLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is GetCoursesForGuestsSuccess) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.model.data?.data?.length,
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 7.h, horizontal: 16.w),
                            child: CustomCourceCard(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CourseInformationScreen(
                                                courseId: state.model.data
                                                        ?.data?[index].id ??
                                                    0,
                                                titleOfCourse: state.model.data
                                                        ?.data?[index].name ??
                                                    "",
                                                description: state.model.data
                                                        ?.data?[index].name ??
                                                    "",
                                              )));
                                },
                                photoOfCource:
                                    state.model.data?.data?[index].imageUrl ??
                                        "",
                                nameOfCource:
                                    state.model.data?.data?[index].name ??
                                        "name",
                                nameOfBloger: state.model.data?.data?[index]
                                        .blogger?.name ??
                                    ""),
                          ));
                } else if (state is GetCoursesForGuestsError) {
                  return Text(
                    state.errorText,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.w700s20
                        .copyWith(color: ColorHelper.defaultThemeColor),
                  );
                }
                return const SizedBox();
              },
            ),
          );
    // Center(
    //     child: GraphicCard(

    //       buttonTitle: "Войти в аккаунт",
    //       onTap: () {
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) => const SignUpScreen()));
    //       },
    //       error: 'Вы не вошли в аккаунт',
    //       emodji: '🙃',
    //     ),
    //   );
  }
}
