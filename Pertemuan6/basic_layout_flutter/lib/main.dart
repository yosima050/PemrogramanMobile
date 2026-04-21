import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Step 5',
      home: Scaffold(
        appBar: AppBar(title: const Text('Step 5: Expanded & Image')),
        body: Row(
          children: [
            Expanded(
              child: Image.network(
                'images/batu1.png',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Image.network(
                'images/batu2.png',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Image.network(
                'images/batu3.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}