// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../internal/helpers/color_helper.dart';
// import '../../../../internal/helpers/text_helper.dart';
// import '../../../blogger/presentation/screens/exercise_information_screen.dart';

// class InformationButtonCard extends StatelessWidget {
//   const InformationButtonCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return const ExerciseInformationScreen();
//         }));
//       },
//       child: Container(
//         height: 35.h,
//         width: 353.w,
//         margin: EdgeInsets.only(bottom: 20.h),
//         decoration: BoxDecoration(
//           color: ColorHelper.blue01DDEB.withOpacity(0.5),
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(10.r),
//           ),
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           "Информация",
//           style: TextHelper.w700s11.copyWith(
//             color: ColorHelper.whiteECECEC,
//           ),
//         ),
//       ),
//     );
//   }
// }
