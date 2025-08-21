import 'package:flutter/material.dart';
import 'package:audit_app_magang/pages/addregisterpage.dart';

class RegisterAuditEksternalpage extends StatefulWidget {
  const RegisterAuditEksternalpage({super.key});

  @override
  State<RegisterAuditEksternalpage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterAuditEksternalpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> _rows = [
    {
      "nomor": 1,
      "lhp": "LHP-01/2025",
      "instansi": "BPK",
      "periode": "Jan–Jun 2025",
      "jumlahTemuan": "5",
      "rev": "0",
      "status": "Selesai",
      "#": "REG001",
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
                          DataColumn(label: Text("LHP")),
                          DataColumn(label: Text("Instansi Pemeriksa")),
                          DataColumn(label: Text("Periode Pemeriksaan")),
                          DataColumn(label: Text("Jumlah Temuan")),
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
                                  DataCell(Text(data["lhp"] ?? "")),
                                  DataCell(Text(data["instansi"] ?? "")),
                                  DataCell(Text(data["periode"] ?? "")),
                                  DataCell(Text(data["jumlahTemuan"] ?? "")),
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
            MaterialPageRoute(builder: (_) => const AddRegisterPage()),
          );
          if (result != null) {
            setState(() {
              _rows.add({
                "nomor":
                    int.tryParse(result["nomor"] ?? "") ?? _rows.length + 1,
                "lhp": result["lhp"] ?? "",
                "instansi": result["instansi"] ?? "",
                "periode": result["periode"] ?? "",
                "jumlahTemuan": result["jumlahTemuan"] ?? "",
                "rev": result["rev"] ?? "",
                "status": result["status"] ?? "",
                "#": result["#"] ?? "",
              });
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Register"),
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
                        "Register",
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
