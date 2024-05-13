import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../../login/components/custom_button.dart';
import '../../login/components/custom_text_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final RegisterController registerController = Get.put(RegisterController());
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      Image.asset(
        'assets/images/Bg-Login Register.png',
        fit: BoxFit.cover,
      ),
      Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register Your Account',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 30)),
              SizedBox(height: 18),
              CustomTextField(
                  labelText: 'Username',
                  hintText: 'Username here..',
                  controller: controller.usernameController),
              SizedBox(height: 10),
              CustomTextField(
                  labelText: 'Name',
                  hintText: 'Name here..',
                  controller: controller.nameController),
              SizedBox(height: 10),
              CustomTextField(
                  labelText: 'Address',
                  hintText: 'Address here..',
                  controller: controller.addressController),
              SizedBox(height: 10),
              CustomTextField(
                  labelText: 'Phone Number',
                  hintText: 'Phone Number here..',
                  controller: controller.phoneController),
              SizedBox(height: 10),
              CustomTextField(
                  labelText: 'Password',
                  hintText: 'Password here..',
                  controller: controller.passwordController),
              SizedBox(height: 10),
              CustomTextField(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Password here..',
                  controller: controller.confirmPasswordController),
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
        ),
      )
    ]));
  }
}
