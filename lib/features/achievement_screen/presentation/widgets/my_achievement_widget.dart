import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class MyAchievementWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function onTap;
  const MyAchievementWidget({
    super.key,
    required this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Мои достижения",
          style:
              AppFonts.w700s20.copyWith(color: ColorHelper.defaultThemeColor),
        ),
        const Spacer(),
        SizedBox(
          height: 30.h,
          width: 150,
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            onEditingComplete: () {
              onTap();
            },
            style:
                AppFonts.w500s12.copyWith(color: ColorHelper.defaultThemeColor),
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(bottom: 3.h, left: 10.w),
              // prefixText: "Веc:",
              prefixIcon: Padding(
                padding: EdgeInsets.only(top: 5.h, left: 5.w),
                child: const Text("Веc:"),
              ),
              hintText: "",
              suffixIcon: SizedBox(
                width: 42.w,
                child: Row(
                  children: [
                    Text(
                      "кг",
                      style: AppFonts.w500s12
                          .copyWith(color: ColorHelper.defaultThemeColor),
                    ),
                    SizedBox(width: 8.w),
                    InkWell(
                      onTap: () {
                        onTap();
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 24,
                        color: ColorHelper.weightTextFieldIcon,
                      ),
                    ),
                    // SizedBox(width: 10.w),
                  ],
                ),
              ),
              hintStyle: AppFonts.w500s12
                  .copyWith(color: ColorHelper.defaultThemeColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                    color: ColorHelper.weightTextFieldBorder, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                    color: ColorHelper.weightTextFieldBorder, width: 1),
              ),
            ),
          ),
        )
      ],
    );
  }
}
