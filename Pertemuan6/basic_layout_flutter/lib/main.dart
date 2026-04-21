import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 32),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Step 7',
      home: Scaffold(
        appBar: AppBar(title: const Text('Step 7: Nested Layout')),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Gambar
              Image.network(
                'images/batu2.png',
                height: 200,
                fit: BoxFit.cover,
              ),

              // Judul & Rating
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Oeschinen Lake Campground',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                    Icon(Icons.star, color: Colors.red),
                    const Text('41'),
                  ],
                ),
              ),

              // Button Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
                  _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
                  _buildButtonColumn(Colors.blue, Icons.share, 'SHARE'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}