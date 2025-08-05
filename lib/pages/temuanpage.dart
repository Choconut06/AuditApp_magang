import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class TemuanPage extends StatelessWidget {
  const TemuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Temuan')),
      body: const Center(child: Text('Halaman Temuan')),
    );
  }
}
