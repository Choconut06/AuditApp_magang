import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class PengisianPage extends StatelessWidget {
  const PengisianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Pengisian')),
      body: const Center(child: Text('Pengisian')),
    );
  }
}
