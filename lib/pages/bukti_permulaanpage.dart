import 'package:flutter/material.dart';
import 'package:audit_app_magang/pages/addbuktipermulaanpage.dart';
import 'package:audit_app_magang/model/investigasi_model.dart';
import 'package:audit_app_magang/widget/card_investigasi.dart';

class BuktiPermulaanPage extends StatefulWidget {
  const BuktiPermulaanPage({super.key});

  @override
  State<BuktiPermulaanPage> createState() => _BuktiPermulaanPageState();
}

class _BuktiPermulaanPageState extends State<BuktiPermulaanPage> {
  late List<BuktiPermulaanItem> _items;

  @override
  void initState() {
    super.initState();
    _items = BuktiPermulaanItem.seed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            if (_items.isEmpty)
              const Padding(
                padding: EdgeInsets.all(24),
                child: Text("Belum ada Bukti Permulaan"),
              )
            else
              for (final it in _items)
                InvestigasiCard(
                  title: it.kode, // BP001
                  status: it.status,
                  subtitle: it.buktiPermulaan, // deskripsi singkat
                  chips: [
                    InvestigasiChip("Nomor", it.nomor.toString()),
                    InvestigasiChip("Tahun", it.tahun),
                    InvestigasiChip("Objek Audit", it.objekAudit),
                    InvestigasiChip("Rev", it.rev),
                  ],
                  onEdit: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Edit ${it.kode}')));
                  },
                  onDelete: () => _confirmDelete(it),
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final res = await Navigator.push<Map<String, String>?>(
            context,
            MaterialPageRoute(builder: (_) => const AddBuktiPermulaanPage()),
          );
          if (res != null) {
            setState(() {
              _items.add(BuktiPermulaanItem.fromMap(res));
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Bukti"),
      ),
    );
  }

  void _confirmDelete(BuktiPermulaanItem it) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text("Hapus Bukti Permulaan"),
            content: Text("Yakin ingin menghapus ${it.kode}?"),
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
                        "Bukti Permulaan",
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
