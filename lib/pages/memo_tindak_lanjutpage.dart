import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class MemoTindakLanjutPage extends StatelessWidget {
  const MemoTindakLanjutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Memo Tindak Lanjut')),
      body: const Center(child: Text('Memo Tindak Lanjut')),
    );
  }
}
