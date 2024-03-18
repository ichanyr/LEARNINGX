import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas5_1/app/routes/app_pages.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  // RxList<CategoryModel> categories = <CategoryModel>[].obs;
  // List<CategoryModel> category = [
  //   CategoryModel(
  //     category: 'Beef',
  //     image: 'https://www.themealdb.com/images/category/beef.png',
  //     description:
  //         'Beef is the culinary name for meat from cattle, particularly skeletal muscle.',
  //   ),
  //   CategoryModel(
  //     category: 'Chicken',
  //     image: 'https://www.themealdb.com/images/category/chicken.png',
  //     description: 'Chicken is the most common type of poultry in the world.',
  //   ),
  //   CategoryModel(
  //     category: 'Dessert',
  //     image: 'https://www.themealdb.com/images/category/dessert.png',
  //     description: 'Dessert is a course that concludes a meal.',
  //   ),
  //   CategoryModel(
  //     category: 'Lamb',
  //     image: 'https://www.themealdb.com/images/category/lamb.png',
  //     description: 'Lamb, hogget, and mutton are the meat of domestic sheep.',
  //   ),
  //   CategoryModel(
  //     category: 'Miscellaneous',
  //     image: 'https://www.themealdb.com/images/category/miscellaneous.png',
  //     description: 'Miscellaneous',
  //   ),
  //   CategoryModel(
  //     category: 'Pasta',
  //     image: 'https://www.themealdb.com/images/category/pasta.png',
  //     description:
  //         'Pasta is a type of food typically made from an unleavened dough of wheat flour mixed with water or eggs.',
  //   ),
  //   CategoryModel(
  //     category: 'Pork',
  //     image: 'https://www.themealdb.com/images/category/pork.png',
  //     description: 'Pork is the culinary name for the meat of a domestic pig.',
  //   ),
  //   CategoryModel(
  //     category: 'Seafood',
  //     image: 'https://www.themealdb.com/images/category/seafood.png',
  //     description:
  //         'Seafood is any form of sea life regarded as food by humans.',
  //   ),
  //   CategoryModel(
  //     category: 'Side',
  //     image: 'https://www.themealdb.com/images/category/side.png',
  //     description: 'Side',
  //   ),
  //   CategoryModel(
  //     category: 'Starter',
  //     image: 'https://www.themealdb.com/images/category/starter.png',
  //     description: 'Starter',
  //   ),
  //   CategoryModel(
  //     category: 'Vegan',
  //     image: 'https://www.themealdb.com/images/category/vegan.png',
  //     description: 'Vegan',
  //   ),
  //   CategoryModel(
  //     category: 'Vegetarian',
  //     image: 'https://www.themealdb.com/images/category/vegetarian.png',
  //     description: 'Vegetarian',
  //   ),
  // ];
  CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            TextField(
              // controller: controller.textController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'List Meal From API',
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.HOME);
              },
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    // untuk menampilkan jumlah data yang diambil dari API
                    print("Number of items: ${controller.categories.length}");

                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Image.network(controller.categories[index].image),
                            SizedBox(height: 8),
                            Text(
                              controller.categories[index].category,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              controller.categories[index].description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ))
          ],
        ),
      ),
    ));
  }
}
