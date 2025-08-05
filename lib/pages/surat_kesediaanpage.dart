import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class SuratKesediaanPage extends StatelessWidget {
  const SuratKesediaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Surat Kesediaan')),
      body: const Center(child: Text('Surat Kesediaan')),
    );
  }
}
