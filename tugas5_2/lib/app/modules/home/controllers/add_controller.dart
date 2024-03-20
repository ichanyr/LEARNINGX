import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();

  Future<void> onSubmit() async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.43.66/flutter/note_app/create.php"),
        body: {
          "title": title.text,
          "content": content.text,
        },
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data["message"]);

        // Navigate to home screen
        Get.offAllNamed('/');
      }
    } catch (e) {
      print(e);
    }
  }
}
