import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class InstruksiAuditPage extends StatelessWidget {
  const InstruksiAuditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Instruksi Audit')),
      body: const Center(child: Text('Instruksi Audit')),
    );
  }
}
