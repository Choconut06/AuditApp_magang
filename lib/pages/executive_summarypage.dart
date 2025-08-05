import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class ExecutiverSummaryPage extends StatelessWidget {
  const ExecutiverSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Executive Summary')),
      body: const Center(child: Text('Executive Summary')),
    );
  }
}
