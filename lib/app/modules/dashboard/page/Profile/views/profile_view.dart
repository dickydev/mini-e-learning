// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';

import '../../../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: ScreenUtil().screenWidth,
            height: kToolbarHeight,
            color: ColorPallete.bgColor,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  child: Text(
                    'My App',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 20.w),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.editProfile);
                    },
                    child: Text(
                      'Edit',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 20.h),
            width: ScreenUtil().screenWidth,
            height: 130,
            decoration: BoxDecoration(
              color: ColorPallete.bgColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.userData.data!.userName!,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        controller.userData.data!.userAsalSekolah!,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 80.w,
                    height: 80.h,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        controller.userData.data!.userFoto!,
                      ),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/img/avatar.png'),
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
          ),
          Flexible(
            child: SizedBox(
              height: ScreenUtil().screenHeight * 0.7,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  GetBuilder<ProfileController>(
                    builder: (controller) {
                      return Column(
                        children: [
                          Container(
                            width: ScreenUtil().screenWidth,
                            margin: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 20.h),
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 20.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 7,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Identitas Diri',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0.h,
                                ),
                                Text(
                                  'Nama Lengkap',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    color: ColorPallete.subTitle,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  controller.userData.data!.userName!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0.h,
                                ),
                                Text(
                                  'Email',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    color: ColorPallete.subTitle,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  controller.userData.data!.userEmail!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0.h,
                                ),
                                Text(
                                  'Jenis Kelamin',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    color: ColorPallete.subTitle,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  controller.userData.data!.userGender!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0.h,
                                ),
                                Text(
                                  'Kelas',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    color: ColorPallete.subTitle,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  controller.userData.data!.kelas!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0.h,
                                ),
                                Text(
                                  'Sekolah',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    color: ColorPallete.subTitle,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  controller.userData.data!.userAsalSekolah!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.signOut();
                            },
                            child: Container(
                              width: ScreenUtil().screenWidth,
                              height: 50.h,
                              margin: EdgeInsets.only(
                                  left: 16.w, top: 10.h, right: 16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 6,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.w),
                                    child: Icon(
                                      Icons.logout,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Text(
                                    "Logout",
                                    style: GoogleFonts.poppins(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
