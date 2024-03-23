import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Initialize variable
  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateful App')),
      body: GestureDetector(
        onTap: () => setState(() => _isButtonPressed = !_isButtonPressed),
        child: Container(
          color: getColor(),
        ),
      ),
    );
  }

  getColor() => _isButtonPressed ? Colors.red : Colors.blue;
}
