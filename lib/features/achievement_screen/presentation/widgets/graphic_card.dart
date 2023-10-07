import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../../../user/presentation/screens/sign_up_screen.dart';

class GraphicCard extends StatelessWidget {
  final String error;
  final String emodji;
  const GraphicCard({
    super.key,
    required this.error,
    required this.emodji,
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
              style: TextHelper.w500s24,
            ),
            SizedBox(height: 4.h),
            Text(
              error,
              style: TextHelper.w500s12.copyWith(
                color: ColorHelper.defaultThemeColor,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
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
                "Войти в аккаунт",
                style: TextHelper.w500s10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
