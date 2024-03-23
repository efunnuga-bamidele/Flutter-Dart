import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todiest',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueAccent,
      ),
      home: const MyTodoHome(),
    );
  }
}

class MyTodoHome extends StatefulWidget {
  const MyTodoHome({super.key});

  @override
  State<MyTodoHome> createState() => _MyTodoHomeState();
}

class _MyTodoHomeState extends State<MyTodoHome> {
  //Initialise todos list variable;
  var _todos = [];

  void _showTodoInputDialog() => {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            TextEditingController categoryController = TextEditingController();
            TextEditingController bodyController = TextEditingController();
            return AlertDialog(
              title: const Text('Enter a task'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: categoryController,
                    decoration:
                        const InputDecoration(hintText: "Enter todo category"),
                  ),
                  TextField(
                    controller: bodyController,
                    decoration:
                        const InputDecoration(hintText: "Enter todo action"),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    setState(
                      () {
                        _todos.add({
                          'icon': const Icon(Icons.today_rounded),
                          "category": categoryController.text,
                          "body": bodyController.text,
                          "done": false,
                        });
                      },
                    );
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        )
      };

  void _showEditDialog(index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController categoryController = TextEditingController();
        TextEditingController bodyController = TextEditingController();

        categoryController.text = _todos[index]['category'];
        bodyController.text = _todos[index]['body'];

        return AlertDialog(
          title: const Text('Edit task'),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(
              controller: categoryController,
              decoration:
                  const InputDecoration(hintText: "Enter todo category"),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(hintText: "Enter todo action"),
            ),
          ]),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                setState(
                  () {
                    _todos.removeAt(index);
                  },
                );
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Edit'),
              onPressed: () {
                setState(
                  () {
                    _todos[index]['category'] = categoryController.text;
                    _todos[index]['body'] = bodyController.text;
                  },
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todiest'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final item = _todos[index];
          return ListTile(
            leading: item['icon'],
            title: Text(
              item['category'].toString(),
              style: TextStyle(
                decoration: item['done']
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(
              item['body'].toString(),
              style: TextStyle(
                decoration: item['done']
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: Icon(
              item['done']
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank_outlined,
            ),
            onTap: () {
              setState(
                () {
                  item['done'] = !item['done'];
                },
              );
            },
            onLongPress: () {
              _showEditDialog(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTodoInputDialog,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
