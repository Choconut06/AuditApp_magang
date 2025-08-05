import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class PemeriksaanPage extends StatelessWidget {
  const PemeriksaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Pemeriksaan')),
      body: const Center(child: Text('Pemeriksaan')),
    );
  }
}
