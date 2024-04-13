import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class Todo {
  String icon;
  String category;
  String description;
  bool done;

  Todo(this.icon, this.category, this.description, this.done);

  Todo.fromJson(Map<String, dynamic> json)
      : icon = json['icon'],
        category = json['category'],
        description = json['description'],
        done = json['done'];

  Map<String, dynamic> toJson() => {
        'icon': icon,
        'category': category,
        'description': description,
        'done': done,
      };
}

List<Todo> _todos = [];

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
      home: TodosScreen(storage: MemoryStorage(), todos: _todos),
    );
  }
}

class MemoryStorage {
  // Get path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //Get file path
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/mytodiest.txt');
  }

  //Read from file
  Future<List<Todo>> readTodoData() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      // Convert the JSON string to a list
      List<dynamic> jsonList = jsonDecode(contents);
      List<Todo> todos = jsonList.map((item) => Todo.fromJson(item)).toList();
      return todos;
    } catch (e) {
      return [];
    }
  }

  //Write to file
  Future<File> writeTodoData(List<Todo> data) async {
    final file = await _localFile;
    // Convert the List of Todo objects to a JSON string
    List<Map<String, dynamic>> jsonList =
        data.map((todo) => todo.toJson()).toList();
    String jsonString = jsonEncode(jsonList);
    return file.writeAsString(jsonString);
  }
}

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key, required this.storage, required this.todos});

  //Initialize storage
  final MemoryStorage storage;
  final List<Todo> todos;

  @override
  State<TodosScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodosScreen> {
  //Initialise variable;
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget.storage.readTodoData().then((value) {
      setState(() {
        _todos = value;
      });
    });
  }

  @override
  void dispose() {
    categoryController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _showTodoInputDialog() async {
    final Todo? newTodo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: AlertDialog(
              title: const Text('Enter a task'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                        labelText: 'Category', hintText: "Enter todo category"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        labelText: 'Description',
                        hintText: "Enter todo description"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
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
                    if (categoryController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty) {
                      Navigator.pop(
                        context,
                        Todo(
                          "today_rounded",
                          categoryController.text.toUpperCase(),
                          descriptionController.text,
                          false,
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
    if (newTodo != null) {
      //write to storage on save
      _saveTodo(newTodo);
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Todo item saved!'),
          ),
        );
      }
    }
  }

  Future<File> _saveTodo(Todo newTodo) async {
    setState(() {
      _todos.add(newTodo);
    });

    return widget.storage.writeTodoData(_todos);
  }

  void _showEditDialog(index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController categoryController = TextEditingController();
        TextEditingController bodyController = TextEditingController();

        categoryController.text = _todos[index].category;
        bodyController.text = _todos[index].description;

        return Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: AlertDialog(
                title: const Text('Edit task'),
                content: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: categoryController,
                    decoration:
                        const InputDecoration(hintText: "Enter todo category"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: bodyController,
                    decoration:
                        const InputDecoration(hintText: "Enter todo action"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
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
                      //write to storage on delete
                      widget.storage.writeTodoData(_todos);
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Edit'),
                    onPressed: () {
                      setState(
                        () {
                          _todos[index].category =
                              categoryController.text.toUpperCase();
                          _todos[index].description = bodyController.text;
                        },
                      );
                      //write to storage on edit
                      widget.storage.writeTodoData(_todos);
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Todo item updated!'),
                          ),
                        );
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )),
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
            leading: const Icon(Icons.today_rounded),
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
                  // item.done = !item.done;
                  _todos[index].done = !_todos[index].done;
                },
              );
              //write to storage on checkbox
              widget.storage.writeTodoData(_todos);
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
