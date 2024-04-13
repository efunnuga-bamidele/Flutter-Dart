import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';

    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 16),
          const TextField(
              style: TextStyle(color: Colors.blue, fontSize: 20),
              decoration: InputDecoration(
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person, size: 30),
              )),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Enter your name',
                labelStyle: const TextStyle(color: Colors.blue),
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            style: const TextStyle(color: Colors.blue),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(vertical: 20),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 18,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
