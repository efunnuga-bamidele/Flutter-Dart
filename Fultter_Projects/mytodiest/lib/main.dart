import 'package:flutter/material.dart';

class Todo {
  Icon icon;
  String category;
  String description;
  bool done;

  Todo(this.icon, this.category, this.description, this.done);
}

List<Todo> _todos = [
  Todo(const Icon(Icons.today_rounded), 'Learning',
      'Learn Dart programming language', false),
  Todo(const Icon(Icons.today_rounded), 'Learning',
      'Learn to build application using Flutter', false),
  Todo(const Icon(Icons.today_rounded), 'Practice',
      'Practice building robust app with Flutter', false),
];

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
      home: TodosScreen(todos: _todos),
    );
  }
}

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key, required this.todos});

  final List<Todo> todos;

  @override
  State<TodosScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodosScreen> {
  //Initialise todos list variable;

  void _showTodoInputDialog() async {
    final Todo? newTodo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        String? category;
        String? description;
        // TextEditingController categoryController =
        //     TextEditingController();
        // TextEditingController bodyController = TextEditingController();
        return AlertDialog(
          title: const Text('Enter a task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                // controller: categoryController,
                onChanged: (value) => category = value,
                decoration: const InputDecoration(
                    labelText: 'Category', hintText: "Enter todo category"),
              ),
              TextField(
                // controller: bodyController,
                onChanged: (value) => description = value,
                decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: "Enter todo description"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                if (category != null && description != null) {
                  Navigator.pop(
                      context,
                      Todo(
                        const Icon(Icons.today_rounded),
                        category!,
                        description!,
                        false,
                      ));
                }
              },
            )
          ],
        );
      },
    );
    if (newTodo != null) {
      setState(
        () {
          _todos.add(newTodo);
        },
      );
    }
  }

  void _showEditDialog(index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController categoryController = TextEditingController();
        TextEditingController bodyController = TextEditingController();

        categoryController.text = _todos[index].category;
        bodyController.text = _todos[index].description;

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
                    _todos[index].category = categoryController.text;
                    _todos[index].description = bodyController.text;
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
            leading: item.icon,
            title: Text(
              item.category.toString(),
              style: TextStyle(
                decoration: item.done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(
              item.description.toString(),
              style: TextStyle(
                decoration: item.done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: Icon(
              item.done
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank_outlined,
            ),
            onTap: () {
              setState(
                () {
                  item.done = !item.done;
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
