import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';

class MyAchievementWidget extends StatelessWidget {
  const MyAchievementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            "Мои достижения",
            style: TextHelper.w700s20
                .copyWith(color: ColorHelper.defaultThemeColor),
          ),
        ),
        // const Spacer(),
        // Flexible(
        //   child: TextField(
        //     textAlignVertical: TextAlignVertical.bottom,
        //     decoration: InputDecoration(
        //       hintText: "Вес:",
        //       suffixIcon: SizedBox(
        //         width: 42.w,
        //         child: Row(
        //           children: [
        //             Text(
        //               "70",
        //               style: TextHelper.w500s12
        //                   .copyWith(color: ColorHelper.weightTextFieldText),
        //             ),
        //             SizedBox(width: 8.w),
        //             Icon(
        //               Icons.arrow_forward_ios_outlined,
        //               size: 12.r,
        //               color: ColorHelper.weightTextFieldIcon,
        //             ),
        //             SizedBox(width: 10.w),
        //           ],
        //         ),
        //       ),
        //       hintStyle: TextHelper.w500s12
        //           .copyWith(color: ColorHelper.defaultThemeColor),
        //       enabledBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(14),
        //         borderSide: BorderSide(
        //             color: ColorHelper.weightTextFieldBorder, width: 1),
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(14),
        //         borderSide: BorderSide(
        //             color: ColorHelper.weightTextFieldBorder, width: 1),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
