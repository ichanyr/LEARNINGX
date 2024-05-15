import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Collection',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.LOGIN);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index, Harga: $index'),
            subtitle: Text('Description of item $index'),
            leading: CircleAvatar(
              child: Text('$index'),
            ),
            onTap: () {
              Get.snackbar('Item $index', 'Description of item $index');
            },
          );
        },
      ),
    );
  }
}
