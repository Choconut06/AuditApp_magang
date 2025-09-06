import 'package:audit_app_magang/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:audit_app_magang/pages/addpemeriksaanpage.dart';
import 'package:audit_app_magang/model/investigasi_model.dart';
import 'package:audit_app_magang/widget/card_investigasi.dart';

class PemeriksaanPage extends StatefulWidget {
  const PemeriksaanPage({super.key});

  @override
  State<PemeriksaanPage> createState() => _PemeriksaanPageState();
}

class _PemeriksaanPageState extends State<PemeriksaanPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<PemeriksaanItem> _items;

  @override
  void initState() {
    super.initState();
    _items = PemeriksaanItem.seed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            for (final it in _items)
              InvestigasiCard(
                title: it.buktiPemeriksaan, // BAP-001
                status: it.status,
                subtitle: "Objek: ${it.objekAudit}",
                chips: [
                  InvestigasiChip("Nomor", it.nomor.toString()),
                  InvestigasiChip("SP", it.suratPemanggilan),
                  InvestigasiChip("Kepada", it.kepada),
                  InvestigasiChip("Auditor", it.auditor),
                  InvestigasiChip("Rev", it.rev),
                  InvestigasiChip("#", it.kode),
                ],
                onEdit:
                    () => ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Edit ${it.kode}'))),
                onDelete: () => _confirmDelete(it),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final res = await Navigator.push<Map<String, String>?>(
            context,
            MaterialPageRoute(builder: (_) => const AddPemeriksaanPage()),
          );
          if (res != null) {
            setState(() => _items.add(PemeriksaanItem.fromMap(res)));
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Pemeriksaan"),
      ),
    );
  }

  void _confirmDelete(PemeriksaanItem it) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text("Hapus Pemeriksaan"),
            content: Text("Hapus ${it.kode}?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text("Batal"),
              ),
              TextButton(
                onPressed: () {
                  setState(() => _items.remove(it));
                  Navigator.pop(ctx);
                },
                child: const Text("Hapus", style: TextStyle(color: Colors.red)),
              ),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
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
                    const Center(
                      child: Text(
                        "Pemeriksaan",
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
}
