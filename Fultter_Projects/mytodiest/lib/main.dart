import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Todiest"),
        ),
        body: Center(
          child: UserButton(),
        ),
      )));
}

class UserButton extends StatelessWidget {
  // const UserButton(super key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Add functionality
        print('User button was tapped');
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.redAccent,
        ),
        child: const Center(
          child: Text("Click ME", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
