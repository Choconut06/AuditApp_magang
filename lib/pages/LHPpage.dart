import 'package:flutter/material.dart';
import 'package:audit_app_magang/model/pelaporan_audit_model.dart';
import 'package:audit_app_magang/widget/card_pelaporan_audit.dart';

class LHPPage extends StatefulWidget {
  const LHPPage({super.key});

  @override
  State<LHPPage> createState() => _LhpPageState();
}

class _LhpPageState extends State<LHPPage> {
  late List<LhpItem> _items;

  @override
  void initState() {
    super.initState();
    _items = LhpItem.seed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            for (final it in _items)
              PelaporanCard(
                title: it.lhp, // LHP-001/2025
                status: it.status,
                subtitle: "Objek: ${it.objekAudit}",
                chips: [
                  PelaporanChip("Nomor", it.nomor.toString()),
                  PelaporanChip("Tahun", it.tahun),
                  PelaporanChip("Surat Tugas", it.suratTugas),
                  PelaporanChip("Auditor", it.auditor),
                  PelaporanChip("Rev", it.rev),
                  PelaporanChip("#", it.kode),
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
    );
  }

  void _confirmDelete(LhpItem it) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text("Hapus LHP"),
            content: Text("Hapus ${it.lhp}?"),
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
                        "LHP",
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
