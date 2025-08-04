import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class UndanganClosingPage extends StatelessWidget {
  const UndanganClosingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Undangan Closing')),
      body: const Center(child: Text('Halaman Undangan Closing')),
    );
  }
}
