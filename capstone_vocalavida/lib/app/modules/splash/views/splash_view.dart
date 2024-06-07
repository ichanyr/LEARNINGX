import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Logo.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Vocal La Vida',
                    style: bold.copyWith(
                      color: blueWood,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: Text(
                'Copyright Byte 2024',
                textAlign: TextAlign.center,
                style: medium.copyWith(
                  color: mistBlue,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
