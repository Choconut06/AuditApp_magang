import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class BAPenyelesaianPage extends StatelessWidget {
  const BAPenyelesaianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('BA Penyelesaian')),
      body: const Center(child: Text('BA Penyelesaian')),
    );
  }
}
