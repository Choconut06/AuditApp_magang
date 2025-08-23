import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class RealisasiPelatihanAuditorPage extends StatelessWidget {
  const RealisasiPelatihanAuditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Realisasi Pelatihan Auditor')),
      body: const Center(child: Text('Realisasi Pelatihan Auditor')),
    );
  }
}
