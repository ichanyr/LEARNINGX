import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
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
                    'assets/images/Onboarding.png',
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Bernyanyi Jalanmu Menuju Sukses',
                    style: TextStyle(
                      color: Color(0xFF636D77),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Buka suara Anda, bebaskan jiwa Anda. ',
                    style: TextStyle(
                      color: Color(0xFF636D77),
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/login'); // Mengarahkan ke LoginView
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5667FD),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Persegi panjang dengan sedikit rounding
                  ),
                ),
                child: Text(
                  'Mulai',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
