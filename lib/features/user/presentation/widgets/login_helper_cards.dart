import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../logic/auth_bloc/authentification_bloc.dart';

class LoginHelperCards extends StatelessWidget {
  const LoginHelperCards({
    super.key,
  });

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthentificationBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

  void _authenticateWithApple(context) {
    BlocProvider.of<AuthentificationBloc>(context).add(
      AppleSignInRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ColorHelper.alwaysWhiteFFFFFF,
            fixedSize: Size(224.w, 28.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14), // <-- Radius
            ),
          ),
          onPressed: () {
            _authenticateWithGoogle(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage("assets/icons/google_icon.png"),
                size: 12.r,
                color: ColorHelper.black000000,
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: Text(
                  "Войти через Google",
                  style: TextHelper.w500s10
                      .copyWith(color: ColorHelper.black101010),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 12.h),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ColorHelper.alwaysWhiteFFFFFF,
            fixedSize: Size(224.w, 28.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14), // <-- Radius
            ),
          ),
          onPressed: () {
            _authenticateWithApple(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.apple,
                color: ColorHelper.black000000,
                size: 12.r,
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: Text(
                  "Войти через Apple",
                  style: TextHelper.w500s10
                      .copyWith(color: ColorHelper.black101010),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
