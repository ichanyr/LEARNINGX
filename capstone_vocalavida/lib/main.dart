import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/login/controllers/login_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD6iqPezArPWSSmbc2P40QkAKmBNhRry54",
          appId: "1:732129938065:android:0f07a45f9b2697fcb3cd30",
          messagingSenderId: "732129938065",
          projectId: "mcapstone-dbe0e"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginController authC = Get.put(LoginController(), permanent: true);
  // final authC = Get.put(LoginController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot);
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute: AppPages.INITIAL,
              // initialRoute: Routes.PROFILE,
              // snapshot.data != null && snapshot.data!.emailVerified == true
              //     ? Routes.HOME
              //     : Routes.LOGIN,
              getPages: AppPages.routes,
              theme: ThemeData(
                primarySwatch: Colors.indigo,
              ),
            );
          }
          return LoadingView();
        });
  }
}
