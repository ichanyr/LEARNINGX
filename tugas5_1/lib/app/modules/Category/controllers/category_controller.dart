import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tugas5_1/app/routes/app_pages.dart';
import 'dart:convert';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      var response = await http.get(
          Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        categories.assignAll((data['categories'] as List)
            .map((json) => CategoryModel.fromJson(json))
            .toList());
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void searchCategory(String value) {
    // Filter categories based on the search value
    if (value.isEmpty) {
      // If search value is empty, show all categories
      categories.assignAll([...categories]);
      return;
    }
    categories.assignAll(categories
        .where((category) =>
            category.category.toLowerCase().contains(value.toLowerCase()))
        .toList());
  }

  void getToList() {
    Get.toNamed(Routes.HOME);
  }
}
