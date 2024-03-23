import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Rows and Columns")),
        body: MyWidget(),
      ),
    ),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.redAccent,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.greenAccent,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.blueAccent,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.yellowAccent,
        ),
      ],
    );
  }
}
