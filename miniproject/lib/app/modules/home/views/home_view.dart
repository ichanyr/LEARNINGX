import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../login/components/custom_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final User? user = FirebaseAuth.instance.currentUser;
  final HomeController controller = Get.find();
  final ImagePicker _picker = ImagePicker();
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // controller;
    return Scaffold(
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var userData = snapshot.data!.data() as Map<String, dynamic>;

              return Stack(fit: StackFit.expand, children: [
                Image.asset(
                  'assets/images/Bg-Home Screen.png',
                  fit: BoxFit.cover,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello, ${userData['name']}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'How\'s your day going?',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: controller
                                        .profilePhotoUrl.value.isEmpty
                                    ? AssetImage('assets/images/Profile.png')
                                    : NetworkImage(
                                            controller.profilePhotoUrl.value)
                                        as ImageProvider,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Color(0xffD4D4D4),
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'My Phone Number : ${userData['phoneNumber']}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Text('My Address : ${userData['address']}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(height: 200),
                              CustomButton(
                                  text: 'Upload Photo',
                                  onPressed: () async {
                                    final XFile? pickedFile = await _picker
                                        .pickImage(source: ImageSource.gallery);

                                    if (pickedFile != null) {
                                      controller.uploadPhoto(pickedFile.path);
                                    }
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]);
            }));
  }
}
