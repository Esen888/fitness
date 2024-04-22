import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_fonts.dart';

class ErrorScreen extends StatelessWidget {
  final bool isInternetError;
  const ErrorScreen({super.key, required this.isInternetError});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/body_power_icon.png",
              height: 128.h,
              width: 140.w,
              fit: BoxFit.contain,
              color: ColorHelper.splashIconColor,
            ),
            Column(
              children: [
                isInternetError
                    ? Text(
                        "Технические неполадки",
                        style: AppFonts.w700s16
                            .copyWith(color: ColorHelper.alwaysWhiteFFFFFF),
                      )
                    : Text(
                        "Упс...",
                        style: AppFonts.w700s16
                            .copyWith(color: ColorHelper.alwaysWhiteFFFFFF),
                      ),
                isInternetError
                    ? Text(
                        "Приносим извинения! В данный момент у нас возникли технические неполадки. В скорем времени всё снова заработает.",
                        style: AppFonts.w500s12
                            .copyWith(color: ColorHelper.alwaysWhiteFFFFFF),
                      )
                    : Text(
                        "Проблемы соединения с интернетом, Проверьте интернет подключение.",
                        style: AppFonts.w500s12
                            .copyWith(color: ColorHelper.alwaysWhiteFFFFFF),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
