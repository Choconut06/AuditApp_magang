import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class Perencanaanpage extends StatelessWidget {
  const Perencanaanpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Perencanaan')),
      body: const Center(child: Text('Perencanaan')),
    );
  }
}
