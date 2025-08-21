import 'package:flutter/material.dart';
import 'package:audit_app_magang/pages/addformkonsultasipage.dart';

class FormKonsultasipage extends StatefulWidget {
  const FormKonsultasipage({super.key});

  @override
  State<FormKonsultasipage> createState() => _FormKonsultasipageState();
}

class _FormKonsultasipageState extends State<FormKonsultasipage> {
  final List<Map<String, dynamic>> _rows = [
    {
      "nomor": 1,
      "objek": "Unit Produksi",
      "idKonsultasi": "KNS-001",
      "tanggal": "10-01-2025",
      "jenis": "Teknis",
      "rev": "0",
      "status": "Proses",
      "#": "FK001",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context, "Form Konsultasi"),
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
                          DataColumn(label: Text("ID Konsultasi")),
                          DataColumn(label: Text("Tanggal Konsultasi")),
                          DataColumn(label: Text("Jenis Konsultasi")),
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
                                  DataCell(Text(data["objek"] ?? "")),
                                  DataCell(Text(data["idKonsultasi"] ?? "")),
                                  DataCell(Text(data["tanggal"] ?? "")),
                                  DataCell(Text(data["jenis"] ?? "")),
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
                                            setState(() => _rows.remove(data));
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
        icon: const Icon(Icons.add),
        label: const Text("Tambah Form"),
        onPressed: () async {
          final result = await Navigator.push<Map<String, String>?>(
            context,
            MaterialPageRoute(builder: (_) => const AddFormKonsultasiPage()),
          );
          if (result != null) {
            setState(() {
              _rows.add({
                "nomor":
                    int.tryParse(result["nomor"] ?? "") ?? _rows.length + 1,
                "objek": result["objek"] ?? "",
                "idKonsultasi": result["idKonsultasi"] ?? "",
                "tanggal": result["tanggal"] ?? "",
                "jenis": result["jenis"] ?? "",
                "rev": result["rev"] ?? "",
                "status": result["status"] ?? "",
                "#": result["#"] ?? "",
              });
            });
          }
        },
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context, String title) {
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
                    Center(
                      child: Text(
                        title,
                        style: const TextStyle(
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
