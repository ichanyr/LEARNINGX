import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String text = 'lowercase';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => Text(text)),
            ElevatedButton(
              onPressed: () {
                if (text == 'lowercase') {
                  text = 'UPPERCASE';
                } else {
                  text = 'lowercase';
                }
              },
              child: Text('Change Case'),
            ),
          ],
        ),
      ),
    );
  }
}
