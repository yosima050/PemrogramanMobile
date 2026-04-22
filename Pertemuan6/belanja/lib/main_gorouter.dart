import 'package:flutter/material.dart';
import 'routes/router.dart';

void main() {
  runApp(const MyAppGoRouter());
}

class MyAppGoRouter extends StatelessWidget {
  const MyAppGoRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aplikasi Belanja',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
  }
}