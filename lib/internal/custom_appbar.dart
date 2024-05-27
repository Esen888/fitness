import 'package:BodyPower/config/dependency_injection/locator.dart';
import 'package:BodyPower/features/user/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:BodyPower/features/user/presentation/blocs/user_info_bloc/user_info_bloc.dart';
import 'package:BodyPower/features/user/presentation/screens/my_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/user/presentation/screens/general_settings_screen.dart';
import '../features/user/presentation/screens/sign_up_screen.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final double height;
  // final Widget title;
  // final List<Widget> actions;

  const CustomAppBar({
    Key? key,
    // this.height = kToolbarHeight,
    // required this.title,
    // this.actions = const [],
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(62.h);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserInfoBloc>(context).add(const UserInfoEvent());
    final SharedPreferences preferences = locator<SharedPreferences>();
    bool isAuthorized = preferences.getString("access_token") != null;
    return AppBar(
        toolbarHeight: 62.h,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Image.asset(
            "assets/icons/body_power_icon.png",
            color: ColorHelper.defaultThemeColor,
          ),
        ),
        title: preferences.getString("access_token") == null
            ? const WithoutAuthorizationWidget()
            : BlocBuilder<UserInfoBloc, UserInfoState>(
                builder: (context, state) {
                  if (state is UserInfoLoading) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  } else if (state is UserInfoSuccess) {
                    String userName =
                        state.model.data?.user?.name ?? "пользователь";
                    return Text(
                      "Привет, $userName",
                      style: AppFonts.w700s16.copyWith(
                          color: isDarkMode ? Colors.white : Colors.black),
                    );
                  }
                  return Text(
                    "Привет, пользователь",
                    style: AppFonts.w700s16.copyWith(color: Colors.white),
                  );
                },
              ),
        actions: [
          IconButton(
            icon:  Icon(
              Icons.settings,
              // size: 15.w,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => isAuthorized
                          ? const MyProfileScreen()
                          : const GenerealSettingsScreen()));
            },
          ),
        ],
        surfaceTintColor: Colors.transparent,
        backgroundColor: ColorHelper.backgroundColor);
  }
}

class WithoutAuthorizationWidget extends StatelessWidget {
  const WithoutAuthorizationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Container(
          // width: 263.w,
          height: 66.h,
          decoration: BoxDecoration(
              color: ColorHelper.green90E072,
              borderRadius: BorderRadius.circular(14)),
          child: Row(
            children: [
              SizedBox(width: 11.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: AppFonts.w700s16
                          .copyWith(color: ColorHelper.unAthenticatedText),
                      children: [
                        const TextSpan(text: "Войти"),
                        TextSpan(text: " или", style: AppFonts.w700s12),
                      ],
                    ),
                  ),
                  Text(
                    "Зарегистрироваться",
                    style: AppFonts.w700s16
                        .copyWith(color: ColorHelper.unAthenticatedText),
                  )
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 24.r,
                    color: ColorHelper.unAthenticatedText,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
