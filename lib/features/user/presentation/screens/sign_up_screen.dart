import 'package:fitness/bottom_navigation_bar.dart';
import 'package:fitness/features/user/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:fitness/features/user/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:fitness/features/user/presentation/widgets/custom_signup_textfield.dart';
import 'package:fitness/core/utils/app_colors.dart';
import 'package:fitness/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController phoneNumberController;
  late TextEditingController codeController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 72.h),
          child: Form(
            key: _formKey,
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
                          onChanged: (value) {
                            // Automatically prepend '+996' if not present
                            if (!value.startsWith('+996') && value.isNotEmpty) {
                              phoneNumberController.text = '+996' +
                                  value.replaceAll(RegExp(r'[^0-9]'), '');
                              phoneNumberController.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset:
                                          phoneNumberController.text.length));
                            }
                          },
                          maxLength: 13,
                          controller: phoneNumberController,
                          hintText: "+996 555 12 34 56",
                          hasPrefixIcon: true,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Введите номер";
                            } else if (!p0.startsWith('+996')) {
                              return "Введите номер с +996";
                            }

                            return null; // No validation error
                          },
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
                                if (_formKey.currentState!.validate()) {
                                  String formattedPhoneNumber =
                                      phoneNumberController.text;

                                  BlocProvider.of<AuthorizationBloc>(context)
                                      .add(AuthorizationEvent(
                                    phoneNumber: formattedPhoneNumber,
                                  ));
                                }
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
                                if (_formKey.currentState!.validate()) {
                                  String formattedPhoneNumber =
                                      phoneNumberController.text;
                                  BlocProvider.of<LoginBloc>(context).add(
                                      LoginEvent(
                                          phoneNumber: formattedPhoneNumber,
                                          codeFromSms: codeController.text));
                                }
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
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(minutes: 5),
                              content: Text(state.smsCode.toString()),
                            ));
                          }
                          if (state is AuthorizationError) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
