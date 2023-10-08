import 'package:BodyPower/internal/prefs_settings.dart';
import 'package:BodyPower/main.dart';
import 'package:BodyPower/bottom_navigation_bar.dart';
import 'package:BodyPower/features/user/presentation/screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import '../logic/auth_bloc/authentification_bloc.dart';

class GenerealSettingsScreen extends StatefulWidget {
  const GenerealSettingsScreen({super.key});

  @override
  State<GenerealSettingsScreen> createState() => _GenerealSettingsScreenState();
}

class _GenerealSettingsScreenState extends State<GenerealSettingsScreen> {
  void _signOut(BuildContext _context) {
    BlocProvider.of<AuthentificationBloc>(_context).add(
      SignOutRequested(),
    );
  }

  void _setFitnessTime(BuildContext context) async {
    DateTime? parcedTime;
    final timeIsSet = await AppStorage.getData('fitnessTime');
    if (timeIsSet != null) {
      parcedTime = DateTime.parse(timeIsSet);
    }
    if (mounted) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: timeIsSet != null
            ? TimeOfDay(hour: parcedTime!.hour, minute: parcedTime.minute)
            : TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.input,
      ).then((value) {
        showNotificationWithDefaultSound(body: 'Данные успешно изменены');
        return value;
      });
      var fitnessTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        time?.hour ?? 0,
        time?.minute ?? 0,
      );
      AppStorage.saveData('fitnessTime', fitnessTime.toString());
    }
  }

  void _deleteCurrentAccaunt(BuildContext _context) {
    BlocProvider.of<AuthentificationBloc>(_context).add(
      DeleteCurrentAccaunt(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
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
          style: TextHelper.w700s20
              .copyWith(color: ColorHelper.defaultThemeColor),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: BlocBuilder<AuthentificationBloc, AuthentificationState>(
        // listener: (context, state) {
          // if (state is UnAuthenticated) {
          //   Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(
          //         builder: (context) => const BottomNavBar()),
          //   );
          // }
        // },
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is Authenticated) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 38.h,
                    right: 16.w,
                    left: 16.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProfileContainer(user: user),
                      const _HeaderText(label: 'Настройки профиля'),
                      _CustomButton(
                        onTap: () async {},
                        icon: Icons.person,
                        title: "Персональные данные",
                      ),
                      _CustomButton(
                        onTap: () => _setFitnessTime(context),
                        icon: Icons.notification_add,
                        title: 'Настроить время тренировок',
                      ),
                      // _CustomButton(
                      //   onTap: () {},
                      //   icon: Icons.analytics_outlined,
                      //   title: "Статистика профиля",
                      // ),
                      // const _HeaderText(label: 'Настройки приложения'),
                      // _CustomButton(
                      //   onTap: () {},
                      //   icon: Icons.dark_mode_outlined,
                      //   title: "Темная тема",
                      // ),
                      // _CustomButton(
                      //   onTap: () {},
                      //   icon: Icons.security,
                      //   title: "Приватность",
                      // ),
                      // _CustomButton(
                      //   onTap: () {},
                      //   icon: Icons.language,
                      //   title: "Язык",
                      // ),
                      SizedBox(height: 72.h),
                      _CustomButton(
                        onTap: () => _signOut(context),
                        isRedIcon: true,
                        icon: Icons.logout,
                        title: "Выйти из аккаунта",
                      ),
                      _CustomButton(
                        onTap: () => _deleteCurrentAccaunt(context),
                        isRedIcon: true,
                        title: "Удалить аккаунт",
                        icon: Icons.delete_forever,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const _UnAuthentificatedContainer();
        },
      ),
    );
  }
}

class _ProfileContainer extends StatelessWidget {
  const _ProfileContainer({required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64.r,
          height: 64.r,
          margin: EdgeInsets.only(left: 8.w),
          decoration: user?.photoURL == null
              ? null
              : BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("${user?.photoURL}"),
                  ),
                ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              user?.displayName != null
                  ? Text(
                      user?.displayName ?? '',
                      style: TextHelper.w700s16
                          .copyWith(color: ColorHelper.whiteECECEC),
                    )
                  : const SizedBox(),
              SizedBox(height: 8.h),
              user?.phoneNumber != null
                  ? Text(
                      user?.phoneNumber ?? '',
                      style: TextHelper.w500s10
                          .copyWith(color: ColorHelper.phoneNumberColor),
                    )
                  : const SizedBox(),
              SizedBox(height: 12.h),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(127.w, 28.h),
                ),
                child: Row(
                  children: [
                    Text(
                      "Пригласить друзей",
                      style: TextHelper.w500s10
                          .copyWith(color: ColorHelper.inviteFriendColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        top: 24.h,
      ),
      child: Text(
        label,
        style: TextHelper.w600s16.copyWith(color: ColorHelper.grey878787),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    required this.onTap,
    required this.icon,
    required this.title,
    this.isRedIcon = false,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final bool isRedIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorHelper.cardsBackground,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24.r,
              color: isRedIcon
                  ? ColorHelper.logOutIcon
                  : ColorHelper.generalIconColor,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextHelper.w500s12
                    .copyWith(color: ColorHelper.defaultThemeColor),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12.r,
              color: ColorHelper.defaultThemeColor,
            )
          ],
        ));
  }
}

class _UnAuthentificatedContainer extends StatelessWidget {
  const _UnAuthentificatedContainer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/body_power_icon.png",
            height: 128.h,
            width: 140.w,
            fit: BoxFit.contain,
            color: ColorHelper.splashIconColor,
          ),
          SizedBox(height: 30.h),
          ElevatedButton(
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
              style: TextHelper.w500s10,
            ),
          ),
          ElevatedButton(
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
              style: TextHelper.w500s10,
            ),
          ),
        ],
      ),
    );
  }
}
