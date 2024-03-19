import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tugas5_1/app/modules/home/models/menu_list_model.dart';
import 'package:tugas5_1/app/routes/app_pages.dart';
import 'dart:convert';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  Rx<FilterModel?> selectedCategory = Rx<FilterModel?>(null);

  @override
  // untuk menginisialisasi data ketika controller pertama kali dijalankan
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // untuk mengambil data dari API
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
      // Jika nilai pencarian kosong, kembalikan daftar kategori ke nilai awal dari API
      fetchCategories();
      return;
    }

    // Buat list sementara untuk menampung hasil pencarian
    List<CategoryModel> filteredCategories = [];

    // Iterasi melalui daftar kategori asli dan tambahkan ke list sementara
    categories.forEach((category) {
      if (category.category.toLowerCase().contains(value.toLowerCase())) {
        filteredCategories.add(category);
      }
    });

    // Perbarui daftar kategori dengan hasil pencarian
    categories.assignAll(filteredCategories);
  }

  // untuk pindah ke halaman detail
  void getToList() {
    Get.toNamed(Routes.HOME, arguments: categories);
  }

  void setSelectedCategory(FilterModel? category) {
    selectedCategory.value = category;
  }
}
