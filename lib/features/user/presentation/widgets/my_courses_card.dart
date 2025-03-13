import 'package:fitness/bottom_navigation_bar.dart';
import 'package:fitness/core/utils/app_fonts.dart';
import 'package:fitness/features/achievement_screen/presentation/screens/achievements_screen.dart';
import 'package:fitness/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCoursesCard extends StatelessWidget {
  final String courseImage;
  final String courseTitle;
  const MyCoursesCard({
    super.key,
    required this.courseImage,
    required this.courseTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          image: DecorationImage(
              fit: BoxFit.fill, image: NetworkImage(courseImage))),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    child: Text(
                      courseTitle,
                      style: AppFonts.w700s20.copyWith(color: Colors.white),
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 121.w,
                      child: Text(
                        "24 тренировочных дня (3 тренировки в неделю)",
                        style: AppFonts.w500s10
                            .copyWith(color: const Color(0xff90E072)),
                        maxLines: 3,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 28.h,
                        width: 104.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            color: const Color(0xff90E072)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: const ImageIcon(
                                AssetImage(
                                  AppIcons.sport,
                                ),
                                size: 10,
                                color: Color(0xff397D20),
                              ),
                            ),
                            Text(
                              "Курс для зала",
                              style: AppFonts.w500s10
                                  .copyWith(color: const Color(0xff397D20)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BottomNavBar(selectedTab: 1),
                      ));
                    },
                    child: Container(
                      height: 32.h,
                      // width: 155.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: Colors.black.withOpacity(0.8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: const ImageIcon(
                              AssetImage(
                                AppIcons.star,
                              ),
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Посмотреть мои достижения",
                            style:
                                AppFonts.w500s10.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
