import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tugas5_1/app/modules/Category/controllers/category_controller.dart';
import 'package:tugas5_1/app/modules/Category/views/category_view.dart';
import 'package:tugas5_1/app/modules/home/views/home_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(CategoryController());
  runApp(
    GetMaterialApp(
      // home: HomeView(),
      home: CategoryView(),
      debugShowCheckedModeBanner: false,
      // title: "Application",
      // initialRoute: AppPages.INITIAL,
      // getPages: AppPages.routes,
    ),
  );
}
