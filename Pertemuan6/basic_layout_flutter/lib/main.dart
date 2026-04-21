import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Step 4',
      home: Scaffold(
        appBar: AppBar(title: const Text('Step 4: Column')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.orange,
                child: const Text('Top'),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.purple,
                child: const Text('Middle'),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.teal,
                child: const Text('Bottom'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}