import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDfqIpLuEFU3HwnKsz0ZC9vLJhJyjjo0sE",
        appId: "1:981997896271:android:5e1866ec297d230373603a",
        messagingSenderId: "981997896271",
        projectId: "sertifikasi-23f55",
        storageBucket: "sertifikasi-23f55.appspot.com"),
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
