import 'package:audit_app_magang/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audit_app_magang/pages/addsuratpemanggilanpage.dart';
import 'package:audit_app_magang/model/investigasi_model.dart';
import 'package:audit_app_magang/widget/card_investigasi.dart';

class SuratPemanggilanPage extends StatefulWidget {
  const SuratPemanggilanPage({super.key});

  @override
  State<SuratPemanggilanPage> createState() => _SuratPemanggilanPageState();
}

class _SuratPemanggilanPageState extends State<SuratPemanggilanPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<SuratPemanggilanItem> _items;

  @override
  void initState() {
    super.initState();
    _items = SuratPemanggilanItem.seed();
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Surat Pemanggilan",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 8),
            for (final it in _items)
              InvestigasiCard(
                title: it.suratPemanggilan,
                status: it.status,
                subtitle: "Auditor: ${it.auditor}",
                chips: [
                  InvestigasiChip("Nomor", it.nomor.toString()),
                  InvestigasiChip("Tahun", it.tahun),
                  InvestigasiChip("BP", it.buktiPermulaan),
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
            MaterialPageRoute(builder: (_) => const AddSuratPemanggilanPage()),
          );
          if (res != null) {
            setState(() => _items.add(SuratPemanggilanItem.fromMap(res)));
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Surat"),
      ),
    );
  }

  void _confirmDelete(SuratPemanggilanItem it) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text("Hapus Surat Pemanggilan"),
            content: Text("Hapus ${it.suratPemanggilan}?"),
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
                        "Surat Pemanggilan",
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
