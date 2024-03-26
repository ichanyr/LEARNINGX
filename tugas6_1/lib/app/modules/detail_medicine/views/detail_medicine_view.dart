import 'package:flutter/material.dart';
import 'package:tugas6_1/app/data/medicine.dart';
import 'package:get/get.dart';
import '../controllers/detail_medicine_controller.dart';
import 'package:tugas6_1/app/data/notification.dart' as notif;

class DetailMedicineView extends GetView<DetailMedicineController> {
  const DetailMedicineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Medicine Schedule'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            FutureBuilder<Medicine>(
              future: controller.getMedicineData(Get.arguments),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListTile(
                    title: Text(
                      snapshot.data!.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                        "${snapshot.data!.frequency.toString()} kali sehari"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            FutureBuilder<List<notif.Notification>>(
              future: controller.getNotificationData(Get.arguments),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].time),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                onPressed: () {
                  controller.deleteMedicine(Get.arguments);
                },
                child:
                    const Text('I don\'t need to take this medicine anymore'),
              ),
            )
          ],
        ));
  }
}
