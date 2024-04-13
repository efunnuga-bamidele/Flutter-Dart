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
  final myController = TextEditingController();
  // INIT
  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  // DISPOSE
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('First text field: ${myController.text}');
  }

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
              TextFormField(
                  controller: myController,
                  decoration:
                      const InputDecoration(labelText: 'Text Input One')),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Text Input Two'),
                onChanged: (value) => {
                  print('Second text field: $value'),
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
