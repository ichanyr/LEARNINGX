import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  final String id;

  EditView({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Note",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Confirmation',
                content: Text(
                  'Are you sure you want to delete this?',
                  style: GoogleFonts.poppins(),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.deleteNote(context),
                    child: Text(
                      'Confirm',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ],
              );
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Obx(
        () => controller.title.value == null
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  child: ListView(
                    children: [
                      TextFormField(
                        initialValue: controller.title.value,
                        onChanged: (value) => controller.title.value = value,
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: controller.content.value,
                        onChanged: (value) => controller.content.value = value,
                        decoration: InputDecoration(
                          labelText: 'Content',
                        ),
                        maxLines: null,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter the content';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (Form.of(context)!.validate()) {
                            controller.onUpdate(context);
                          }
                        },
                        child: Text(
                          'Update',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
