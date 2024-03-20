import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:tugass5_2/app/modules/home/controllers/home_controller.dart';
import 'dart:convert';
import 'package:tugass5_2/app/modules/home/views/add_view.dart';
import 'package:tugass5_2/app/modules/home/views/edit_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo App',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.notes.isEmpty) {
            return Center(
              child: Text("No Data Available", style: GoogleFonts.poppins()),
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: controller.notes.length,
              itemBuilder: (context, index) {
                final note = controller.notes[index];
                return GestureDetector(
                  onTap: () => controller.onTapEdit(note['id']),
                  child: Card(
                    color: controller
                        .lightColors[index % controller.lightColors.length],
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${note['date']}',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${note['title']}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(() => Add());
        },
      ),
    );
  }
}
