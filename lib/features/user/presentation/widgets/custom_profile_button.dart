import 'package:BodyPower/config/dependency_injection/locator.dart';
import 'package:BodyPower/config/theme/change_theme_provider.dart';
import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:BodyPower/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomProfileSettingsButton extends StatefulWidget {
  final String icon;
  final String text;
  final Function onTap;
  final bool isRed;
  final bool willNavigate;
  final bool changeThemeFunction;
  const CustomProfileSettingsButton({
    super.key,
    required this.icon,
    this.changeThemeFunction = false,
    this.isRed = false,
    required this.text,
    required this.onTap,
    this.willNavigate = true,
  });

  @override
  State<CustomProfileSettingsButton> createState() =>
      _CustomProfileSettingsButtonState();
}

class _CustomProfileSettingsButtonState
    extends State<CustomProfileSettingsButton> {
        SharedPreferences prefs = locator<SharedPreferences>();

       bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: InkWell(
        onTap: () => widget.onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          height: 45.h,
          decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xff2F2F2F)
                  : const Color(0xffD9D9D9),
              borderRadius: BorderRadius.all(Radius.circular(14.r))),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: ImageIcon(
                  AssetImage(
                    widget.icon,
                  ),
                  size: 20,
                  color: widget.isRed
                      ? const Color(0xffFF0000)
                      : const Color(0xff55BA30),
                ),
              ),
              Text(
                widget.text,
                style: AppFonts.w600s12
                    .copyWith(color: ColorHelper.defaultThemeColor),
              ),
              const Spacer(),
              widget.changeThemeFunction
                  ? Consumer<ThemeProvider>(
                      builder: (context, value, child) {
                        return Switch(
                          value: isDark,
                          activeColor: Colors.green,
                          onChanged: (bool value) {
                            
                            setState(() {
                              isDark = value;
                              isDarkMode = value;
                              prefs.setBool("isDarkMode", value);
                              setState(() {
                                context
                                    .read<ThemeProvider>()
                                    .toggle();
                              });
                            });
                          },
                        );
                      },
                    )
                  : const SizedBox(),
              widget.willNavigate
                  ? const ImageIcon(
                      AssetImage(AppIcons.go),
                      size: 12,
                      color: Color(0xffE1E1E1),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
