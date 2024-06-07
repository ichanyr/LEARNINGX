import 'package:get/get.dart';

import '../../login/controllers/login_controller.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  void logout() {
    Get.find<LoginController>().logout();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
