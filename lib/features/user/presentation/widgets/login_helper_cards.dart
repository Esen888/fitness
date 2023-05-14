
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';

class LoginHelperCards extends StatelessWidget {
  const LoginHelperCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ColorHelper.black38,
            fixedSize: Size(0.4.sw, 70.h),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: ColorHelper.white10,
              ),
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
          onPressed: () {},
          child: const Icon(
            Icons.apple,
            size: 30,
          ),
        ),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ColorHelper.black38,
            fixedSize: Size(0.4.sw, 70.h),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: ColorHelper.white10,
              ),
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
          onPressed: () {},
          child: const Icon(
            Icons.g_mobiledata_outlined,
            size: 40,
          ),
        ),
      ],
    );
  }
}