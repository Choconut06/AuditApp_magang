import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class SuratPemanggilanPage extends StatelessWidget {
  const SuratPemanggilanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Surat Pemanggilan')),
      body: const Center(child: Text('Surat Pemanggilan')),
    );
  }
}
