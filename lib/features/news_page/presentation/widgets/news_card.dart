import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class NewsCard extends StatelessWidget {
  final String bloggersName;
  final String bloggersAvatar;
  final String newsLabel;
  final String newsPhoto;
  final DateTime dateWhenCreated;
  const NewsCard({
    super.key,
    required this.bloggersName,
    required this.bloggersAvatar,
    required this.newsLabel,
    required this.newsPhoto,
    required this.dateWhenCreated,
  });

  @override
  Widget build(BuildContext context) {
    String dateString = dateWhenCreated.toString();
    DateTime dateTime = DateTime.parse(dateString);
    final formattedDate = DateFormat('d MMMM HH:mm', "ru_RU").format(dateTime);
    return Container(
      width: 343.w,
      height: 430.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          color: ColorHelper.newsCardColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 14.h),
          Row(
            children: [
              SizedBox(width: 16.w),
              CircleAvatar(
                  radius: 23.r, backgroundImage: NetworkImage(newsPhoto)),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BodyPower",
                    style: AppFonts.w600s16
                        .copyWith(color: ColorHelper.defaultThemeColor),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    formattedDate,
                    style: AppFonts.w500s12
                        .copyWith(color: ColorHelper.newsTimeColor),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              top: 12.h,
              bottom: 13.h,
            ),
            child: Text(
              newsLabel,
              style: AppFonts.w500s12
                  .copyWith(color: ColorHelper.defaultThemeColor),
            ),
          ),
          Image.network(
            newsPhoto,
            height: 272.h,
            width: 343.w,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              top: 16.h,
            ),
            // child: SizedBox(
            //   height: 26.h,
            //   width: 71.w,
            //   child: ElevatedButton(
            //       onPressed: () {},
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: ColorHelper.buttonColor,
            //         padding: EdgeInsets.all(5.r),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(14.r)),
            //         elevation: 0,
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Icon(
            //             Icons.favorite_border_outlined,
            //             size: 12.r,
            //             color: ColorHelper.buttonTextColor,
            //           ),
            //           Text(
            //             "344",
            //             style: AppFonts.w500s12
            //                 .copyWith(color: ColorHelper.buttonTextColor),
            //           )
            //         ],
            //       )
            //       ),
            // ),
          )
        ],
      ),
    );
  }
}
