import 'package:BodyPower/bottom_navigation_bar.dart';
import 'package:BodyPower/features/user/presentation/widgets/login_helper_cards.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/auth_bloc/authentification_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // late TextEditingController phoneNumberController;
  // late TextEditingController codeController;

  @override
  void initState() {
    // phoneNumberController = TextEditingController();
    // codeController = TextEditingController();
    super.initState();
  }

  // @override
  // void dispose() {
  //   // phoneNumberController.dispose();
  //   // codeController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      body: BlocConsumer<AuthentificationBloc, AuthentificationState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const BottomNavBar(),
              ),
            );
          }
          if (state is PhoneAuthVerified) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const BottomNavBar(),
              ),
            );
          }

          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 72.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/icons/body_power_icon.png",
                    width: 124.w,
                    height: 139.h,
                    color: ColorHelper.authenticationIconColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 18.h,
                      bottom: 12.h,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: "Изменения ",
                        style: TextHelper.w700s20
                            .copyWith(color: Color(0xff55BA30)),
                        children: [
                          TextSpan(
                              text: "начнутся здесь",
                              style: TextHelper.w700s20.copyWith(
                                  color: ColorHelper.defaultThemeColor)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    child: Text(
                      "Войдите или создайте аккаунт, чтобы получить персональную программу тренировок!",
                      textAlign: TextAlign.center,
                      style: TextHelper.w600s12
                          .copyWith(color: ColorHelper.defaultThemeColor),
                    ),
                  ),
                  // if (state is! PhoneAuthCodeSentSuccess)
                  //   PhoneNumberWidget(
                  //     phoneNumberController: phoneNumberController,
                  //   )
                  // else
                  //   OtpWidget(
                  //     codeController: codeController,
                  //     verificationId: state.verificationId,
                  //   ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 12.h),
                  //   child: Text(
                  //     "или войти через",
                  //     style: TextHelper.w500s10
                  //         .copyWith(color: ColorHelper.alwaysGreyColor),
                  //   ),
                  // ),
                  const LoginHelperCards(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
