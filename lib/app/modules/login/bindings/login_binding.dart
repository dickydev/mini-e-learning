import 'package:get/get.dart';
import 'package:mini_e_learning/app/data/repository/user_repository.dart';
import 'package:mini_e_learning/app/data/services/firebase_service.dart';
import '../../../data/services/dio_client.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(Get.find()));
    Get.lazyPut(() => FirebaseServices());

    Get.lazyPut(
        () => LoginController(Get.find<FirebaseServices>(), Get.find()));
  }
}
