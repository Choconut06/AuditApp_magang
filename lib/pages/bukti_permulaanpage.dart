import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class BuktiPermulaanpage extends StatelessWidget {
  const BuktiPermulaanpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Bukti Permulaan')),
      body: const Center(child: Text('Bukti Permulaan')),
    );
  }
}
