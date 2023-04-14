import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../data/utils/color_pallete.dart';

Shimmer chatShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.white,
    highlightColor: ColorPallete.bgColor,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 20.h,
                  margin: EdgeInsets.only(left: 50.w, right: 10.w),
                ),
              ),
              SizedBox(height: 50.h, width: 50.w, child: const CircleAvatar()),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50.h, width: 50.w, child: const CircleAvatar()),
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 20.h,
                  margin: EdgeInsets.only(left: 10.w, right: 50.w),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
