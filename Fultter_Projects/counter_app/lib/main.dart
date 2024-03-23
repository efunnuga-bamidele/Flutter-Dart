import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Counter(),
          ),
        ),
      ),
    );

class Counter extends StatefulWidget {
  const Counter({super.key});
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _incrementCounter() => setState(() => _counter++);

  void _decrementCounter() =>
      setState(() => _counter > 0 ? _counter-- : _counter);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('You pressed $_counter times'),
        TextButton(
          onPressed: _incrementCounter,
          child: const Text('Increase Count'),
        ),
        TextButton(
          onPressed: _decrementCounter,
          child: const Text('Decrement Count'),
        )
      ],
    );
  }
}
