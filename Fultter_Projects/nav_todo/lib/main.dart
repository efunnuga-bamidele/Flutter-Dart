import "package:flutter/material.dart";

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

//Manual List --->

List<Todo> myCustomList = [
  const Todo('Paint House', 'Make sure to paint the house'),
  const Todo('Call Mom', 'Make sure to call mom'),
  const Todo('Call Dad', 'Don\'t forget to call dad'),
  const Todo('Call Sister', 'Did you call your sister?'),
  const Todo('Call Brother', 'What time do you call your brother?'),
  const Todo('Call Grandmother', 'Is it time to call your grandmother?'),
];

void main() {
  runApp(
    MaterialApp(title: 'App', home: TodosScreen(todos: myCustomList)),
  );
}

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(todo: todos[index])),
                );
              });
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Center(
        child: Text(todo.description),
      ),
    );
  }
}
