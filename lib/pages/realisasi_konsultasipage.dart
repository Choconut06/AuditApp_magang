import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class RealisasiKonsultasipage extends StatelessWidget {
  const RealisasiKonsultasipage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Realisasi Konsultasi')),
      body: const Center(child: Text('Realisasi Konsultasi')),
    );
  }
}
