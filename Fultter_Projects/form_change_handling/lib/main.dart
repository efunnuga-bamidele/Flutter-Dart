import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  // INIT
  @override
  // void initState() {
  //   super.initState();
  //   firstController.addListener(_printLatestValue);
  //   secondController.addListener(_printLatestValue);
  // }

  // DISPOSE
  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  // void _printLatestValue() {
  //   print('First text field: ${firstController.text}');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change handler',
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 8),
              TextFormField(
                  controller: firstController,
                  decoration: const InputDecoration(labelText: 'Full Name')),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Emai;'),
                controller: secondController,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Full Name: ${firstController.text}'),
                            const SizedBox(height: 8),
                            Text('Email: ${secondController.text}'),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
