import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Todiest"),
        ),
        body: const Center(
          child: Text("This is my main app"),
        ),
      ),
    ),
  );
}
