import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('This is a SnackBar message!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Handle undo action
                      },
                    ),
                  ),
                );
              },
              child: Text('Show SnackBar'),
            ),
          ],
        ),
      ),
    );
  }
}
