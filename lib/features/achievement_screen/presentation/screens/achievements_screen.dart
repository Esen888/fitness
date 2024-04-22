import 'package:BodyPower/config/dependency_injection/locator.dart';
import 'package:BodyPower/features/achievement_screen/presentation/blocs/get_weights_list_bloc/get_weights_bloc.dart';
import 'package:BodyPower/features/achievement_screen/presentation/blocs/save_weight_bloc/save_weight_bloc.dart';
import 'package:BodyPower/features/achievement_screen/presentation/widgets/graphic_card.dart';
import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:BodyPower/features/blogger/presentation/blocs/all_courses_bloc/all_courses_bloc.dart';
import 'package:BodyPower/features/error_screen/error_screen.dart';
import 'package:BodyPower/features/user/presentation/screens/sign_up_screen.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/my_achievement_widget.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences preferences = locator<SharedPreferences>();
    bool isAuthorized = preferences.getString("access_token") != null;
    BlocProvider.of<GetWeightsBloc>(context).add(const GetWeightsEvent());
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 46.h,
              horizontal: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocListener<SaveWeightBloc, SaveWeightState>(
                  listener: (context, state) {
                    if (state is SaveWeightSuccess) {
                      QuickAlert.show(
                        context: context,
                        title: "Успех",
                        type: QuickAlertType.success,
                        text: "Успешно сохранили вес",
                        onConfirmBtnTap: () {
                          Navigator.pop(context);
                        },
                      );
                    }
                  },
                  child: BlocListener<SaveWeightBloc, SaveWeightState>(
                    listener: (context, state) {
                      if(state is SaveWeightSuccess){
                        setState(() {
                          
                        });
                      }
                    },
                    child: MyAchievementWidget(
                      controller: _controller,
                      onTap: () {
                        BlocProvider.of<SaveWeightBloc>(context).add(
                            SaveWeightEvent(
                                weight: int.parse(_controller.text)));
                      },
                    ),
                  ),
                ),
                SizedBox(height: 22.h),
                Text(
                  "График текущего веса",
                  style: AppFonts.w700s16.copyWith(
                    color: ColorHelper.defaultThemeColor,
                  ),
                ),
                isAuthorized
                    ? Container(
                        height: 330.h,
                        decoration: BoxDecoration(
                            color: isDarkMode
                                ? const Color(0xff2F2F2F)
                                : const Color(0xffE1E1E1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.r))),
                        child: BlocBuilder<GetWeightsBloc, GetWeightsState>(
                          builder: (context, state) {
                            if (state is GetWeightsSuccess) {
                              int? length = state.model.data?.length ?? 0;
                              List<FlSpot> chartData = [
                                for (int i = 0; i < length; i++)
                                  FlSpot(
                                    i.toDouble(),
                                    double.parse(
                                        state.model.data?[i].weight ?? ""),
                                  ),
                              ];
                              return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SizedBox(
                                      width: (length * 52.w),
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AspectRatio(
                                            aspectRatio: 1,
                                            child: LineChart(
                                              LineChartData(
                                                minX: 0,
                                                maxX: length.toDouble(),
                                                minY: 0,
                                                maxY: 170,
                                                clipData:
                                                    const FlClipData.all(),
                                                lineBarsData: [
                                                  LineChartBarData(
                                                    color: isDarkMode
                                                        ? const Color(
                                                            0xff90E072)
                                                        : const Color(
                                                            0xffBBFFA3),
                                                    spots: chartData,
                                                    isCurved: false,
                                                    barWidth: 5,
                                                    isStrokeCapRound: true,
                                                    dotData: FlDotData(
                                                      getDotPainter: (p0, p1,
                                                              p2, p3) =>
                                                          FlDotCirclePainter(
                                                        color: const Color(
                                                            0xff90E072),
                                                        radius: 6,
                                                      ),
                                                      show: true,
                                                    ),
                                                    belowBarData: BarAreaData(
                                                        show: false),
                                                  ),
                                                ],
                                                titlesData: FlTitlesData(
                                                    topTitles:
                                                        const AxisTitles(),
                                                    leftTitles:
                                                        const AxisTitles(),
                                                    rightTitles:
                                                        const AxisTitles(),
                                                    bottomTitles: AxisTitles(
                                                        sideTitles: SideTitles(
                                                      showTitles: true,
                                                      getTitlesWidget:
                                                          (value, meta) {
                                                        return Text(
                                                          "${(value + 1).toInt().toString()} неделя",
                                                          style: AppFonts.w500s10.copyWith(
                                                              color: isDarkMode
                                                                  ? const Color(
                                                                      0xff878787)
                                                                  : const Color(
                                                                      0xff464646)),
                                                        );
                                                      },
                                                    ))),
                                                gridData: FlGridData(
                                                  show: true,
                                                  // verticalInterval: 9,
                                                  horizontalInterval: 10,
                                                  // verticalInterval: 0.1,
                                                  drawHorizontalLine: true,
                                                  drawVerticalLine: true,
                                                  getDrawingHorizontalLine:
                                                      (value) => const FlLine(
                                                    color: Color(0xffB0B0B0),
                                                    strokeWidth: 1,
                                                  ),
                                                  getDrawingVerticalLine:
                                                      (value) => const FlLine(
                                                    color: Color(0xffB0B0B0),
                                                    strokeWidth: 1,
                                                  ),
                                                ),
                                                borderData: FlBorderData(
                                                    show: true,
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffB0B0B0),
                                                        width: 1)),
                                                lineTouchData: LineTouchData(
                                                  touchTooltipData:
                                                      LineTouchTooltipData(
                                                    getTooltipItems:
                                                        (List<LineBarSpot>
                                                            touchedSpots) {
                                                      return touchedSpots.map(
                                                          (LineBarSpot
                                                              touchedSpot) {
                                                        return LineTooltipItem(
                                                          '${touchedSpot.y} кг',
                                                          const TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        );
                                                      }).toList();
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ))));
                            } else if (state is GetWeightsError) {
                              if (state.exception.type ==
                                      DioExceptionType.sendTimeout ||
                                  state.exception.type ==
                                      DioExceptionType.connectionError ||
                                  state.exception.type ==
                                      DioExceptionType.receiveTimeout) {
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
                        ),
                      )
                    : GraphicCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        error: 'Текущего веса нет',
                        emodji: '🙃',
                        buttonTitle: "Войти в аккаунт",
                      ),
                // Padding(
                //   padding: EdgeInsets.only(top: 42.h),
                //   child: Text(
                //     "Максимальные показатели",
                //     style: AppFonts.w700s16.copyWith(
                //       color: ColorHelper.defaultThemeColor,
                //     ),
                //   ),
                // ),
                // isAuthorized
                //     ? Container(
                //         padding: const EdgeInsets.all(16),
                //         height: 172.h,
                //         decoration: BoxDecoration(
                //             color: const Color(0xff2F2F2F),
                //             borderRadius: BorderRadius.circular(14.r)),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               "Упражнение",
                //               style: AppFonts.w500s12
                //                   .copyWith(color: const Color(0xff929292)),
                //             ),
                //             Text(
                //               "Вес",
                //               style: AppFonts.w500s12
                //                   .copyWith(color: const Color(0xff929292)),
                //             ),
                //             Text(
                //               "Дата выполнения",
                //               style: AppFonts.w500s12
                //                   .copyWith(color: const Color(0xff929292)),
                //             ),
                //           ],
                //         ),
                //       )
                //     : const GraphicCard(
                //         error: 'Пока достижений нет',
                //         emodji: '🤔',
                //       ),
              ],
            )));
  }
}
