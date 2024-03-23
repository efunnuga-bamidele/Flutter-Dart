import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final items = [
    {"title": "Person One", "subtitle": "John Doe"},
    {"title": "Person Two", "subtitle": "Mary Watts"},
    {"title": "Person Three", "subtitle": "Anthony Cole"},
    {"title": "Person Four", "subtitle": "Shara Andy"},
    {"title": "Person Five", "subtitle": "Tom Matthew"},
    {"title": "Person Six", "subtitle": "Billy Jones"},
    {"title": "Person Seven", "subtitle": "Nina Smith"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ListView App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My ListView App'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              leading: const Icon(Icons.person),
              title: Text(item['title'].toString()),
              subtitle: Text(item['subtitle'].toString()),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => print(item['subtitle'].toString()),
            );
          },
        ),

        // body: ListView(
        //   children: [
        //     ListTile(
        //       leading: const Icon(Icons.person),
        //       title: const Text('Person One'),
        //       subtitle: const Text('John Doe'),
        //       trailing: const Icon(Icons.arrow_forward),
        //       onTap: () => print('List Tile One'),
        //     ),
        //     ListTile(
        //       leading: const Icon(Icons.person),
        //       title: const Text('Person Two'),
        //       subtitle: const Text('John Doe'),
        //       trailing: const Icon(Icons.arrow_forward),
        //       onTap: () => print('List Tile Two'),
        //     ),
        //     ListTile(
        //       leading: const Icon(Icons.person),
        //       title: const Text('Person Three'),
        //       subtitle: const Text('John Doe'),
        //       trailing: const Icon(Icons.arrow_forward),
        //       onTap: () => print('List Tile Three'),
        //     ),
        //     ListTile(
        //       leading: const Icon(Icons.person),
        //       title: const Text('Person Four'),
        //       subtitle: const Text('John Doe'),
        //       trailing: const Icon(Icons.arrow_forward),
        //       onTap: () => print('List Tile Four'),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
