import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/utils/color_pallete.dart';

class CourseWidget extends StatelessWidget {
  final String leading;
  final String title;
  final int? materi;
  final int done;
  final String? route;
  final Map<String, dynamic>? argument;

  const CourseWidget({
    super.key,
    required this.leading,
    required this.title,
    required this.materi,
    this.done = 0,
    this.route,
    this.argument,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        child: Material(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0.r),
          ),
          child: InkWell(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0.r),
            ),
            onTap: () =>
                route != null ? Get.toNamed(route!, arguments: argument) : '',
            splashColor: ColorPallete.bgColor,
            hoverColor: Colors.white,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.w),
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                    color: ColorPallete.iconBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0.r.r),
                    ),
                  ),
                  child: Center(
                    child: Image.network(
                      leading,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorPallete.bgColor,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          "assets/img/atom.png",
                          fit: BoxFit.contain,
                        );
                      },
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 18.w, right: 18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5.0.h,
                      ),
                      Text(
                        "$done/$materi Paket latihan soal",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorPallete.subTitle),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      LinearProgressIndicator(
                        value: materi != null ? 0 : done / materi!,
                        minHeight: 10.h,
                        backgroundColor: Colors.grey[300],
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.blue),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
