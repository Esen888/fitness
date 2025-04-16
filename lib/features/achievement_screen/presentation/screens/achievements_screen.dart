import 'package:fitness/config/dependency_injection/locator.dart';
import 'package:fitness/features/achievement_screen/presentation/blocs/get_weights_list_bloc/get_weights_bloc.dart';
import 'package:fitness/features/achievement_screen/presentation/blocs/save_weight_bloc/save_weight_bloc.dart';
import 'package:fitness/features/achievement_screen/presentation/widgets/graphic_card.dart';
import 'package:fitness/core/utils/app_colors.dart';
import 'package:fitness/core/utils/app_fonts.dart';
import 'package:fitness/features/error_screen/error_screen.dart';
import 'package:fitness/features/user/presentation/screens/sign_up_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/my_achievement_widget.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  final TextEditingController _controller = TextEditingController();
  List<_WeightData> chartData = [];
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

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
        padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocListener<SaveWeightBloc, SaveWeightState>(
              listener: (context, state) {
                if (state is SaveWeightSuccess) {
                  QuickAlert.show(
                    context: context,
                    title: "✅ Успех",
                    type: QuickAlertType.success,
                    text: "Ваш вес успешно сохранён!",
                    confirmBtnText: "OK",
                    confirmBtnColor: Colors.green,
                    onConfirmBtnTap: () => Navigator.pop(context),
                  );
                  BlocProvider.of<GetWeightsBloc>(context)
                      .add(const GetWeightsEvent());
                }
              },
              child: MyAchievementWidget(
                controller: _controller,
                onTap: () {
                  BlocProvider.of<SaveWeightBloc>(context).add(
                    SaveWeightEvent(weight: double.parse(_controller.text)),
                  );
                },
              ),
            ),
            SizedBox(height: 22.h),
            Text(
              "📊 График изменения веса",
              style: AppFonts.w700s18.copyWith(
                color: ColorHelper.defaultThemeColor,
              ),
            ),
            SizedBox(height: 12.h),
            isAuthorized
                ? Container(
                    height: 350.h,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color(0xff1E1E1E)
                          : const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.all(Radius.circular(14.r)),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode
                              ? Colors.black.withOpacity(0.2)
                              : Colors.grey.withOpacity(0.15),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(12),
                    child: BlocBuilder<GetWeightsBloc, GetWeightsState>(
                      builder: (context, state) {
                        if (state is GetWeightsSuccess) {
                          int length = state.model.data?.length ?? 0;
                          chartData = [
                            for (int i = 0; i < length; i++)
                              _WeightData(
                                week: "Нед ${i + 1}",
                                weight: double.parse(
                                    state.model.data?[i].weight.toString() ??
                                        "0"),
                              ),
                          ];

                          return SfCartesianChart(
                            primaryXAxis: CategoryAxis(
                              axisLine: AxisLine(
                                color: Colors.grey.shade600,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 12.sp,
                                color: isDarkMode
                                    ? Colors.white70
                                    : Colors.black54,
                              ),
                            ),
                            primaryYAxis: NumericAxis(
                              minimum: 0,
                              maximum: 170,
                              interval: 10,
                              axisLine: AxisLine(color: Colors.grey.shade600),
                              labelStyle: TextStyle(
                                fontSize: 12.sp,
                                color: isDarkMode
                                    ? Colors.white70
                                    : Colors.black54,
                              ),
                              majorGridLines: MajorGridLines(
                                color: isDarkMode
                                    ? Colors.white24
                                    : Colors.grey.shade300,
                              ),
                            ),
                            tooltipBehavior: _tooltipBehavior,
                            series: [
                              SplineAreaSeries<_WeightData, String>(
                                dataSource: chartData,
                                xValueMapper: (_WeightData data, _) =>
                                    data.week,
                                yValueMapper: (_WeightData data, _) =>
                                    data.weight,
                                gradient: LinearGradient(
                                  colors: [
                                    isDarkMode
                                        ? const Color(0xff90E072)
                                            .withOpacity(0.3)
                                        : const Color(0xffBBFFA3)
                                            .withOpacity(0.3),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderColor: isDarkMode
                                    ? const Color(0xff90E072)
                                    : const Color(0xffBBFFA3),
                                borderWidth: 3,
                                markerSettings: MarkerSettings(
                                  isVisible: true,
                                  height: 8,
                                  width: 8,
                                  shape: DataMarkerType.circle,
                                  borderColor: Colors.white,
                                  borderWidth: 2,
                                ),
                              ),
                            ],
                          );
                        } else if (state is GetWeightsError) {
                          return state.exception.type ==
                                      DioExceptionType.sendTimeout ||
                                  state.exception.type ==
                                      DioExceptionType.connectionError ||
                                  state.exception.type ==
                                      DioExceptionType.receiveTimeout
                              ? const ErrorScreen(isInternetError: true)
                              : const ErrorScreen(isInternetError: false);
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  )
                : GraphicCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    error: '⚠️ Данные о весе отсутствуют',
                    emodji: '🙃',
                    buttonTitle: "Войти в аккаунт",
                  ),
          ],
        ),
      ),
    );
  }
}

/// 📌 **Data model for weight tracking**
class _WeightData {
  final String week;
  final double weight;
  _WeightData({required this.week, required this.weight});
}
