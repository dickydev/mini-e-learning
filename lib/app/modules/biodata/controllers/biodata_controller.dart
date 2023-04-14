import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_e_learning/app/data/repository/user_repository.dart';
import 'package:mini_e_learning/app/widget/snackbar_widget.dart';

import '../../../data/models/user_model.dart';
import '../../../data/models/user_regis_model.dart';
import '../../../routes/app_pages.dart';

class BiodataController extends GetxController {
  final UserRepository userRepository;

  BiodataController({required this.userRepository});

  late TextEditingController emailTextController;

  @override
  void onInit() {
    super.onInit();
    String? email = FirebaseAuth.instance.currentUser?.email;
    emailTextController = TextEditingController(text: email);
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController nameTextController = TextEditingController(text: '');
  TextEditingController schoolNameTextController =
      TextEditingController(text: '');
  String? jenisKelamin;
  String? kelas;
  String jenjang = 'SMA';

  List kelasList = ['10', '11', '12'];

  Future<void> registerUser() async {
    UserRegistration userRegistration = UserRegistration(
      namaLengkap: nameTextController.text,
      email: emailTextController.text,
      namaSekolah: schoolNameTextController.text,
      kelas: kelas!,
      gender: jenisKelamin!,
      photoUrl: 'https://widiskel.site/public/favicon.png',
      jenjang: jenjang,
    );
    try {
      final UserModel? userData =
          await userRepository.registerUser(userRegistration);
      if (userData != null) {
        SuccessSnack.show(message: 'Registrasi Berhasil');
        Get.offAllNamed(Routes.dashboard, arguments: userData);
      } else {
        ErrorSnack.show(message: 'Registrasi gagal');
      }
    } catch (e) {
      ErrorSnack.show(message: 'Terjadi Kesalahan');
    }
  }
}
