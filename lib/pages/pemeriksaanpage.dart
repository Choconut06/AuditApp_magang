import 'package:audit_app_magang/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audit_app_magang/pages/addpemeriksaanpage.dart';

class PemeriksaanPage extends StatefulWidget {
  const PemeriksaanPage({super.key});

  @override
  State<PemeriksaanPage> createState() => _PemeriksaanPageState();
}

class _PemeriksaanPageState extends State<PemeriksaanPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> _rows = [
    {
      "nomor": 1,
      "objekAudit": "Unit Operasional",
      "suratPemanggilan": "SP-001/INV/2025",
      "kepada": "Kepala Unit",
      "auditor": "Tim A",
      "buktiPemeriksaan": "BAP-001",
      "rev": "0",
      "status": "Selesai",
      "#": "PMK001",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final w = constraints.maxWidth;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: w),
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                          (_) => Colors.blue.shade100,
                        ),
                        columns: const [
                          DataColumn(label: Text("Nomor")),
                          DataColumn(label: Text("Objek Audit")),
                          DataColumn(label: Text("Surat Pemanggilan")),
                          DataColumn(label: Text("Kepada")),
                          DataColumn(label: Text("Auditor")),
                          DataColumn(label: Text("Bukti Pemeriksaan")),
                          DataColumn(label: Text("Rev")),
                          DataColumn(label: Text("Status")),
                          DataColumn(label: Text("#")),
                          DataColumn(label: Text("Aksi")),
                        ],
                        rows:
                            _rows.map((data) {
                              return DataRow(
                                cells: [
                                  DataCell(Text(data["nomor"].toString())),
                                  DataCell(Text(data["objekAudit"] ?? "")),
                                  DataCell(
                                    Text(data["suratPemanggilan"] ?? ""),
                                  ),
                                  DataCell(Text(data["kepada"] ?? "")),
                                  DataCell(Text(data["auditor"] ?? "")),
                                  DataCell(
                                    Text(data["buktiPemeriksaan"] ?? ""),
                                  ),
                                  DataCell(Text(data["rev"] ?? "")),
                                  DataCell(Text(data["status"] ?? "")),
                                  DataCell(Text(data["#"] ?? "")),
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
                                                  'Edit ${data["#"]}',
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
                                            setState(() {
                                              _rows.remove(data);
                                            });
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
        onPressed: () async {
          final result = await Navigator.push<Map<String, String>?>(
            context,
            MaterialPageRoute(builder: (_) => const AddPemeriksaanPage()),
          );
          if (result != null) {
            setState(() {
              _rows.add({
                "nomor":
                    int.tryParse(result["nomor"] ?? "") ?? _rows.length + 1,
                "objekAudit": result["objekAudit"] ?? "",
                "suratPemanggilan": result["suratPemanggilan"] ?? "",
                "kepada": result["kepada"] ?? "",
                "auditor": result["auditor"] ?? "",
                "buktiPemeriksaan": result["buktiPemeriksaan"] ?? "",
                "rev": result["rev"] ?? "",
                "status": result["status"] ?? "",
                "#": result["#"] ?? "",
              });
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Pemeriksaan"),
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
