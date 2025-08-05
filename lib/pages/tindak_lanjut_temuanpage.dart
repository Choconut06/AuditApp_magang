import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class TindakLanjutTemuanPage extends StatelessWidget {
  const TindakLanjutTemuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Tindak Lanjut Temuan')),
      body: const Center(child: Text('Tindak Lanjut Temuan')),
    );
  }
}
