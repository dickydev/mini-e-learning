import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mini_e_learning/app/data/utils/color_pallete.dart';
import 'package:mini_e_learning/app/modules/question/controllers/question_controller.dart';

class AnswerWidget extends StatelessWidget {
  final String option;
  final dynamic question;
  final dynamic questionImg;
  final QuestionController controller;

  const AnswerWidget({
    Key? key,
    required this.option,
    this.question,
    this.questionImg,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectedOption = option;
        controller.answerList[controller.currentQuestionIndex] = (option);
        if (!controller.answeredQuestion
            .contains(controller.currentQuestionIndex)) {
          controller.answeredQuestion.add(controller.currentQuestionIndex);
        }
        log('daftar banksoal : ${controller.questionBankList}');
        log('daftar jawaban : ${controller.answerList}');
        log('daftar soal sudah dijawab : ${controller.answeredQuestion}');
        controller.update();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 7.h),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
        decoration: BoxDecoration(
          color:
              option == controller.answerList[controller.currentQuestionIndex]
                  ? ColorPallete.bgColor
                  : Colors.white,
          border: Border.all(
            width: 1.0,
            color: ColorPallete.answerBorder,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$option.'),
            SizedBox(
              width: 15.0.h,
            ),
            Expanded(
              child: Column(
                children: [
                  HtmlWidget(
                    question,
                  ),
                  questionImg != null
                      ? Image.network(
                          questionImg,
                          fit: BoxFit.cover,
                        )
                      : const Center()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
