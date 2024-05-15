// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get.dart';

// class CustomTextField extends StatelessWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final bool isPasswordField;
//   final RxBool? obscureText;

//   const CustomTextField({
//     Key? key,
//     required this.hintText,
//     required this.controller,
//     this.isPasswordField = false,
//     this.obscureText,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25),
//           child: Text(
//             hintText,
//             style: GoogleFonts.poppins(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//         SizedBox(height: 8),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25),
//           child: Container(
//             width: double.infinity,
//             child: Obx(() => TextField(
//                   controller: controller,
//                   obscureText:
//                       isPasswordField ? obscureText?.value ?? true : false,
//                   decoration: InputDecoration(
//                     hintText: hintText,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: Colors.grey),
//                     ),
//                     hintStyle: GoogleFonts.poppins(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     suffixIcon: isPasswordField
//                         ? IconButton(
//                             icon: Icon(
//                               obscureText?.value ?? true
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                             onPressed: () {
//                               if (obscureText != null) {
//                                 obscureText!.value = !obscureText!.value;
//                               }
//                             },
//                           )
//                         : null,
//                   ),
//                 )),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomizedTextfield extends StatelessWidget {
  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;
  const CustomizedTextfield(
      {Key? key, required this.myController, this.hintText, this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        keyboardType: isPassword!
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        enableSuggestions: isPassword! ? false : true,
        autocorrect: isPassword! ? false : true,
        obscureText: isPassword ?? true,
        controller: myController,
        decoration: InputDecoration(
          suffixIcon: isPassword!
              ? IconButton(
                  icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                  onPressed: () {},
                )
              : null,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
              borderRadius: BorderRadius.circular(10)),
          fillColor: const Color(0xffE8ECF4),
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
