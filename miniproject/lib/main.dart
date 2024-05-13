import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBqbCEJNxIA0UCvA46Ei8TpvimzbZcz-FQ",
        appId: "1:224890914173:android:c65ec25534e402934d7814",
        messagingSenderId: "224890914173",
        projectId: "mini-project-928ef",
        storageBucket: "mini-project-928ef.appspot.com"),
  );
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
