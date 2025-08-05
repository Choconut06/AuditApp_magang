import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class PenilaianKinerjaPage extends StatelessWidget {
  const PenilaianKinerjaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Penilaian Kinerja')),
      body: const Center(child: Text('Penilaian Kinerja')),
    );
  }
}
