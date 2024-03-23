import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey,
        ),
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("My Todiest"),
      ),
      body: const Center(
        child: Text("This is my main app"),
      ),
    ));
  }
}
