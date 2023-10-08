import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/custom_appbar.dart';
import '../widgets/approach_card.dart';
import '../widgets/select_exercise_dropdown.dart';
import '../widgets/training_gift_card.dart';
import '../widgets/weight_repeat_add_card.dart';

class TrainingScreen extends StatefulWidget {
  final String exerciseName;
  const TrainingScreen({super.key, required this.exerciseName});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  late PageController _controllerLottie;

  @override
  void initState() {
    _controllerLottie = PageController(viewportFraction: 0.8, keepPage: false);
    super.initState();
  }

  @override
  void dispose() {
    _controllerLottie.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 34.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 24.r,
                        color: ColorHelper.defaultThemeColor,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "${widget.exerciseName}  ",
                        style: TextHelper.w700s20.copyWith(
                            color: ColorHelper.exerciseNameDefaultColor),
                      ),
                    ),
                    Icon(
                      Icons.timer_outlined,
                      size: 12.r,
                      color: ColorHelper.defaultThemeColor,
                    ),
                    Flexible(
                      child: Text(
                        " Время: 0 сек",
                        style: TextHelper.w500s12
                            .copyWith(color: ColorHelper.defaultThemeColor),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 6.h,
                    right: 34.w,
                    left: 40.w,
                    bottom: 16.h,
                  ),
                  child: Text(
                    "3 упражнения (жим, вертикальная тяга, разведение гантелей, пуловер на блоке, подъем ног)",
                    style: TextHelper.w500s12
                        .copyWith(color: ColorHelper.exercisesListColor),
                  ),
                ),
                const SelectExerciseDropDown(),
                const TrainingGiftCard(),
                const ApproachCards(),
                const WeightRepeatAddCard(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 18.h,
                    left: 24.w,
                  ),
                  child: Text(
                    "Рекомендуемое время отдыха — 2 минуты",
                    style: TextHelper.w500s12
                        .copyWith(color: ColorHelper.recommendedTime),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      bottom: 24.h,
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorHelper.buttonColor,
                          fixedSize: Size(
                            263.w,
                            40.h,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r))),
                      child: Text(
                        "Начать тренировку",
                        textAlign: TextAlign.center,
                        style: TextHelper.w600s12
                            .copyWith(color: ColorHelper.buttonTextColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const List<String> approachList = <String>['1', '2', '3', '4', '5', '6'];
const List<String> weightList = <String>['10', '15', '20', '25'];
const List<String> repetitionList = <String>['8', '10', '12', '14', '16', '18'];
