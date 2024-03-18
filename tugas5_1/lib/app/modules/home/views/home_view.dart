import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas5_1/app/modules/Category/models/category_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CategoryModel category = Get.arguments as CategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Category: ${category.category}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Image.network(
              category.image,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
