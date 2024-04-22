// import 'package:BodyPower/features/user/presentation/blocs/auth_bloc/authentification_bloc.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/app_fonts.dart';

// class SendOtpButton extends StatefulWidget {
//   const SendOtpButton({
//     super.key,
//     required this.phoneNumberController,
//     required this.countryCode,
//   });

//   final TextEditingController phoneNumberController;
//   final CountryCode countryCode;

//   @override
//   State<SendOtpButton> createState() => _SendOtpButtonState();
// }

// class _SendOtpButtonState extends State<SendOtpButton> {
//   void _sendOtp({required String phoneNumber, required BuildContext context}) {
//     final phoneNumberWithCode = "${widget.countryCode.dialCode}$phoneNumber";
//     context.read<AuthentificationBloc>().add(
//           SendOtpToPhoneEvent(
//             phoneNumber: phoneNumberWithCode,
//           ),
//         );
//     setState(() {
//       widget.phoneNumberController.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         _sendOtp(
//             phoneNumber: widget.phoneNumberController.text, context: context);
//       },
//       style: ElevatedButton.styleFrom(
//           fixedSize: Size(
//             224.w,
//             36.h,
//           ),
//           backgroundColor: ColorHelper.buttonColor,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
//       child: Text(
//         "Начать свой путь",
//         style: AppFonts.w500s12.copyWith(color: ColorHelper.buttonTextColor),
//       ),
//     );
//   }
// }
