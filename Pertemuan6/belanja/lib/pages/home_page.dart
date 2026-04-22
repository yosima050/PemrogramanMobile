import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(nama: 'Sugar', harga: 5000),
      Item(nama: 'Salt', harga: 2000),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Belanja'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/item',
                arguments: items[index],
              );
            },
            child: Card(
              child: ListTile(
                title: Text(items[index].nama),
                subtitle: Text('Rp ${items[index].harga}'),
              ),
            ),
          );
        },
      ),
    );
  }
}