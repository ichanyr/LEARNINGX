import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  var passwordVisible = true.obs;
  var passwordVisibleconfirm = true.obs;

  late String userId;

  @override
  void onClose() {
    usernameController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // @override
  // void onInit() {
  //   nameController = TextEditingController();
  //   addressController = TextEditingController();
  //   phoneController = TextEditingController();
  //   super.onInit();
  // }

  void register() async {
    String username = usernameController.text.trim();

    String address = addressController.text.trim();

    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (username.isEmpty ||
        address.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Semua form harus diisi');
      return;
    }

    if (password.length > 16) {
      Get.snackbar('Error', 'Password maksimal 16 karakter');
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar('Error', 'Password tidak sama');
      return;
    }

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: '$username@gmail.com', password: password);

      userId = userCredential.user!.uid;
      await addData(
        userId,
        address,
        username,
      );
      Get.snackbar('Berhasil', 'Pengguna berhasil dibuat');
      userCredential.user!.sendEmailVerification();
      Get.defaultDialog(
        title: 'Verifikasi email Anda',
        middleText:
            'Silakan verifikasi email Anda untuk melanjutkan. Kami telah mengirimkan tautan verifikasi email kepada Anda.',
        textConfirm: 'OK',
        textCancel: 'Kirim ulang',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.offAllNamed(Routes.LOGIN);
        },
        onCancel: () {
          userCredential.user!.sendEmailVerification();
          Get.snackbar('Berhasil', 'Tautan verifikasi email terkirim');
        },
      );

      addressController.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'Password yang diberikan terlalu lemah.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'Akun sudah ada untuk email tersebut.');
      } else {
        Get.snackbar('Error', e.message ?? 'Terjadi kesalahan');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> addData(String userId, String address, String username) async {
    try {
      await FirebaseFirestore.instance.collection('User').doc(userId).set({
        'username': username,
        'address': address,
      });
    } catch (e) {
      print(e);
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
