import 'package:get/get.dart';
import 'package:mini_e_learning/app/data/repository/exercise_repository.dart';
import 'package:mini_e_learning/app/data/services/dio_client.dart';

import '../controllers/question_controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<ExerciseRepository>(() => ExerciseRepositoryImpl(Get.find()));

    Get.lazyPut<QuestionController>(
      () => QuestionController(Get.find()),
    );
  }
}
