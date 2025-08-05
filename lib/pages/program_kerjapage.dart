import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart'; // ganti dengan path drawer kamu jika berbeda

class MenuGridPage extends StatefulWidget {
  const MenuGridPage({super.key});

  @override
  State<MenuGridPage> createState() => _MenuGridPageState();
}

class _MenuGridPageState extends State<MenuGridPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Contoh menu
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.description, 'label': 'Dokumen'},
    {'icon': Icons.attach_money, 'label': 'Biaya'},
    {'icon': Icons.list_alt, 'label': 'Program'},
    {'icon': Icons.report, 'label': 'LHP'},
    {'icon': Icons.check_box, 'label': 'Review'},
    {'icon': Icons.send, 'label': 'Tanggapan'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text('Menu Grid')),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children:
              menuItems.map((item) {
                return Column(
                  children: [
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // Aksi saat ditekan
                          debugPrint('${item['label']} ditekan');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: const CircleBorder(),
                        ),
                        child: Icon(item['icon'], size: 24),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['label'],
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
