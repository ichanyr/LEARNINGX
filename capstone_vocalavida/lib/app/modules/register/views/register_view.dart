import 'package:capstone_vocalavida/app/modules/login/views/components/custom_form.dart';
import 'package:capstone_vocalavida/app/modules/register/controllers/register_controller.dart';
import 'package:capstone_vocalavida/app/style/colors.dart';
import 'package:capstone_vocalavida/app/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:capstone_vocalavida/app/routes/app_pages.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Image.asset('assets/images/reg.png'),
            ),
            SizedBox(height: 5),
            Text(
              'Nama',
              style: medium.copyWith(fontSize: 16, color: mistBlue),
            ),
            SizedBox(height: 10),
            CustomForm(
              title: 'Nama Kamu',
              controller: controller.nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
              'Email',
              style: medium.copyWith(fontSize: 16, color: mistBlue),
            ),
            SizedBox(height: 10),
            CustomForm(
              title: 'name@example.com',
              controller: controller.emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
              'Sandi',
              style: medium.copyWith(fontSize: 16, color: mistBlue),
            ),
            SizedBox(height: 10),
            Obx(() => CustomForm(
                  title: 'Password',
                  controller: controller.passwordController,
                  obscureText: controller.obsecureText.value,
                  toggleObsecureText: controller.toggleObsecureText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                )),
            SizedBox(height: 44),
            Container(
              height: 61,
              width: 267,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ultramarineBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text('Daftar',
                    style: semibold.copyWith(fontSize: 20, color: white)),
                onPressed: () => controller.register(
                    controller.emailController.text,
                    controller.passwordController.text),
              ),
            ),
            SizedBox(height: 33),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah Punya Akun?',
                  style: regular.copyWith(fontSize: 18, color: mistBlue),
                ),
                TextButton(
                  child: Text('Masuk',
                      style: regular.copyWith(
                          fontSize: 18, color: ultramarineBlue)),
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
