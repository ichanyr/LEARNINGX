import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../components/custom_button.dart';
import '../components/custom_text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/Bg-Login Register.png',
          fit: BoxFit.cover,
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/login_logo 1.png',
                  // width: 200,
                  // height: 200,
                ),
                SizedBox(height: 16),
                Text('Welcome To Azalea',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 30)),
                SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Username',
                  hintText: 'Username here..',
                  controller: controller.addressController,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Password',
                  hintText: 'Password here..',
                  controller: controller.passwordController,
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    if (controller.addressController.text.isEmpty ||
                        controller.passwordController.text.isEmpty) {
                      Get.snackbar(
                        'Error',
                        'Please fill all fields',
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 2),
                        margin: EdgeInsets.all(12),
                      );
                    } else {
                      controller.login(
                        controller.addressController.text,
                        controller.passwordController.text,
                      );
                    }
                  },
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.REGISTER);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Don’t have an account ? ',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text: 'Sign in',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Color(0xff0094FF),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
