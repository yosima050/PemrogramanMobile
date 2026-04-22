import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item.dart';

// GoRouter configuration
final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePageGoRouter(),
      name: 'home',
    ),
    GoRoute(
      path: '/item',
      builder: (context, state) {
        final item = state.extra as Item;
        return ItemPageGoRouter(item: item);
      },
      name: 'item',
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Error')),
    body: Center(
      child: Text('Halaman tidak ditemukan: ${state.uri}'),
    ),
  ),
);

// HomePageGoRouter wrapper untuk go_router
class HomePageGoRouter extends StatelessWidget {
  const HomePageGoRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(nama: 'Sugar', harga: 5000, foto: 'images/sugar.png', stok: 10, rating: 4.5),
      Item(nama: 'Salt', harga: 2000, foto: 'images/salt.png', stok: 15, rating: 4.2),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Belanja'),
        // Indikator mode go_router
        elevation: 8,
        backgroundColor: Colors.deepOrange, // Warna berbeda dari Navigator
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
                    context.pushNamed(
                      'item',
                      extra: items[index],
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

// ItemPage wrapper untuk go_router
class ItemPageGoRouter extends StatelessWidget {
  final Item item;

  const ItemPageGoRouter({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.nama),
        // Indikator mode go_router
        backgroundColor: Colors.deepOrange, // Warna berbeda dari Navigator
        elevation: 8,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: 'foto-${item.nama}',
                    child: Image.asset(
                      item.foto,
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
                          'Harga: Rp ${item.harga}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Stok: ${item.stok}'),
                        const SizedBox(height: 8),
                        Text('Rating: ${item.rating} ⭐'),
                      ],
                    ),
                  ),
                ],
              ),
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