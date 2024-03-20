import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../controllers/add_controller.dart';

class Add extends StatelessWidget {
  final AddController controller = Get.put(AddController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create New Note",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: controller.title,
                decoration: InputDecoration(
                    hintText: "Type Note Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    fillColor: Colors.white,
                    filled: true),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Note Title is Required!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Content',
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: controller.content,
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: 'Type Note Content',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    fillColor: Colors.white,
                    filled: true),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Note Content is Required!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  //validate
                  if (_formKey.currentState!.validate()) {
                    //send data to database with this method
                    controller.onSubmit();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
