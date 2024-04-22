import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../data/models/news_page_models.dart';

class NewsCard extends StatelessWidget {
  final String bloggersName;
  final String bloggersAvatar;
  final String newsLabel;
  final String newsPhoto;
  const NewsCard({
    super.key,
    required this.bloggersName,
    required this.bloggersAvatar,
    required this.newsLabel,
    required this.newsPhoto,
  });

  @override
  Widget build(BuildContext context) {
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
                    "Дядя Арнольд",
                    style: AppFonts.w600s16
                        .copyWith(color: ColorHelper.defaultThemeColor),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Сегодня в 19:31",
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
              "120 кг на бицепс, кто примет эстафету? 🔥 ",
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
