import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getcli_tugas4_3/app/modules/home/views/home_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
