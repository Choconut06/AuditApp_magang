import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class RealisasiBiayaPage extends StatelessWidget {
  const RealisasiBiayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Realisasi Biaya')),
      body: const Center(child: Text('Realisasi Biaya')),
    );
  }
}
