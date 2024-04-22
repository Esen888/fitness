import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class GraphicCard extends StatelessWidget {
  final String error;
  final String emodji;
  final Function onTap;
  final String buttonTitle;
  const GraphicCard({
    super.key,
    required this.error,
    required this.emodji, required this.onTap, required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: 10.h,
        bottom: 42.h,
      ),
      color: ColorHelper.cardsBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
      child: SizedBox(
        width: 343.w,
        height: 172.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emodji,
              style: AppFonts.w500s24,
            ),
            SizedBox(height: 4.h),
            Text(
              error,
              style: AppFonts.w500s12.copyWith(
                color: ColorHelper.defaultThemeColor,
              ),
            ),
            ElevatedButton(
              onPressed: () {
              onTap();
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    152.w,
                    32.h,
                  ),
                  backgroundColor: ColorHelper.buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14))),
              child: Text(
                buttonTitle,
                style: AppFonts.w500s10
                    .copyWith(color: ColorHelper.buttonTextColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
