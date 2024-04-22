import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:BodyPower/features/blogger/presentation/widgets/change_gender_button.dart';
import 'package:BodyPower/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCourseContainer extends StatelessWidget {
  final String gender;

  const CustomCourseContainer({
    super.key,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 10.h),
      height: 160.h,
      decoration: BoxDecoration(
          color: ColorHelper.cardsBackground,
          borderRadius: BorderRadius.all(Radius.circular(14.r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(fit: StackFit.passthrough, children: [
            Positioned(
              top: 10,
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: const Color(0xff90E072),
              ),
            ),
            Image.asset(
              setPhotoForStack(gender: gender),
              height: 128.h,
              width: 100.w,
            ),
          ]),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 160.w,
                    child: Text(
                      getTitle(gender: gender),
                      maxLines: 2,
                      style: AppFonts.w600s16
                          .copyWith(color: ColorHelper.defaultThemeColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60.h,
                width: 160.w,
                child: Text(
                  "Если хотите изменить пол на мужской, нажмите кнопку “Изменить пол”",
                  softWrap: true,
                  maxLines: 4,
                  style:
                      AppFonts.w500s10.copyWith(color: const Color(0xff929292)),
                ),
              ),
              ChangeGenderButton(
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  String setPhotoForStack({required String gender}) {
    switch (gender) {
      case "Для мужчин":
        return Images.male;
      case "Для женщин":
        return Images.female;

      default:
        return Images.defaultGender;
    }
  }

  String getTitle({required String gender}) {
    switch (gender) {
      case "Для мужчин":
        return "Курс для Мужчин 👱‍♂️‍️";
      case "Для женщин":
        return "Курс для Женщин 👩‍️";

      default:
        return "Курс для Мужчин 👱‍♂️ и Женщин 👩 ‍️";
    }
  }
}
