// import 'package:BodyPower/internal/helpers/color_helper.dart';
// import 'package:BodyPower/internal/helpers/text_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../widgets/back_leading_card.dart';
// import '../widgets/signup_textfield_card.dart';

// class EditProfileScreen extends StatelessWidget {
//   EditProfileScreen({super.key});
//   final nickNameController = TextEditingController();
//   final phoneNumberController = TextEditingController();
//   final passwordController = TextEditingController();
//   final emailController = TextEditingController();

   

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: const BackLeadingCard(),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Image.asset(
//           "assets/images/BODYPOWER.png",
//           width: 136.w,
//         ),
//       ),
//       backgroundColor: ColorHelper.backgroundColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(20.r),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(top: 40.h, bottom: 15.h),
//                   child: Text(
//                     'Имя',
//                     style: TextHelper.w700s20
//                         .copyWith(color: ColorHelper.greyD1D3D3),
//                   ),
//                 ),
//                 // SignUpTextFieldCard(
//                 //   controller: nickNameController,
//                 //   error: 'е имя'.toLowerCase(),
//                 // ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
//                   child: Text(
//                     'Email',
//                     style: TextHelper.w700s20
//                         .copyWith(color: ColorHelper.greyD1D3D3),
//                   ),
//                 ),
//                 // SignUpTextFieldCard(
//                 //   controller: emailController,
//                 //   textInputType: TextInputType.emailAddress,
//                 //   error: ' Email'.toLowerCase(),
//                 // ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
//                   child: Text(
//                     'Номер телефона',
//                     style: TextHelper.w700s20
//                         .copyWith(color: ColorHelper.greyD1D3D3),
//                   ),
//                 ),
//                 // SignUpTextFieldCard(
//                 //   controller: phoneNumberController,
//                 //   textInputType: TextInputType.phone,
//                 //   error: ' Номер телефона'.toLowerCase(),
//                 // ),
//                 SizedBox(height: 40.h),
//                 InkWell(
//                   onTap: () {},
//                   child: Container(
//                     width: 1.sw,
//                     height: 60.h,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(color: Colors.purple.shade900, blurRadius: 6)
//                       ],
//                       borderRadius: BorderRadius.circular(15),
//                       gradient: LinearGradient(
//                         colors: [
//                           ColorHelper.blue01DDEB,
//                           Colors.blue,
//                         ],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                     ),
//                     child: Text(
//                       'Сохранить изменении',
//                       style: TextHelper.w700s20
//                           .copyWith(color: ColorHelper.greyD1D3D3),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
