import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:audit_app_magang/widget/sidebar.dart';
import 'package:audit_app_magang/widget/navbar.dart';
import 'package:audit_app_magang/pages/homepage.dart';

class ModulPage extends StatefulWidget {
  const ModulPage({super.key});

  @override
  State<ModulPage> createState() => _ModulPageState();
}

class _ModulPageState extends State<ModulPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<ModulItem> items;

  @override
  void initState() {
    super.initState();
    items = ModulItem.defaultItems();
  }

  PreferredSizeWidget customAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120), // tinggi AppBar lebih besar
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[400],
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, // bikin konten ke bawah
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tombol menu di kiri (SVG)
                    GestureDetector(
                      onTap: () => _scaffoldKey.currentState?.openDrawer(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/three-lines.svg',
                          color: Colors.white,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    // Tombol profil di kanan (SVG)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/profile.svg',
                        color: Colors.white,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: customAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blueGrey.shade400.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                spreadRadius: 1,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.spaceEvenly,
            children:
                items.map((item) {
                  return _ModulTile(
                    item: item,
                    onTap: () {
                      // TODO: ganti aksi sesuai kebutuhan (navigate ke page lain, dll.)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Buka: ${item.name}')),
                      );
                    },
                  );
                }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: 1,
        onTap: (i) {
          if (i == 1) return;
          switch (i) {
            case 0: // Beranda
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
              break;
            case 2: // Notifikasi
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifikasi coming soon')),
              );
              break;
            case 3: // Profil
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profil coming soon')),
              );
              break;
          }
        },
      ),
    );
  }
}

class _ModulTile extends StatelessWidget {
  final ModulItem item;
  final VoidCallback onTap;

  const _ModulTile({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: item.boxColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(item.iconPath, color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class ModulItem {
  final String name;
  final String iconPath;
  final Color boxColor;

  ModulItem({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<ModulItem> defaultItems() {
    return [
      ModulItem(
        name: 'Program Kerja',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
      ModulItem(
        name: 'Persiapan Audit',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
      ModulItem(
        name: 'Pelaksanaan Audit',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
      ModulItem(
        name: 'Pelaporan Audit',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
      ModulItem(
        name: 'Tindak Lanjut Audit',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
      ModulItem(
        name: 'Penilaian Kinerja',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
      ModulItem(
        name: 'Survey Kepuasan Audit',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
      ModulItem(
        name: 'Investigasi',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
      ModulItem(
        name: 'Audit Eksternal',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
      ModulItem(
        name: 'Konsultasi',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
      ModulItem(
        name: 'Pelatihan Auditor',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
      ModulItem(
        name: 'Rapat Umum',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
      ModulItem(
        name: 'Pelaporan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}
