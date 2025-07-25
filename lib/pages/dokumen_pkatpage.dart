import 'package:flutter/material.dart';

class DokumenPkatPage extends StatelessWidget {
  const DokumenPkatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dokumen PKAT'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
    );
  }
}