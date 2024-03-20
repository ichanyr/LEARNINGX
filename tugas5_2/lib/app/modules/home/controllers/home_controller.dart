import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugass5_2/app/modules/home/views/edit_view.dart';

class HomeController extends GetxController {
  var notes = <dynamic>[].obs;

  final _lightColors = [
    Colors.amber.shade300,
    Colors.lightGreen.shade300,
    Colors.lightBlue.shade300,
    Colors.orange.shade300,
    Colors.pinkAccent.shade100,
    Colors.tealAccent.shade100
  ];

  List<Color> get lightColors => _lightColors;

  @override
  void onInit() {
    super.onInit();
    //inisialisasi data
    _getData();
  }

  Future<void> _getData() async {
    try {
      final response = await http.get(
        Uri.parse("http://192.168.43.66/flutter/note_app/list.php"),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
      );

      // jika respons sukses
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // masukkan data ke dalam list _notes
        notes.assignAll(data);
      }
    } catch (e) {
      print(e);
    }
  }

  void onTapEdit(String id) {
    Get.to(() => EditView(id: id));
  }
}
