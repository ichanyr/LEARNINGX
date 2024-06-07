import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/latihan_controller.dart';

class LatihanView extends GetView<LatihanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LatihanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LatihanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
