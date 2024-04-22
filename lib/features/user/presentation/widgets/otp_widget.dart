// import 'package:BodyPower/core/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/utils/app_fonts.dart';
// import '../blocs/auth_bloc/authentification_bloc.dart';

// class OtpWidget extends StatelessWidget {
//   final TextEditingController codeController;
//   final String verificationId;
//   const OtpWidget({
//     super.key,
//     required this.codeController,
//     required this.verificationId,
//   });
//   // void _verifyOtp({required BuildContext context}) {
//   //   context.read<AuthentificationBloc>().add(VerifySentOtpEvent(
//   //       otpCode: codeController.text, verificationId: verificationId));
//   //   codeController.clear();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 30.h),
//           child: Text(
//             "Ведите код",
//             style: AppFonts.w700s20.copyWith(color: ColorHelper.greyD1D3D3),
//           ),
//         ),
//         OtpTextField(
//           fillColor: ColorHelper.greyD1D3D3,
//           focusedBorderColor: ColorHelper.blue01DDEB,
//           numberOfFields: 6,
//           filled: true,
//           fieldWidth: 50.r,
//           onSubmit: (code) {
//             codeController.text = code;
//           },
//         ),
//         InkWell(
//           onTap: () {
//             _verifyOtp(context: context);
//           },
//           child: Container(
//             width: 1.sw,
//             height: 60.h,
//             alignment: Alignment.center,
//             margin: EdgeInsets.symmetric(vertical: 30.h),
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(color: Colors.purple.shade900, blurRadius: 6)
//               ],
//               borderRadius: BorderRadius.circular(15),
//               gradient: LinearGradient(
//                 colors: [
//                   ColorHelper.blue01DDEB,
//                   Colors.blue,
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Text(
//               'Зарегистрироваться',
//               style: AppFonts.w700s20.copyWith(color: ColorHelper.greyD1D3D3),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
