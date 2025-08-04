import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class PermintaanDokumenPage extends StatelessWidget {
  const PermintaanDokumenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Permintaan Dokumen')),
      body: const Center(child: Text('Halaman Permintaan Dokumen')),
    );
  }
}
