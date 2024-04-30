import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/all_courses_bloc/all_courses_bloc.dart';
import 'package:BodyPower/features/blogger/presentation/screens/course_information_screen.dart';
import 'package:BodyPower/features/blogger/presentation/widgets/custom_cource_card.dart';
import 'package:BodyPower/features/error_screen/error_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllAvailableCouseScreen extends StatefulWidget {
  const AllAvailableCouseScreen({super.key});

  @override
  State<AllAvailableCouseScreen> createState() =>
      _AllAvailableCouseScreenState();
}

class _AllAvailableCouseScreenState extends State<AllAvailableCouseScreen> {
  @override
  void initState() {
    BlocProvider.of<AllCoursesBloc>(context).add(const AllCoursesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      body: SafeArea(child: BlocBuilder<AllCoursesBloc, AllCoursesState>(
        builder: (context, state) {
          if (state is AllCoursesLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is AllCoursesSuccess) {
            int listLength = state.model.data?.data?.length ?? 0;
            final model = state.model.data?.data;
            return Column(
              children: [
                Text(
                  "Все курсы",
                  style: AppFonts.w700s20
                      .copyWith(color: ColorHelper.defaultThemeColor),
                ),
                Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: listLength,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 15.h),
                            child: CustomCourceCard(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CourseInformationScreen(
                                              sectionId: model?[index]
                                                      .blogger
                                                      ?.sectionId ??
                                                  0,
                                              videoLink: model?[index]
                                                      .videoLink ??
                                                  "https://youtu.be/-vxLIDD01uY?si=dpmu39uLT3520XLd",
                                              titleOfCourse:
                                                  model?[index].name ?? "",
                                              description:
                                                  model?[index].description ??
                                                      "",
                                              courseId: model?[index].id ?? 0,
                                            )));
                              },
                              photoOfCource: model?[index].imageUrl ?? "",
                              nameOfBloger: model?[index].blogger?.name ?? "",
                              nameOfCource: model?[index].name ?? "",
                            ),
                          );
                        }))
              ],
            );
          } else if (state is AllCoursesError) {
            if (state.exception.type == DioExceptionType.sendTimeout ||
                state.exception.type == DioExceptionType.connectionError ||
                state.exception.type == DioExceptionType.receiveTimeout) {
              return const ErrorScreen(
                isInternetError: true,
              );
            } else {
              return const ErrorScreen(
                isInternetError: false,
              );
            }
          }
          return const SizedBox();
        },
      )),
    );
  }
}
