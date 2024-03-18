import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getcli_tugas4_3/app/modules/home/views/components/CustomContainer.dart';
import 'package:getcli_tugas4_3/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Saya',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Get.toNamed(Routes.LOGIN);
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/ichu.jpg'),
            ),
            SizedBox(height: 32),
            CustomTextContainer(
              text: 'Icha Nur Yuliarahma',
            ),
            SizedBox(height: 16),
            CustomTextContainer(
              text: 'Mobile Application Development',
            ),
            SizedBox(height: 16),
            CustomTextContainer(
              text: 'LearningX',
            ),
            SizedBox(height: 16),
            CustomTextContainer(
              text: 'ID Kegiatan: 7661963',
            ),
            SizedBox(height: 16),
            CustomTextContainer(
              text: 'Kelas : 1B Mobile Development',
            ),
          ],
        ),
      ),
    );
  }
}
