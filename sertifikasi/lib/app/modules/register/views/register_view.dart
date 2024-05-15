import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../../forgot_password/views/forgot_password_view.dart';
import '../../login/components/custom_button.dart';
import '../../login/components/custom_text_field.dart';
import '../../login/controllers/login_controller.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final RegisterController registerController = Get.put(RegisterController());
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Register Your Account',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 30)),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Welcome new user,',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300, fontSize: 16)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Please register to your account',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300, fontSize: 16)),
            ),
          ),
          SizedBox(height: 18),
          CustomizedTextfield(
            myController: controller.usernameController,
            hintText: "Username",
            isPassword: false,
          ),
          SizedBox(height: 10),
          CustomizedTextfield(
            myController: controller.addressController,
            hintText: "Email",
            isPassword: false,
          ),
          SizedBox(height: 10),
          CustomizedTextfield(
            myController: controller.passwordController,
            hintText: "Password",
            isPassword: true,
          ),
          SizedBox(height: 10),
          CustomizedTextfield(
            myController: controller.passwordController,
            hintText: "Confirm Password",
            isPassword: false,
          ),
          SizedBox(height: 20),
          CustomButton(
              text: 'Register',
              onPressed: () {
                controller.register();
              }),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account ? ',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: 'Log in',
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
    )));
  }
}
