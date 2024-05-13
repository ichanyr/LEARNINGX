// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../routes/app_pages.dart';

// class RegisterController extends GetxController {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Text editing controllers
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();

//   void register() async {
//     // Ambil nilai dari setiap text editing controller
//     String username = usernameController.text.trim();
//     String name = nameController.text.trim();
//     String address = addressController.text.trim();
//     String phoneNumber = phoneNumberController.text.trim();
//     String password = passwordController.text;

//     // Buat objek Map yang berisi data pengguna
//     Map<String, dynamic> userData = {
//       'username': username,
//       'name': name,
//       'address': address,
//       'phoneNumber': phoneNumber,
//     };

//     try {
//       // Buat pengguna baru di Firebase Authentication
//       UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: address,
//         password: password,
//       );

//       // Ambil ID pengguna yang baru dibuat
//       String userId = userCredential.user!.uid;

//       // Simpan data pengguna ke Firestore
//       await _firestore.collection('users').doc(userId).set(userData);

//       // Tampilkan pesan sukses
//       Get.snackbar(
//         'Success',
//         'User registered successfully',
//         snackPosition: SnackPosition.BOTTOM,
//         duration: Duration(seconds: 2),
//         margin: EdgeInsets.all(12),
//       );

//       // Clear text editing controllers setelah pendaftaran berhasil
//       clearControllers();

//       // Navigate to login page
//       Get.offAllNamed(Routes.LOGIN);
//     } catch (e) {
//       print('Error registering user: $e');

//       // Tampilkan pesan error jika terjadi masalah saat pendaftaran
//       Get.snackbar(
//         'Error',
//         'Failed to register user. Please try again later.',
//         snackPosition: SnackPosition.BOTTOM,
//         duration: Duration(seconds: 2),
//         margin: EdgeInsets.all(12),
//       );
//     }
//   }

//   // Fungsi untuk mengosongkan text editing controllers
//   void clearControllers() {
//     usernameController.clear();
//     nameController.clear();
//     addressController.clear();
//     phoneNumberController.clear();
//     passwordController.clear();
//     confirmPasswordController.clear();
//   }
// }

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miniproject/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  var passwordVisible = true.obs;
  var passwordVisibleconfirm = true.obs;

  late String userId;

  @override
  void onClose() {
    usernameController.dispose();
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  void register() async {
    String username = usernameController.text.trim();
    String name = nameController.text.trim();
    String address = addressController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (username.isEmpty ||
        name.isEmpty ||
        address.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Semua form harus diisi');
      return;
    }

    if (!isNumeric(phone) || phone.length > 12) {
      Get.snackbar(
          'Error', 'Phone number harus berupa angka dan maksimal 12 digit');
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
      await addData(userId, name, address, phone);
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

      nameController.clear();
      addressController.clear();
      phoneController.clear();
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

  Future<void> addData(
      String userId, String name, String address, String phone) async {
    try {
      await FirebaseFirestore.instance.collection('User').doc(userId).set({
        'name': name,
        'address': address,
        'phone': phone,
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
