import 'package:flutter/material.dart';
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Belanja',
      debugShowCheckedModeBanner: false,
      
      initialRoute: '/',
      
      routes: {
        '/': (context) => const HomePage(),   // Halaman Utama
        '/item': (context) => const ItemPage(), // Halaman Detail
      },
    );
  }
}