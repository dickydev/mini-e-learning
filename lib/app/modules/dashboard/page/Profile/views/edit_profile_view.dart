import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/modules/dashboard/page/Profile/controllers/profile_controller.dart';

import '../../../../../data/utils/color_pallete.dart';
import '../../../../../widget/edit_form_widget.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      appBar: AppBar(
        backgroundColor: ColorPallete.bgColor,
        title: Text(
          'Edit Akun',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: GetBuilder<ProfileController>(
                builder: (controller) {
                  return Form(
                    key: controller.formKey,
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25.0.h,
                            ),
                            Text(
                              'Data Diri',
                              style: GoogleFonts.poppins(
                                  fontSize: 20.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 16.0.h,
                            ),
                            EditFormInput(
                              label: 'Nama Lengkap',
                              controller: controller.nameTextController,
                            ),
                            EditFormInput(
                              label: 'Email',
                              controller: controller.emailTextController,
                              enabled: false,
                            ),
                            EditFormInput(
                              label: 'Jenis Kelamin',
                              controller: controller.kelaminTextController,
                              enabled: false,
                            ),
                            EditFormInput(
                              label: 'Kelas',
                              controller: controller.kelasTextController,
                            ),
                            EditFormInput(
                              label: 'Sekolah',
                              controller: controller.sekolahTextController,
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            Container(
                              height: 50.h,
                              width: ScreenUtil().screenWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0.r),
                                ),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorPallete.bgColor,
                                ),
                                onPressed: () async {
                                  await controller.updateUser();
                                },
                                child: Text(
                                  "Perbarui Data",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
