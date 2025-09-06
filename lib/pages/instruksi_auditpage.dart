import 'package:audit_app_magang/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:audit_app_magang/pages/addinstruksiauditpage.dart';
import 'package:audit_app_magang/model/investigasi_model.dart';
import 'package:audit_app_magang/widget/card_investigasi.dart';

class InstruksiAuditPage extends StatefulWidget {
  const InstruksiAuditPage({super.key});

  @override
  State<InstruksiAuditPage> createState() => _InstruksiAuditPageState();
}

class _InstruksiAuditPageState extends State<InstruksiAuditPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<InstruksiAuditItem> _items;

  @override
  void initState() {
    super.initState();
    _items = InstruksiAuditItem.seed();
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
                  "Instruksi Audit",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 8),
            for (final it in _items)
              InvestigasiCard(
                title: it.kode, // INS-001
                status: it.status,
                subtitle: it.instruksiAudit,
                chips: [
                  InvestigasiChip("Nomor", it.nomor.toString()),
                  InvestigasiChip("Tahun", it.tahun),
                  InvestigasiChip("BP", it.buktiPermulaan),
                  InvestigasiChip("Auditor", it.auditor),
                  InvestigasiChip("Versi", it.versi),
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
          final result = await Navigator.push<Map<String, String>?>(
            context,
            MaterialPageRoute(builder: (_) => const AddInstruksiAuditPage()),
          );
          if (result != null) {
            setState(() => _items.add(InstruksiAuditItem.fromMap(result)));
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Instruksi"),
      ),
    );
  }

  void _confirmDelete(InstruksiAuditItem it) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text("Hapus Instruksi"),
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
                        "Instruksi Audit",
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
