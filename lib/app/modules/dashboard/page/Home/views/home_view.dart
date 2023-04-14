import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/widget/course_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../data/utils/color_pallete.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../widget/list_view_shimmer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Future<void> _onRefresh() async {
    await controller.getCourseList();
    await controller.getBannerList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 50.w,
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              "Hai, ${controller.userData.data?.userEmail}",
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Selamat Datang",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.0.w,
                        width: 35.w,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            controller.userData.data!.userFoto!,
                          ),
                          child: FadeInImage(
                            placeholder:
                                const AssetImage('assets/img/avatar.png'),
                            fit: BoxFit.contain,
                            imageErrorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset('assets/img/avatar.png');
                            },
                            image: NetworkImage(
                              controller.userData.data!.userFoto!,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 150.h,
                        width: 317.w,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/img/vector-ppl.png'),
                              alignment: AlignmentDirectional.bottomEnd),
                          color: ColorPallete.bgColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(20),
                              width: 107.w,
                              child: Text(
                                'Mau kerjain latihan soal apa hari ini ?',
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 25.h, bottom: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pilih Pelajaran',
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(Routes.course),
                              child: Text(
                                'Lihat Semua',
                                style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    color: ColorPallete.bgColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      controller.isLoading
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return const MyListViewShimmer();
                                },
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: controller.courseList.length,
                                itemBuilder: (context, index) {
                                  if (controller.isLoading) {
                                    return const MyListViewShimmer();
                                  } else {
                                    if (controller.courseList.isNotEmpty) {
                                      return CourseWidget(
                                        leading: controller
                                            .courseList[index].urlCover!,
                                        title: controller
                                            .courseList[index].courseName!,
                                        materi: controller
                                            .courseList[index].jumlahMateri!,
                                        done: controller
                                            .courseList[index].jumlahDone!,
                                        route: Routes.exercise,
                                        argument: {
                                          "courseId": controller
                                              .courseList[index].courseId,
                                          "email": controller
                                              .userData.data?.userEmail!,
                                          "title": controller
                                              .courseList[index].courseName,
                                        },
                                      );
                                    } else {
                                      return Center(
                                        child: Text(
                                          "Saat ini tidak ada pelajaran tersedia",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                            ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
                          child: Text(
                            'Terbaru',
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Builder(builder: (context) {
                        return CarouselSlider(
                          options: CarouselOptions(
                            height: 146.0.h,
                            autoPlay: true,
                            enlargeCenterPage: true,
                          ),
                          items: controller.bannerList.map((banner) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  height: 146.h,
                                  width: ScreenUtil().screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0.r),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0.r),
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        if (banner.eventId != null) {
                                          log('Launch Url');
                                          launchUrl(
                                              Uri.parse(banner.eventUrl!));
                                        }
                                      },
                                      child: FadeInImage(
                                        placeholder: const AssetImage(
                                            'assets/img/placeholder.png'),
                                        image: NetworkImage(banner.eventImage),
                                        imageErrorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/img/placeholder.png',
                                            fit: BoxFit.fill,
                                          );
                                        },
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        );
                      }),
                      SizedBox(
                        height: 20.0.h,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
