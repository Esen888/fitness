import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class BackLeadingCard extends StatelessWidget {
  const BackLeadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4.w),
      margin: EdgeInsets.only(left: 13.w, top: 5.h, bottom: 5.h),
      width: 40.w,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: ColorHelper.greyD1D3D3.withOpacity(0.1),
            )
          ],
          border: Border.all(
            width: 2,
            color: ColorHelper.white10,
          ),
          color: ColorHelper.backgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        alignment: Alignment.center,
        icon: const Icon(Icons.arrow_back_ios),
        iconSize: 20.r,
        color: ColorHelper.greyD1D3D3,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
