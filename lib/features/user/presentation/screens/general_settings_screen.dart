import 'package:BodyPower/bottom_navigation_bar.dart';
import 'package:BodyPower/config/dependency_injection/locator.dart';
import 'package:BodyPower/features/user/presentation/screens/my_profile_screen.dart';
import 'package:BodyPower/features/user/presentation/screens/sign_up_screen.dart';
import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GenerealSettingsScreen extends StatelessWidget {
  const GenerealSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferences preferences = locator<SharedPreferences>();
    bool isAuthorized = preferences.getString("access_token") != null;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          title: Text(
            "Общие настройки",
            style:
                AppFonts.w700s20.copyWith(color: ColorHelper.defaultThemeColor),
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: ColorHelper.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/body_power_icon.png",
                height: 128.h,
                width: 140.w,
                fit: BoxFit.contain,
                color: ColorHelper.authenticationIconColor,
              ),
              SizedBox(height: 30.h),
              isAuthorized
                  ? const SizedBox()
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
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
                        textAlign: TextAlign.center,
                        style: AppFonts.w500s10.copyWith(color: ColorHelper.buttonTextColor),
                      ),
                    ),
              isAuthorized
                  ? const SizedBox()
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BottomNavBar()));
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
                        "Продолжить без аккаунта",
                        textAlign: TextAlign.center,
                        style: AppFonts.w500s10.copyWith(color: ColorHelper.buttonTextColor),
                      ),
                    ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfileScreen()));
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
                  "Мой профиль",
                  textAlign: TextAlign.center,
                  style: AppFonts.w500s10.copyWith(color: ColorHelper.buttonTextColor),
                ),
              ),
            ],
          ),
        ));
  }
}
