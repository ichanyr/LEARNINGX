import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class EditController extends GetxController {
  var title = ''.obs;
  var content = ''.obs;

  final String id;

  EditController({required this.id});

  @override
  void onInit() {
    super.onInit();
    _getData();
  }

  Future<void> _getData() async {
    try {
      final response = await http.get(
        Uri.parse("http://192.168.43.66/flutter/note_app/detail.php?id=$id"),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        title.value = data['title'];
        content.value = data['content'];
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> onUpdate(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.43.66/flutter/note_app/update.php"),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          "id": id,
          "title": title.value,
          "content": content.value,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data["message"]);
        Get.offAll('/');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteNote(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.43.66/flutter/note_app/delete.php"),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          "id": id,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data["message"]);
        Get.offAll('/');
      }
    } catch (e) {
      print(e);
    }
  }
}
