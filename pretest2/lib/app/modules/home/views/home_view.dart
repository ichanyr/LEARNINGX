import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretest2/app/modules/home/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 60),
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          'assets/images/profil.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 90, // Menggeser ke atas sebesar 90 piksel
                      left: MediaQuery.of(context).size.width / 2 -
                          130, // Menggeser ke kanan agar di tengah
                      child: Column(
                        children: [
                          Obx(
                            () => CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                controller.profil.value.imageUrl,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('@' + controller.profil.value.firstName,
                              style: GoogleFonts.poppins()
                                  .copyWith(fontSize: 16, color: Colors.grey)),
                          Text(
                              controller.profil.value.firstName +
                                  ' ' +
                                  controller.profil.value.lastName,
                              style: GoogleFonts.poppins().copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              )),
                          Text('Android Developer',
                              style: GoogleFonts.poppins()
                                  .copyWith(fontSize: 16, color: Colors.grey)),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.person, color: Colors.grey),
                                      SizedBox(width: 8),
                                      Text('Follow')
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 30),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.message, color: Colors.grey),
                                      SizedBox(width: 8),
                                      Text('Message')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 320,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Information',
                      style: GoogleFonts.poppins()
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Email',
                          style: GoogleFonts.poppins()
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(width: 16),
                        Text(controller.profil.value.email,
                            style: GoogleFonts.poppins()
                                .copyWith(color: Colors.grey))
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Email',
                          style: GoogleFonts.poppins()
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(width: 16),
                        Text('Email',
                            style: GoogleFonts.poppins()
                                .copyWith(color: Colors.grey))
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Gender',
                          style: GoogleFonts.poppins()
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(width: 16),
                        Text(controller.profil.value.gender,
                            style: GoogleFonts.poppins()
                                .copyWith(color: Colors.grey))
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.cottage_outlined,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'City',
                          style: GoogleFonts.poppins()
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(width: 16),
                        Text(controller.profil.value.city,
                            style: GoogleFonts.poppins()
                                .copyWith(color: Colors.grey))
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_city_outlined,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Country',
                          style: GoogleFonts.poppins()
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(width: 16),
                        Text(controller.profil.value.country,
                            style: GoogleFonts.poppins()
                                .copyWith(color: Colors.grey))
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
