import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 32.w, top: 45.h),
            child: Text(
              "Login",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 30.0.h,
          ),
          Image.asset(
            "assets/img/analys.png",
            width: ScreenUtil().screenWidth,
            height: 255.0.h,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 60.0.h,
          ),
          Text(
            'Selamat Datang',
            style: GoogleFonts.poppins(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              'Selamat Datang di Aplikasi Wskel Edu Aplikasi Latihan dan Konsultasi Soal',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 230.0.h,
          ),
          GetBuilder<LoginController>(
            builder: (controller) {
              return controller.isLoading
                  ? SizedBox(
                      height: 50.h,
                      width: 50.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50.h,
                        width: 269.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 1, color: ColorPallete.strokeGreen),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        ),
                        child: Material(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                          child: InkWell(
                            splashColor: ColorPallete.bgColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                            onTap: () async {
                              await controller.onGoogleSignIn();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icon/google.png",
                                  width: 26.0.w,
                                  height: 26.0.h,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  width: 12.0.h,
                                ),
                                Text(
                                  "Masuk dengan Google",
                                  style: GoogleFonts.poppins(
                                    fontSize: 17.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
