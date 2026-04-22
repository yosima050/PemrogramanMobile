import 'package:flutter/material.dart';
import '../models/item.dart';
class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Item itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(itemArgs.nama),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: 'foto-${itemArgs.nama}',
                    child: Image.asset(
                      itemArgs.foto,
                      fit: BoxFit.contain,
                      height: 300,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harga: Rp ${itemArgs.harga}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Stok: ${itemArgs.stok}'),
                        const SizedBox(height: 8),
                        Text('Rating: ${itemArgs.rating} ⭐'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ┌─── FOOTER: Pengerja ─────────────────
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey,
            child: Column(
              children: const [
                Text('Pengerja:'),
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