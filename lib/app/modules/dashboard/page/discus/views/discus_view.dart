import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_e_learning/app/data/models/chat_model.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';
import 'package:mini_e_learning/app/widget/chat_bubble.dart';
import 'package:mini_e_learning/app/widget/snackbar_widget.dart';
import '../../../../../widget/chat_shimmer.dart';
import '../controllers/discus_controller.dart';

class DiscusView extends GetView<DiscusController> {
  const DiscusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.bgColorWhite,
      appBar: AppBar(
        backgroundColor: ColorPallete.bgColor,
        title: Text(
          'Diskusi Soal',
          style:
              GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refreshData(),
        child: GetBuilder<DiscusController>(builder: (controller) {
          return StreamBuilder(
            stream: controller
                .getCollection()
                .orderBy('message', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  controller.isLoading) {
                return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return chatShimmer();
                    });
              }
              if (!snapshot.hasData) {
                ErrorSnack.show(message: "Saat ini tidak ada diskusi tersedia");
                return const Center(
                  child: Text('Tidak ada chat tersedia'),
                );
              }

              if (snapshot.hasError) {
                ErrorSnack.show(message: "Gagal mendapatkan data chat !!!");
                return const Center();
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.reversed.length,
                itemBuilder: (context, index) {
                  Message chat =
                      Message.fromFirestore(snapshot.data!.docs[index]);
                  if (chat.email == controller.userData.data!.userEmail!) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ChatBubble(
                            colorp: const Color(0xff3A7FD5),
                            name: chat.name,
                            message: chat.message,
                            sendAt: chat.sendAt,
                            isSender: true,
                          )
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ChatBubble(
                              colorp: const Color(0xffE0F8FF),
                              name: chat.name,
                              message: chat.message,
                              sendAt: chat.sendAt)
                        ],
                      ),
                    );
                  }
                },
              );
            },
          );
        }),
      ),
      bottomNavigationBar: Container(
        height: 65.h,
        width: ScreenUtil().screenWidth,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.h, top: 5.h),
                child: TextField(
                  controller: controller.messageController,
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                    filled: true,
                    fillColor: ColorPallete.bgColorForm,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            InkWell(
              onTap: () {
                if (controller.messageController.text.isNotEmpty) {
                  controller.sendMessage(controller.messageController.text);
                  controller.messageController.clear();
                }
              },
              child: Container(
                height: 35.h,
                width: 35.h,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
