import 'package:flutter/material.dart';
import 'package:audit_app_magang/pages/addtindaklanjutauditpage.dart';

class TindakLanjutAuditEksternalpage extends StatefulWidget {
  const TindakLanjutAuditEksternalpage({super.key});

  @override
  State<TindakLanjutAuditEksternalpage> createState() =>
      _TindakLanjutPageState();
}

class _TindakLanjutPageState extends State<TindakLanjutAuditEksternalpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> _rows = [
    {
      "nomor": 1,
      "idTemuan": "TMN-001",
      "ringkasan": "Kelebihan bayar vendor",
      "tanggapan": "Perbaikan SOP & tagih balik",
      "prosentase": "60",
      "batasWaktu": "31-03-2025",
      "penyelesaian": "Proses penagihan",
      "rev": "1",
      "status": "Proses",
      "#": "TL001",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(),
      drawer: const Drawer(), // opsional; samakan dengan halamanmu jika perlu
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
                          DataColumn(label: Text("ID Temuan")),
                          DataColumn(label: Text("Ringkasan Temuan")),
                          DataColumn(
                            label: Text("Tanggapan/Komitmen Perbaikan"),
                          ),
                          DataColumn(label: Text("Prosentase (%)")),
                          DataColumn(label: Text("Batas Waktu")),
                          DataColumn(label: Text("Penyelesaian")),
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
                                  DataCell(Text(data["idTemuan"] ?? "")),
                                  DataCell(Text(data["ringkasan"] ?? "")),
                                  DataCell(Text(data["tanggapan"] ?? "")),
                                  DataCell(
                                    Text("${data["prosentase"] ?? ""}%"),
                                  ),
                                  DataCell(Text(data["batasWaktu"] ?? "")),
                                  DataCell(Text(data["penyelesaian"] ?? "")),
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
            MaterialPageRoute(builder: (_) => const AddTindakLanjutPage()),
          );
          if (result != null) {
            setState(() {
              _rows.add({
                "nomor":
                    int.tryParse(result["nomor"] ?? "") ?? _rows.length + 1,
                "idTemuan": result["idTemuan"] ?? "",
                "ringkasan": result["ringkasan"] ?? "",
                "tanggapan": result["tanggapan"] ?? "",
                "prosentase": result["prosentase"] ?? "",
                "batasWaktu": result["batasWaktu"] ?? "",
                "penyelesaian": result["penyelesaian"] ?? "",
                "rev": result["rev"] ?? "",
                "status": result["status"] ?? "",
                "#": result["#"] ?? "",
              });
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Tindak Lanjut"),
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
                        "Tindak Lanjut",
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
