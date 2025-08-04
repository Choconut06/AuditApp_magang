import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class DraftLHAPage extends StatelessWidget {
  const DraftLHAPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Draft LHA')),
      body: const Center(child: Text('Halaman Draft LHA')),
    );
  }
}
