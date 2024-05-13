import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final picker = ImagePicker();

  var userName = ''.obs;
  var phoneNumber = ''.obs;
  var address = ''.obs;
  var profilePhotoUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        DocumentSnapshot userSnapshot =
            await _firestore.collection('users').doc(user.uid).get();

        if (userSnapshot.exists) {
          Map<String, dynamic>? userData =
              userSnapshot.data() as Map<String, dynamic>?;

          if (userData != null) {
            userName.value = userData['name'] ?? '';
            phoneNumber.value = userData['phoneNumber'] ?? '';
            address.value = userData['address'] ?? '';

            String? photoUrl = userData['photoUrl'];
            if (photoUrl != null && photoUrl.isNotEmpty) {
              profilePhotoUrl.value = photoUrl;
            }
          }
        }
      }
    } catch (e) {
      Get.snackbar("Error", '$e');
    }
  }

  Future<void> uploadPhoto(String imagePath) async {
    try {
      // Mendapatkan referensi storage dari Firebase

      final ref = FirebaseStorage.instance
          .ref()
          .child('user_photos') // Folder untuk menyimpan foto pengguna
          .child(
              '${DateTime.now().millisecondsSinceEpoch}.png'); // Nama unik untuk file gambar

      // Mengunggah file gambar ke Firebase Storage
      await ref.putFile(File(imagePath));

      // Mendapatkan URL download gambar setelah diunggah
      String downloadUrl = await ref.getDownloadURL();

      // Menyimpan URL download gambar ke database
      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        'photoUrl': downloadUrl,
      });

      // Memperbarui nilai profilePhotoUrl
      profilePhotoUrl.value = downloadUrl;
    } catch (e) {
      // Menampilkan pesan kesalahan jika terjadi kesalahan saat mengunggah foto
      Get.snackbar(
        'Error',
        'Failed to upload photo. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(12),
      );
    }
  }

  void addOrUpdatePhoto() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imagePath = pickedFile.path;
        await uploadPhoto(imagePath);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(12),
      );
    }
  }
}
