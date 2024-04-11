import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer App'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              height: 60,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Text(
                  "Drawer App",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: const Text("Item 1"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemPageOne(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Item 2"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemPageTwo(),
                    ));
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('My Home Page'),
      ),
    );
  }
}

class ItemPageOne extends StatelessWidget {
  const ItemPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item One'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Item One Page',
            )),
      ),
    );
  }
}

class ItemPageTwo extends StatelessWidget {
  const ItemPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Two'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Item Two Page',
          ),
        ),
      ),
    );
  }
}
