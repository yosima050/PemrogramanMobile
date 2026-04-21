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

  Widget _buildActivityCard(String title, IconData icon) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blue),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Step 8',
      home: Scaffold(
        appBar: AppBar(title: const Text('Step 8: Card & Grid')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Gambar
              Image.network(
                'images/batu2.png',
                height: 200,
                fit: BoxFit.cover,
              ),

              // Judul
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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

              // Grid Section
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Popular Activities',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildActivityCard('Hiking', Icons.hiking),
                  _buildActivityCard('Swimming', Icons.pool),
                  _buildActivityCard('Camping', Icons.landscape),
                  _buildActivityCard('Photography', Icons.camera_alt),
                ],
              ),

              // List Section
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Nearby Places',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  final places = ['Mountain View', 'Forest Trail', 'Lake Shore'];
                  return ListTile(
                    leading: Icon(Icons.location_on, color: Colors.blue),
                    title: Text(places[index]),
                    subtitle: const Text('Popular destination'),
                    trailing: const Icon(Icons.arrow_forward),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}