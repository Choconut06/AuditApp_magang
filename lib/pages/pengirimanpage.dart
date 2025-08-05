import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class PengirimanPage extends StatelessWidget {
  const PengirimanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Pengiriman')),
      body: const Center(child: Text('Pengiriman')),
    );
  }
}
