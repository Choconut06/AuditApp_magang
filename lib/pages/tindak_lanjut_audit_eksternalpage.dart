import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class TindakLanjutAuditEksternalpage extends StatelessWidget {
  const TindakLanjutAuditEksternalpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Tindak Lanjut Audit Eksternal')),
      body: const Center(child: Text('Tindak Lanjut Audit Eksternal')),
    );
  }
}
