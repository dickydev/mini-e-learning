import 'package:get/get.dart';
import 'package:mini_e_learning/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 2000))
        .then((value) => Get.offAllNamed(Routes.login));
  }
}
