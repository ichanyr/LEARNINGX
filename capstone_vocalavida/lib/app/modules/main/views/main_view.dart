import 'package:capstone_vocalavida/app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../latihan/views/latihan_view.dart';
import '../../materi/views/materi_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (controller.selectedIndex.value) {
          case 0:
            return MateriView();
          case 1:
            return LatihanView();
          default:
            return ProfileView();
        }
      }),
      bottomNavigationBar: Obx(() => ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: ultramarineBlue,
              unselectedItemColor: Colors.grey,
              currentIndex: controller.selectedIndex.value,
              onTap: controller.changeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/materi.svg',
                    color: controller.selectedIndex.value == 0
                        ? ultramarineBlue
                        : Colors.grey,
                  ),
                  label: 'Materi',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/latihan.svg',
                    color: controller.selectedIndex.value == 1
                        ? ultramarineBlue
                        : Colors.grey,
                  ),
                  label: 'Latihan & Ujian',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/akun.svg',
                    color: controller.selectedIndex.value == 2
                        ? ultramarineBlue
                        : Colors.grey,
                  ),
                  label: 'Akun',
                ),
              ],
            ),
          )),
    );
  }
}
