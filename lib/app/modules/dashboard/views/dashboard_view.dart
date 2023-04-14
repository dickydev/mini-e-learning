import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_e_learning/app/modules/dashboard/page/Home/views/home_view.dart';
import 'package:mini_e_learning/app/modules/dashboard/page/Profile/views/profile_view.dart';
import 'package:mini_e_learning/app/modules/dashboard/page/Discus/views/discus_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int selectedIndex = controller.selectedNavIndex.value;
      return SafeArea(
        child: Scaffold(
          body: IndexedStack(
              index: controller.selectedNavIndex.value, children: _bodyList()),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              controller.navigateTo(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_rounded),
                label: 'Diskusi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> _bodyList() => [
        const HomeView(),
        const DiscusView(),
        const ProfileView(),
      ];
}
