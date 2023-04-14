import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';
import 'package:mini_e_learning/app/modules/dashboard/page/Home/controllers/home_controller.dart';
import 'package:mini_e_learning/app/widget/list_view_shimmer.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/course_widget.dart';

class CourseView extends GetView<HomeController> {
  const CourseView({Key? key}) : super(key: key);

  Future<void> _onRefresh() async {
    await controller.getCourseList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      appBar: AppBar(
        backgroundColor: ColorPallete.bgColor,
        title: Text(
          'Pilih Pelajaran',
          style:
              GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.courseList.length,
              itemBuilder: (context, index) {
                if (controller.isLoading) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 15.0.h,
                      ),
                      const MyListViewShimmer(),
                    ],
                  );
                } else {
                  if (controller.courseList.isNotEmpty) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 15.0,
                        ),
                        CourseWidget(
                          leading: controller.courseList[index].urlCover!,
                          title: controller.courseList[index].courseName!,
                          materi: controller.courseList[index].jumlahMateri!,
                          done: controller.courseList[index].jumlahDone!,
                          route: Routes.exercise,
                          argument: {
                            "courseId": controller.courseList[index].courseId,
                            "email": controller.userData.data?.userEmail!,
                            "title": controller.courseList[index].courseName,
                          },
                        ),
                      ],
                    );
                  } else {
                    return Text(
                      "Saat ini tidak ada pelajaran tersedia",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }
                }
              },
            );
          },
        ),
      ),
    );
  }
}
