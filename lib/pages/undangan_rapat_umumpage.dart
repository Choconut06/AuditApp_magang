import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class UndanganRapatUmumpage extends StatelessWidget {
  const UndanganRapatUmumpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Undangan Rapat Umum')),
      body: const Center(child: Text('Undangan Rapat Umum')),
    );
  }
}
