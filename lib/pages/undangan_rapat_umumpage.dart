import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class UndanganRapatUmumPage extends StatelessWidget {
  const UndanganRapatUmumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Undangan Rapat Umum')),
      body: const Center(child: Text('Undangan Rapat Umum')),
    );
  }
}
