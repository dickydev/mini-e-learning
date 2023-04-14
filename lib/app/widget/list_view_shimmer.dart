import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';
import 'package:shimmer/shimmer.dart';

class MyListViewShimmer extends StatelessWidget {
  const MyListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Container(
            width: ScreenUtil().screenWidth,
            height: 95.h,
            margin: EdgeInsets.only(bottom: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0.r),
              ),
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: ColorPallete.bgColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Container(
              width: ScreenUtil().screenWidth,
              height: 100.h,
              margin: EdgeInsets.only(bottom: 15.h),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    height: 50.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                      color: ColorPallete.iconBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0.r),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 18.w, right: 18.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 77.w,
                            height: 18.h,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          Container(
                            width: 141.w,
                            height: 18.h,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 13.0.h,
                          ),
                          Container(
                            width: 218.w,
                            height: 15.h,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
