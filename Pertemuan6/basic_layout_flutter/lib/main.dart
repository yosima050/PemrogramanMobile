import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Step 3',
      home: Scaffold(
        appBar: AppBar(title: const Text('Step 3: Row')),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.red,
                child: const Text('Red'),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.green,
                child: const Text('Green'),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                child: const Text('Blue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}