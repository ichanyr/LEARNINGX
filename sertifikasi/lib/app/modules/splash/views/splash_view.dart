import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'HELLO FELLAS.',
              style: GoogleFonts.poppins(
                  fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '''Temukan segala jenis bunga 
dari berbagai belahan dunia!''',
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w500),
            )
          ],
        )));
  }
}
