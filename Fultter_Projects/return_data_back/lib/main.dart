import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'app', home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Initial Vatiable
  String _selection = 'None';

  // user select?
  _startSelectionScreen() async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SelectionScreen()));

    setState(() {
      _selection = result ?? 'None';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SELECTION WAS: $_selection'),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Go to Option Screen'),
              onPressed: () => _startSelectionScreen(),
            )
          ],
        ),
      ),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick an option'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('OPTION ONE'),
                onPressed: () {
                  Navigator.pop(context, 'OPTION ONE');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('OPTION TWO'),
                onPressed: () {
                  Navigator.pop(context, 'OPTION TWO');
                },
              ),
            ]),
      ),
    );
  }
}
