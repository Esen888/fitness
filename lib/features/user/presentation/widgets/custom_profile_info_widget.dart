import 'package:fitness/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileInfoWidget extends StatelessWidget {
  final String nameOfUser;
  final String sureNameOfUser;
  final String profilePhoto;
  final String phoneNumber;
  const CustomProfileInfoWidget({
    super.key,
    required this.nameOfUser,
    required this.sureNameOfUser,
    required this.profilePhoto,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: CircleAvatar(
            radius: 26.r,
            child: Image.asset(profilePhoto),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(
            //   width: 200.w,
            //   child: Row(
            //     children: [
            //       // Text(
            //       //   nameOfUser,
            //       //   style: AppFonts.w700s20.copyWith(
            //       //     color: ColorHelper.defaultThemeColor,
            //       //   ),
            //       //   softWrap: true,
            //       //   maxLines: 2,
            //       //   overflow: TextOverflow.ellipsis,
            //       // ),
            //       Text(
            //         " $sureNameOfUser",
            //         softWrap: true,
            //         maxLines: 2,
            //         overflow: TextOverflow.ellipsis,
            //         style: AppFonts.w700s20.copyWith(
            //           color: const Color(0xff55BA30),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // RichText(
            //     text: TextSpan(

            //   text: nameOfUser,
            //   style: AppFonts.w700s20      .copyWith(color: ColorHelper.defaultThemeColor, overflow: TextOverflow.ellipsis, ),
            //   children: [
            //     TextSpan(
            //       text: " $sureNameOfUser",
            //       style:         AppFonts.w700s20.copyWith(color: const Color(0xff55BA30)),
            //     )
            //   ],
            // )),
            Text(
              phoneNumber,
              style: AppFonts.w700s20.copyWith(color: const Color(0xff777777)),
            )
          ],
        )
      ],
    );
  }
}
