import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class KomitmenPage extends StatelessWidget {
  const KomitmenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Komitmen')),
      body: const Center(child: Text('Halaman Komitmen')),
    );
  }
}
