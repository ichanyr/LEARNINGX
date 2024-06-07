import 'package:capstone_vocalavida/app/modules/home/controllers/home_controller.dart';
import 'package:capstone_vocalavida/app/modules/latihan/controllers/latihan_controller.dart';
import 'package:capstone_vocalavida/app/modules/materi/controllers/materi_controller.dart';
import 'package:capstone_vocalavida/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    Get.put(ProfileController());
    Get.put(LatihanController());
    Get.put(MateriController());
    super.onInit();
  }

  final List<String> screens = [
    'Latihan',
    'Materi',
    'Profile',
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
