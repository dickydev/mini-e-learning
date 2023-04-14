import 'package:get/get.dart';
import 'package:mini_e_learning/app/data/repository/banner_repository.dart';
import 'package:mini_e_learning/app/data/repository/course_repository.dart';
import 'package:mini_e_learning/app/data/repository/user_repository.dart';
import 'package:mini_e_learning/app/data/services/dio_client.dart';
import 'package:mini_e_learning/app/data/services/firebase_service.dart';
import 'package:mini_e_learning/app/modules/dashboard/page/Discus/controllers/discus_controller.dart';
import 'package:mini_e_learning/app/modules/dashboard/page/Profile/controllers/profile_controller.dart';

import '../page/Home/controllers/home_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(Get.find()));
    Get.lazyPut<BannerRepository>(() => BannerRepositoryImpl(Get.find()));
    Get.lazyPut<FirebaseServices>(() => FirebaseServices());
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(Get.find()));

    Get.lazyPut<HomeController>(
      () => HomeController(Get.find(), Get.find()),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(Get.find(), Get.find()),
    );
    Get.lazyPut<DiscusController>(
      () => DiscusController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
