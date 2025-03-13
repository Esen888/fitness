// import 'dart:async';
// import 'package:fitness/features/user/presentation/widgets/repitition_select_card.dart';
// import 'package:fitness/features/user/presentation/widgets/training_gift_card.dart';
// import 'package:fitness/features/user/presentation/widgets/weight_select_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../internal/helpers/color_helper.dart';
// import '../../../../internal/helpers/text_helper.dart';
// import 'approach_card.dart';
// import 'information_button_card.dart';

// class ExcersiceTabbarView extends StatefulWidget {
//   const ExcersiceTabbarView({
//     super.key,
//   });

//   @override
//   State<ExcersiceTabbarView> createState() => _ExcersiceTabbarViewState();
// }

// class _ExcersiceTabbarViewState extends State<ExcersiceTabbarView>
//     with TickerProviderStateMixin {
//   AnimationController? _progressController;
//   Timer? _timer;
//   bool _isPlaying = false;
//   int _timerSeconds = 0;
//   // AudioPlayer? _audioPlayer;

//   @override
//   void initState() {
//     super.initState();
//     _progressController =
//         AnimationController(vsync: this, duration: Duration(seconds: 30));
//     _progressController!.addListener(() {
//       setState(() {});
//     });
//     // _audioPlayer = AudioPlayer();
//     // await _audioPlayer!.play(ctx: );/
//   }

//   @override
//   void dispose() {
//     _progressController!.dispose();
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _startTimer() {
//     _timerSeconds = 0;
//     _timer?.cancel();
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         _timerSeconds++;
//         if (_timerSeconds >= 30) {
//           _timer!.cancel();
//           _timer = null;
//           _isPlaying = false;
//         }
//       });
//     });
//   }

//   void _playProgress() {
//     if (!_isPlaying) {
//       _isPlaying = true;
//       _startTimer();
//       _progressController!.forward();
//     }
//   }

//   void _stopProgress() {
//     if (_isPlaying) {
//       _isPlaying = false;
//       _timer?.cancel();
//       _progressController!.stop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.symmetric(horizontal: 2.w),
//       children: [
//         const TrainingGiftCard(),
//         const InformationButtonCard(),
//         Flexible(
//           // flex: 1,
//           // height: 2.sw,
//           child: ListView.builder(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             itemCount: 5,
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (_, index) {
//               return Column(
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             "N подхода",
//                             style: TextHelper.w700s15
//                                 .copyWith(color: ColorHelper.greyD1D3D3),
//                           ),
//                           SizedBox(
//                             height: 30.h,
//                           ),
//                           const ApproachCard()
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             "Вес",
//                             style: TextHelper.w700s15
//                                 .copyWith(color: ColorHelper.greyD1D3D3),
//                           ),
//                           SizedBox(
//                             height: 30.h,
//                           ),
//                           const WeightSelectCard()
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             "Повторение",
//                             style: TextHelper.w700s15
//                                 .copyWith(color: ColorHelper.greyD1D3D3),
//                           ),
//                           SizedBox(
//                             height: 30.h,
//                           ),
//                           const RepititionSelectCard()
//                         ],
//                       ),
//                       InkWell(
//                         onTap: _playProgress,
//                         child: Container(
//                           height: 65.r,
//                           width: 60.r,
//                           decoration: BoxDecoration(
//                             color: Colors.grey,
//                             borderRadius: BorderRadius.circular(4.r),
//                           ),
//                           child: const Icon(
//                             Icons.play_arrow_rounded,
//                             size: 50,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "секунд:  ",
//                         style: TextHelper.w400s16
//                             .copyWith(color: ColorHelper.whiteECECEC),
//                       ),
//                       Text(
//                         "$_timerSeconds",
//                         style: TextHelper.w700s30
//                             .copyWith(color: ColorHelper.whiteECECEC),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 20.h),
//                     child: LinearProgressIndicator(
//                       value: _progressController!.value,
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
