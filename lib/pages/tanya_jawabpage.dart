import 'package:flutter/material.dart';
import 'package:audit_app_magang/pages/addtanyajawabpage.dart';

class TanyaJawabpage extends StatefulWidget {
  const TanyaJawabpage({super.key});

  @override
  State<TanyaJawabpage> createState() => _TanyaJawabpageState();
}

class _TanyaJawabpageState extends State<TanyaJawabpage> {
  final List<Map<String, dynamic>> _rows = [
    {
      "nomor": 1,
      "perusahaan": "PT Maju Jaya",
      "tanyajawab": "Proses PO & GR mismatch",
      "tempat": "Ruang Rapat 2",
      "auditor": "Tim B",
      "auditee": "Procurement",
      "rev": "0",
      "status": "Proses",
      "#": "TJ001",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context, "Tanya Jawab"),
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
                          DataColumn(label: Text("Perusahaan")),
                          DataColumn(label: Text("Tanya Jawab")),
                          DataColumn(label: Text("Tempat")),
                          DataColumn(label: Text("Auditor")),
                          DataColumn(label: Text("Auditee")),
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
                                  DataCell(Text(data["perusahaan"] ?? "")),
                                  DataCell(Text(data["tanyajawab"] ?? "")),
                                  DataCell(Text(data["tempat"] ?? "")),
                                  DataCell(Text(data["auditor"] ?? "")),
                                  DataCell(Text(data["auditee"] ?? "")),
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
                                          onPressed:
                                              () => setState(
                                                () => _rows.remove(data),
                                              ),
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
        label: const Text("Tambah Tanya Jawab"),
        onPressed: () async {
          final result = await Navigator.push<Map<String, String>?>(
            context,
            MaterialPageRoute(builder: (_) => const AddTanyaJawabPage()),
          );
          if (result != null) {
            setState(() {
              _rows.add({
                "nomor":
                    int.tryParse(result["nomor"] ?? "") ?? _rows.length + 1,
                "perusahaan": result["perusahaan"] ?? "",
                "tanyajawab": result["tanyajawab"] ?? "",
                "tempat": result["tempat"] ?? "",
                "auditor": result["auditor"] ?? "",
                "auditee": result["auditee"] ?? "",
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
