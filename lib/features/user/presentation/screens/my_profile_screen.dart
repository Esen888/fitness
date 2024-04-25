import 'package:BodyPower/bottom_navigation_bar.dart';
import 'package:BodyPower/config/dependency_injection/locator.dart';
import 'package:BodyPower/config/theme/change_theme_provider.dart';
import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:BodyPower/features/user/presentation/blocs/logout_bloc/log_out_bloc.dart';
import 'package:BodyPower/features/user/presentation/blocs/user_info_bloc/user_info_bloc.dart';
import 'package:BodyPower/features/user/presentation/widgets/custom_profile_button.dart';
import 'package:BodyPower/features/user/presentation/widgets/custom_profile_info_widget.dart';
import 'package:BodyPower/features/user/presentation/widgets/help_widget.dart';
import 'package:BodyPower/internal/custom_appbar.dart';
import 'package:BodyPower/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  SharedPreferences prefs = locator<SharedPreferences>();
  @override
  void initState() {
    BlocProvider.of<UserInfoBloc>(context).add(const UserInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isAuthorized = prefs.getString("access_token") != null;
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Общие настройки",
          style: AppFonts.w700s20
              .copyWith(color: isDarkMode ? Colors.white : Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<UserInfoBloc, UserInfoState>(
              builder: (context, state) {
                if (state is UserInfoLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is UserInfoSuccess) {
                  String fullName = "Эрлан Дононбаев";

                  // String fullName = state.model.data?.user?.name ?? "";
                  List<String> names = fullName.split(' ');
                  String firstName = names[0];
                  String lastName =
                      names.length > 1 ? names.sublist(1).join(' ') : "";
                  return CustomProfileInfoWidget(
                    nameOfUser: firstName,
                    sureNameOfUser: lastName,
                    phoneNumber: state.model.data?.user?.phone ?? "",
                    profilePhoto: Images.profileAvatar,
                  );
                } else if (state is UserInfoError) {
                  if (prefs.getString("access_token") == null) {
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: WithoutAuthorizationWidget(),
                    ));
                  } else {
                    return Text(
                      "Не удалось загрузить данные",
                      style: AppFonts.w700s20.copyWith(color: Colors.white),
                    );
                  }
                }
                return Text(
                  "Не удалось загрузить данные",
                  style: AppFonts.w700s20.copyWith(color: Colors.white),
                );
              },
            ),
            // Center(
            //   child: SizedBox(
            //     width: 125.w,
            //     height: 30.h,
            //     child: ElevatedButton(
            //       onPressed: () {},
            //       style: ElevatedButton.styleFrom(
            //           backgroundColor: const Color(0xff90E072),
            //           alignment: Alignment.center,
            //           padding: EdgeInsets.zero),
            //       child: Text(
            //         "Пригласить друзей",
            //         style: AppFonts.w500s10
            //             .copyWith(color: const Color(0xffBBFFA3)),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 16.w),
            //         child: Text(
            //           "Настройки профиля",
            //           style: AppFonts.w600s16.copyWith(
            //               color: isDarkMode
            //                   ? const Color(0xffE1E1E1)
            //                   : ColorHelper.grey878787),
            //         ),
            //       ),
            //       HelpWidget(
            //         onTap: () {},
            //       )
            //     ],
            //   ),
            // ),
            // CustomProfileSettingsButton(
            //   icon: AppIcons.profile,
            //   text: "Персональные данные",
            //   onTap: () {},
            // ),
            // CustomProfileSettingsButton(
            //     icon: AppIcons.statistic,
            //     text: "Статистика профиля",
            //     onTap: () {}),
            Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 4.h),
              child: Text(
                "Настройки приложения",
                style:
                    AppFonts.w600s16.copyWith(color: const Color(0xff878787)),
              ),
            ),
            // CustomProfileSettingsButton(
            //   // changeThemeFunction: true,
            //   icon: AppIcons.moon,
            //   text: "Темная тема",
            //   onTap: () {},
            //   willNavigate: false,
            // ),
            CustomProfileSettingsButton(
                icon: AppIcons.privatness,
                text: "Политика конфиденциальности",
                onTap: () {
                  _launchUrl(url: "http://body-power.site/policy");
                }),
            // CustomProfileSettingsButton(
            //     icon: AppIcons.language, text: "Язык", onTap: () {}),
            isAuthorized
                ? Padding(
                    padding: EdgeInsets.only(top: 60.h),
                    child: CustomProfileSettingsButton(
                      icon: AppIcons.logout,
                      text: "Выйти из аккаунта",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  backgroundColor: isDarkMode
                                      ? const Color(0xff2F2F2F)
                                      : const Color(0xffD9D9D9),
                                  surfaceTintColor: Colors.transparent,
                                  title: Text(
                                    "Вы действительно хотите выйти из системы?",
                                    textAlign: TextAlign.center,
                                    style: AppFonts.w600s16.copyWith(
                                        color: ColorHelper.defaultThemeColor),
                                  ),
                                  actions: [
                                    Center(
                                      child: Column(
                                        children: [
                                          BlocListener<LogOutBloc, LogOutState>(
                                            listener: (context, state) {
                                              if (state is LogOutSuccess) {
                                                setState(() {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const BottomNavBar()));
                                                });
                                              }
                                            },
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.red),
                                                onPressed: () {
                                                  setState(() {
                                                    BlocProvider.of<LogOutBloc>(
                                                            context)
                                                        .add(
                                                            const LogOutEvent());
                                                  });
                                                },
                                                child: Text(
                                                  "Выйти",
                                                  style: AppFonts.w500s10
                                                      .copyWith(
                                                          color: ColorHelper
                                                              .defaultThemeColor),
                                                )),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Отмена",
                                                style: AppFonts.w500s10
                                                    .copyWith(
                                                        color: ColorHelper
                                                            .defaultThemeColor),
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                      },
                      isRed: true,
                    ),
                  )
                : const SizedBox(),
            isAuthorized
                ? CustomProfileSettingsButton(
                    icon: AppIcons.remove,
                    text: "Удалить аккаунт",
                    onTap: () {},
                    isRed: true,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
