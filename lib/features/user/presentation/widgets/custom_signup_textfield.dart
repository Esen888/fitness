import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:BodyPower/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthTextFiled extends StatelessWidget {
  final Function onChanged;
  final String hintText;
  final bool hasPrefixIcon;
  final int maxLength;

  final TextEditingController controller;
  const CustomAuthTextFiled({
    super.key,
    required this.hintText,
    required this.hasPrefixIcon,
    required this.controller,
    required this.maxLength,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50.h,
        child: TextField(
          onChanged: (text) {
           
            if (text.length >= maxLength) {
              onChanged();
            }
          },
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(maxLength),
          ],
          keyboardType: TextInputType.phone,
          controller: controller,
          style: AppFonts.w500s12.copyWith(color: const Color(0xff878787)),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              fillColor: const Color(0xffE1E1E1),
              filled: true,
              // prefixIconConstraints: BoxConstraints(
              //     maxHeight: 34.h,
              //     maxWidth: 34.h,
              //     minHeight: 23.h,
              //     minWidth: 23.w),
              prefixIcon: hasPrefixIcon
                  ? Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Image.asset(
                        Images.flag,
                      ),
                    )
                  : null,
              hintText: hintText,
              hintStyle:
                  AppFonts.w500s12.copyWith(color: const Color(0xff878787)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none)),
        ));
  }
}
