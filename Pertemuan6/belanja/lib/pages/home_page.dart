import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(nama: 'Sugar', harga: 5000, foto: 'images/sugar.png', stok: 10, rating: 4.5),
      Item(nama: 'Salt', harga: 2000, foto: 'images/salt.png', stok: 15, rating: 4.2),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Belanja'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
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
                    child: Column(
                      children: [
                        Expanded(
                          child: Hero(
                            tag: 'foto-${items[index].nama}',
                            child: Image.asset(
                              items[index].foto,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Text(items[index].nama),
                        Text('Stok: ${items[index].stok}'),
                        Text('Rating: ${items[index].rating}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue,
            child: Column(
              children: const [
                Text('Nama: Yosep Bima Aprillian'),
                Text('NIM: 244107060027'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}