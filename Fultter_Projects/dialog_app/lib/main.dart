import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.pinkAccent,
        ),
        home: const MyDialogApp());
  }
}

class MyDialogApp extends StatefulWidget {
  const MyDialogApp({super.key});

  @override
  State<MyDialogApp> createState() => _MyDialogAppState();
}

class _MyDialogAppState extends State<MyDialogApp> {
  // initiliz variable
  String _inputText = "";

  //Alert Dialog

  void _showInputDialog() => {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // manage text input uinsg Controller
            TextEditingController controller = TextEditingController();
            return AlertDialog(
              title: const Text('Enter some text'),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Enter some text'),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    //return back to mome screen
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    setState(
                      () {
                        _inputText = controller.text;
                      },
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ),
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Dialog App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(_inputText.isEmpty
            ? 'Tap icon to enter text'
            : 'You enter "$_inputText".'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showInputDialog,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
