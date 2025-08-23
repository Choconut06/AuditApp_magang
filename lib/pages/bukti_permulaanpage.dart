import 'package:flutter/material.dart';
import 'package:audit_app_magang/pages/addbuktipermulaanpage.dart';

class BuktiPermulaanPage extends StatefulWidget {
  const BuktiPermulaanPage({super.key});

  @override
  State<BuktiPermulaanPage> createState() => _BuktiPermulaanPageState();
}

class _BuktiPermulaanPageState extends State<BuktiPermulaanPage> {
  final List<Map<String, dynamic>> _buktiPermulaanData = [
    {
      "nomor": 1,
      "tahun": "2025",
      "objekAudit": "Audit Operasional Cabang",
      "buktiPermulaan": "Indikasi penyimpangan SOP",
      "rev": "1",
      "status": "Dalam Proses",
      "#": "BP001",
    },
    {
      "nomor": 2,
      "tahun": "2025",
      "objekAudit": "Audit Keuangan Pusat",
      "buktiPermulaan": "Kelebihan pembayaran vendor",
      "rev": "2",
      "status": "Disetujui",
      "#": "BP002",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            /// Tabel Responsif
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double tableWidth = constraints.maxWidth;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: tableWidth),
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue.shade100,
                        ),
                        headingTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        columns: const [
                          DataColumn(label: Text("Nomor")),
                          DataColumn(label: Text("Tahun")),
                          DataColumn(label: Text("Objek Audit")),
                          DataColumn(label: Text("Bukti Permulaan")),
                          DataColumn(label: Text("Rev")),
                          DataColumn(label: Text("Status")),
                          DataColumn(label: Text("#")),
                          DataColumn(label: Text("Aksi")),
                        ],
                        rows:
                            _buktiPermulaanData.map((data) {
                              return DataRow(
                                cells: [
                                  DataCell(Text(data["nomor"].toString())),
                                  DataCell(Text(data["tahun"])),
                                  DataCell(Text(data["objekAudit"])),
                                  DataCell(Text(data["buktiPermulaan"])),
                                  DataCell(Text(data["rev"])),
                                  DataCell(Text(data["status"])),
                                  DataCell(Text(data["#"])),
                                  DataCell(
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.orange,
                                          ),
                                          onPressed: () {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Edit data ${data["objekAudit"]}',
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Hapus data ${data["objekAudit"]}',
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddBuktiPermulaanPage()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Bukti"),
      ),
    );
  }

  /// Custom AppBar dengan tinggi seragam
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
