import 'package:audit_app_magang/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audit_app_magang/pages/homepage.dart';

class AktivitasPage extends StatefulWidget {
  const AktivitasPage({super.key});

  @override
  State<AktivitasPage> createState() => _AktivitasPageState();
}

class _AktivitasPageState extends State<AktivitasPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // ====== Dummy data (hanya 5 contoh) ======
  final List<ActivityItem> _all = [
    ActivityItem(
      index: 1,
      modul: 'Auth/Login',
      deskripsi: 'Login berhasil',
      waktu: DateTime.now().subtract(const Duration(minutes: 5)),
      by: 'Rizqi Liliati',
    ),
    ActivityItem(
      index: 2,
      modul: 'Auth/Login',
      deskripsi: 'Login berhasil',
      waktu: DateTime.now().subtract(const Duration(minutes: 30)),
      by: 'Rizqi Liliati',
    ),
    ActivityItem(
      index: 3,
      modul: 'Auth/Login',
      deskripsi: 'Login berhasil',
      waktu: DateTime.now().subtract(const Duration(hours: 2)),
      by: 'Rizqi Liliati',
    ),
    ActivityItem(
      index: 4,
      modul: 'Auth/Login',
      deskripsi: 'Login berhasil',
      waktu: DateTime.now().subtract(const Duration(hours: 5)),
      by: 'Rizqi Liliati',
    ),
    ActivityItem(
      index: 5,
      modul: 'Auth/Logout',
      deskripsi: 'Logout berhasil',
      waktu: DateTime.now().subtract(const Duration(hours: 6)),
      by: 'Rizqi Liliati',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(),
      drawer: const CustomDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _profileCard(),
          const SizedBox(height: 12),
          _aktivitasContainer(),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[400],
        flexibleSpace: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Tombol Back di kiri
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),

                    // Judul di tengah
                    const Center(
                      child: Text(
                        "Profil",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
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

  // ====== Profil Card ======
  Widget _profileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDeco(),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.blue[400],
            child: SvgPicture.asset(
              "assets/icons/profile.svg",
              color: Colors.white,
              height: 36,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Rizqi Liliati",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.12),
                        border: Border.all(
                          color: Colors.green.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Aktif',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Kepala Divisi Internal Audit',
                      style: TextStyle(
                        color: Colors.blueGrey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ====== Container daftar aktivitas ======
  Widget _aktivitasContainer() {
    return Container(
      decoration: _cardDeco(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Aktivitas',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.blueGrey.shade900,
              ),
            ),
          ),
          const Divider(height: 1),
          // Daftar aktivitas
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: _all.length,
            separatorBuilder: (_, __) => const SizedBox(height: 6),
            itemBuilder: (context, i) {
              final a = _all[i];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blueGrey.shade100),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue[50],
                    child: Text(
                      a.index.toString(),
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  title: Text(
                    a.modul,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(a.deskripsi),
                      const SizedBox(height: 4),
                      Text(
                        _fmt(a.waktu),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueGrey.shade600,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    tooltip: 'Info',
                    icon: const Icon(Icons.info_outline),
                    onPressed: () {
                      _showDetail(a);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // ====== Helpers ======
  String _fmt(DateTime dt) {
    final d = dt.day.toString().padLeft(2, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final y = dt.year.toString();
    final hh = dt.hour.toString().padLeft(2, '0');
    final mm = dt.minute.toString().padLeft(2, '0');
    return '$d/$m/$y $hh:$mm';
  }

  BoxDecoration _cardDeco() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.blueGrey.shade100),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  void _showDetail(ActivityItem a) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _row('No', a.index.toString()),
              _row('Modul', a.modul),
              _row('Deskripsi', a.deskripsi),
              _row('Waktu', _fmt(a.waktu)),
              _row('Oleh', a.by),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  Widget _row(String k, String v) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              k,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.blueGrey.shade800,
              ),
            ),
          ),
          Expanded(
            child: Text(v, style: TextStyle(color: Colors.blueGrey.shade800)),
          ),
        ],
      ),
    );
  }
}

// ====== Model sederhana ======
class ActivityItem {
  final int index;
  final String modul;
  final String deskripsi;
  final DateTime waktu;
  final String by;

  ActivityItem({
    required this.index,
    required this.modul,
    required this.deskripsi,
    required this.waktu,
    required this.by,
  });
}
