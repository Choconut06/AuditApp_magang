import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class RisalahRapatUmumPage extends StatelessWidget {
  const RisalahRapatUmumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Risalah Rapat Umum')),
      body: const Center(child: Text('Risalah Rapat Umum')),
    );
  }
}
