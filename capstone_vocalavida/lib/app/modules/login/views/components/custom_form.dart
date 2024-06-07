// import 'package:capstone_vocalavida/app/style/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../style/text_style.dart';

// class CustomForm extends StatelessWidget {
//   final String title;
//   // final void Function(String) onChanged;
//   final TextEditingController controller;
//   bool? obscureText;
//   final Widget? icon;
//   final String? Function(String?)? validator;

//   CustomForm({
//     super.key,
//     required this.title,
//     // required this.onChanged,
//     required this.controller,
//     this.obscureText,
//     this.icon,
//     this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: validator,
//       obscureText: obscureText ?? false,
//       controller: controller,
//       style: light.copyWith(fontSize: 14, color: mistBlue),
//       decoration: InputDecoration(
//         isDense: false,
//         filled: true,
//         fillColor: const Color(0xFFECECEC),
//         hintText: title,
//         hintStyle: const TextStyle(
//             color: Color(0xFFC3C3C3), fontWeight: FontWeight.w400),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//           borderSide: BorderSide(color: offWhite, width: 1),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//           borderSide: BorderSide(color: white, width: 1),
//         ),
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         suffixIcon: Padding(
//           padding: const EdgeInsets.all(10),
//           child: icon ?? null,
//         ),
//       ),
//     );
//   }
// }

import 'package:capstone_vocalavida/app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../style/text_style.dart';

class CustomForm extends StatelessWidget {
  final String title;
  // final void Function(String) onChanged;
  final TextEditingController controller;
  bool? obscureText;
  final Widget? icon;
  final String? Function(String?)? validator;
  final void Function()? toggleObsecureText;

  CustomForm(
      {super.key,
      required this.title,
      // required this.onChanged,
      required this.controller,
      this.obscureText,
      this.icon,
      this.validator,
      this.toggleObsecureText});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Warna bayangan
              blurRadius: 10.0, // Radius blur bayangan
              offset: Offset(0, 4), // Posisi offset bayangan
              // spreadRadius: 0.0, // Radius penyebaran bayangan
            ),
          ],
        ),
        child: TextFormField(
            validator: validator,
            obscureText: obscureText ?? false,
            controller: controller,
            style: light.copyWith(fontSize: 14, color: mistBlue),
            decoration: InputDecoration(
              isDense: false,
              filled: true,
              fillColor: white,
              hintText: title,
              hintStyle:
                  TextStyle(color: blueWood, fontWeight: FontWeight.w400),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: offWhite, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: white, width: 1),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              suffixIcon: obscureText != null
                  ? GestureDetector(
                      onTap: toggleObsecureText,
                      child: Icon(
                        obscureText! ? Icons.visibility_off : Icons.visibility,
                      ),
                    )
                  : Padding(padding: EdgeInsets.all(10), child: icon),
            )));
  }
}
