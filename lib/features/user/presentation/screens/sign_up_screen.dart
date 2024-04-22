import 'package:BodyPower/bottom_navigation_bar.dart';
import 'package:BodyPower/config/dependency_injection/locator.dart';
import 'package:BodyPower/features/user/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:BodyPower/features/user/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:BodyPower/features/user/presentation/widgets/custom_signup_textfield.dart';
import 'package:BodyPower/features/user/presentation/widgets/login_helper_cards.dart';
import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../blocs/auth_bloc/authentification_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController phoneNumberController;
  late TextEditingController codeController;

  @override
  void initState() {
    phoneNumberController = TextEditingController();
    codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoaded = false;
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      // body: BlocConsumer<AuthentificationBloc, AuthentificationState>(
      //   listener: (context, state) {
      //     if (state is Authenticated) {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (context) => const BottomNavBar(),
      //         ),
      //       );
      //     }
      //     if (state is PhoneAuthVerified) {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (_) => const BottomNavBar(),
      //         ),
      //       );
      //     }

      //     if (state is AuthError) {
      //       ScaffoldMessenger.of(context)
      //           .showSnackBar(SnackBar(content: Text(state.error)));
      //     }
      //   },
      //   builder: (context, state) {
      //     if (state is AuthLoadingState) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }

      //     return SingleChildScrollView(
            body: Padding(
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
                        style: AppFonts.w700s20
                            .copyWith(color: const Color(0xff55BA30)),
                        children: [
                          TextSpan(
                              text: "начнутся здесь",
                              style: AppFonts.w700s20.copyWith(
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
                      style: AppFonts.w600s12
                          .copyWith(color: ColorHelper.defaultThemeColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 75.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ваш номер",
                          style: AppFonts.w600s10
                              .copyWith(color: const Color(0xff878787)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: CustomAuthTextFiled(
                            onChanged: () {},
                            maxLength: 12,
                            controller: phoneNumberController,
                            hintText: "996",
                            hasPrefixIcon: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: SizedBox(
                            height: 40.h,
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorHelper.buttonColor),
                                onPressed: () {
                                  BlocProvider.of<AuthorizationBloc>(context)
                                      .add(AuthorizationEvent(
                                          phoneNumber:
                                              phoneNumberController.text));
                                },
                                child: Text(
                                  "Получить код",
                                  style: AppFonts.w500s12.copyWith(
                                      color: ColorHelper.buttonTextColor),
                                )),
                          ),
                        ),
                        Text(
                          "Ваш код",
                          style: AppFonts.w600s10
                              .copyWith(color: const Color(0xff878787)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: CustomAuthTextFiled(
                            onChanged: () {},
                            maxLength: 6,
                            controller: codeController,
                            hintText: "Смс код",
                            hasPrefixIcon: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: SizedBox(
                            height: 40.h,
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      LoginEvent(
                                          phoneNumber:
                                              phoneNumberController.text,
                                          codeFromSms: codeController.text));
                                },
                                child: Text(
                                  "Начать свой путь",
                                  style: AppFonts.w500s12.copyWith(
                                      color: ColorHelper.buttonTextColor),
                                )),
                          ),
                        ),
                        BlocListener<AuthorizationBloc, AuthorizationState>(
                          listener: (context, state) {
                            if (state is AuthorizationSuccess) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                duration: const Duration(minutes: 5),
                                content: Text(state.smsCode.toString()),
                              ));
                            }
                            if (state is AuthorizationError) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                duration: const Duration(minutes: 5),
                                content: Text(state.errorText),
                              ));
                            }
                          },
                          child: const SizedBox(),
                        ),
                        BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              QuickAlert.show(
                                context: context,
                                title: "Успех",
                                type: QuickAlertType.success,
                                text: "Вы успешно создали аккаунт",
                                barrierDismissible: false,
                                onConfirmBtnTap: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();

                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNavBar()),
                                      (route) => false);
                                },
                              );
                            } else if (state is LoginError) {
                              QuickAlert.show(
                                context: context,
                                title: "Ошибка",
                                type: QuickAlertType.error,
                                text: state.errorText,
                                barrierDismissible: true,
                                onConfirmBtnTap: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();

                                  Navigator.pop(context);
                                },
                              );
                            }
                          },
                          child: const SizedBox(),
                        )
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 10.h),
                  //   child: InkWell(
                  //     onTap: () {
                  //       SharedPreferences preferences =
                  //           locator<SharedPreferences>();
                  //       print("${preferences.getString("access_token")}");
                  //     },
                  //     child: Text(
                  //       "или войти через",
                  //       style: AppFonts.w500s10.copyWith(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  // const LoginHelperCards(),
                ],
              ),
            ),
          );
        }

  }

