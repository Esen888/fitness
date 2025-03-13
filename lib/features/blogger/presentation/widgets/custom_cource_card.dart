import 'package:fitness/core/utils/app_fonts.dart';
import 'package:fitness/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCourceCard extends StatelessWidget {
  final String photoOfCource;
  final String nameOfCource;
  final String nameOfBloger;
  final Function onTap;
  const CustomCourceCard({
    super.key,
    required this.photoOfCource,
    required this.nameOfCource,
    required this.nameOfBloger,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // print("height is: ${MediaQuery.of(context).size.width}");
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 144.h,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(photoOfCource))),
        child:
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    nameOfCource,
                    style: AppFonts.w700s20.copyWith(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nameOfBloger,
                        style: AppFonts.w500s16.copyWith(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          onTap();
                        },
                        child: Container(
                          height: 25.h,
                          width: 155.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              color: Colors.black.withOpacity(0.8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Подробнее о курсе",
                                style: AppFonts.w500s10
                                    .copyWith(color: Colors.white),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: const ImageIcon(
                                  AssetImage(
                                    AppIcons.go,
                                  ),
                                  size: 10,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
