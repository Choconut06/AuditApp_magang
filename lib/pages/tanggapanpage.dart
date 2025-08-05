import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class TanggapanPage extends StatelessWidget {
  const TanggapanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Tanggapan')),
      body: const Center(child: Text('Halaman Tanggapan')),
    );
  }
}
