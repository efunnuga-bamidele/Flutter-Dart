import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MyWidget()));

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.red,
        ),
      );
}
