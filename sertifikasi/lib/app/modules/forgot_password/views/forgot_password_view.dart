import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertifikasi/app/modules/login/components/custom_button.dart';

import '../../login/components/custom_text_field.dart';
import '../../login/controllers/login_controller.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
        //     body: Center(
        //         child:
        //             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //   Padding(
        //     padding: EdgeInsets.all(10.0),
        //     child: Container(
        //       height: 50,
        //       width: 50,
        //       decoration: BoxDecoration(
        //         border: Border.all(color: Colors.black, width: 1),
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: IconButton(
        //           icon: const Icon(Icons.arrow_back_ios_sharp),
        //           onPressed: () {
        //             Navigator.pop(context);
        //           }),
        //     ),
        //   ),
        //   const Padding(
        //     padding: EdgeInsets.all(10.0),
        //     child: Text("Forgot Password?",
        //         style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 30,
        //           fontWeight: FontWeight.bold,
        //         )),
        //   ),
        //   const Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Text(
        //         "Dont worry it occurs to us all. We will send you a link to reset your password.",
        //         style: TextStyle(
        //           color: Color(0xff8391A1),
        //           fontSize: 20,
        //           // fontWeight: FontWeight.bold,
        //         )),
        //   ),
        //   CustomizedTextfield(
        //     myController: loginController.addressController,
        //     hintText: "Enter your Email",
        //     isPassword: false,
        //   ),
        //   CustomButton(text: 'Confirm', onPressed: () {})
        // ])
        // )
        );
  }
}
