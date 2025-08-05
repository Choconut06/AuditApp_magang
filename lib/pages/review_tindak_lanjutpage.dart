import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class ReviewTindakLanjutPage extends StatelessWidget {
  const ReviewTindakLanjutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Review Tindak Lanjut')),
      body: const Center(child: Text('Review Tindak Lanjut')),
    );
  }
}
