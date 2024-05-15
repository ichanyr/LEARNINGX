import 'package:flutter/cupertino.dart';
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
        body: Center(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 30)),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Welcome back,',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300, fontSize: 16)),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Please login to your account',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300, fontSize: 16)),
                ),
              ),
              SizedBox(height: 16),
              CustomizedTextfield(
                myController: controller.addressController,
                hintText: "Email",
                isPassword: false,
              ),
              SizedBox(height: 16),
              CustomizedTextfield(
                myController: controller.passwordController,
                hintText: "Password",
                isPassword: true,
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.FORGOT_PASSWORD);
                    },
                    child: Text('Forgot Password?',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xff0094FF),
                            fontWeight: FontWeight.w400)),
                  ),
                ),
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
                      snackPosition: SnackPosition.TOP,
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
      ),
    ));
  }
}
