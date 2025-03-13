import 'package:fitness/features/blogger/data/models/blogger_model.dart';
import 'package:fitness/features/blogger/presentation/screens/course_information_screen.dart';
import 'package:fitness/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class BloggerCard extends StatelessWidget {
  const BloggerCard({
    super.key,
    required this.bloggerModel,
  });

  final List<BloggerModel> bloggerModel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 28.h),
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: 343.w,
          height: 144.h,
          padding: EdgeInsets.only(
            left: 16.w,
            right: 7.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            image: DecorationImage(
                image: NetworkImage(bloggerModel[index].bloggerCardImage!),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                bloggerModel[index].bloggerCardName!,
                style: AppFonts.w700s20
                    .copyWith(color: ColorHelper.alwaysWhiteFFFFFF),
              ),
              SizedBox(height: 27.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 11.h),
                      child: Text(
                        bloggerModel[index].bloggerCourseName!,
                        style: AppFonts.w500s16
                            .copyWith(color: ColorHelper.alwaysWhiteFFFFFF),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(155.w, 25.h),
                      elevation: 0,
                      backgroundColor: ColorHelper.black000000.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CourseInformationScreen(description: "",titleOfCourse: "",courseId: 0, videoLink: '', sectionId: 0,)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Подробнее ",
                          style: AppFonts.w500s10
                              .copyWith(color: ColorHelper.alwaysWhiteFFFFFF),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: ColorHelper.alwaysWhiteFFFFFF,
                          size: 12.r,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: bloggerModel.length,
      separatorBuilder: (context, index) => SizedBox(height: 14.h),
    );
  }
}
