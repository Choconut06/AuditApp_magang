import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class PemenuhanDokumenPage extends StatelessWidget {
  const PemenuhanDokumenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Pemenuhan Dokumen')),
      body: const Center(child: Text('Halaman Pemenuhan Dokumen')),
    );
  }
}
