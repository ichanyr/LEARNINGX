import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tugas5_1/app/modules/home/models/menu_list_model.dart';
import 'package:tugas5_1/app/routes/app_pages.dart';
import 'dart:convert';

class HomeController extends GetxController {
  RxList<FilterModel> filterCategory = <FilterModel>[].obs;

  @override
  // untuk menginisialisasi data ketika controller pertama kali dijalankan
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // untuk mengambil data dari API
  Future<void> fetchCategories() async {
    try {
      var response = await http.get(Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/filter.php?c=$fetchCategories()'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        filterCategory.assignAll((data['meals'] as List)
            .map((json) => FilterModel.fromJson(json))
            .toList());
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // untuk mencari kategori
  void searchCategory(String value) {
    // Filter categories based on the search value
    if (value.isEmpty) {
      // If search value is empty, show all categories
      filterCategory.assignAll([...filterCategory]);
      return;
    }
    filterCategory.assignAll(filterCategory
        .where((category) =>
            category.title.toLowerCase().contains(value.toLowerCase()))
        .toList());
  }
}
