import 'package:audit_app_magang/pages/addpkat.dart';
import 'package:audit_app_magang/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PkatPage extends StatefulWidget {
  const PkatPage({super.key});

  @override
  State<PkatPage> createState() => _PkatPageState();
}

class _PkatPageState extends State<PkatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> _pkatData = [
    {
      "nomor": 1,
      "tahun": "2025",
      "pkat": "PKAT-001",
      "detail": "Audit Keuangan Semester 1",
      "jumlah": "20 Juta",
      "revisi": "1",
      "status": "Disetujui",
      "noRevisi": "R001",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Daftar PKAT",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.blue.shade100,
                  ),
                  columns: const [
                    DataColumn(label: Text("Nomor")),
                    DataColumn(label: Text("Tahun")),
                    DataColumn(label: Text("PKAT")),
                    DataColumn(label: Text("Detail Rencana")),
                    DataColumn(label: Text("Jumlah")),
                    DataColumn(label: Text("Revisi")),
                    DataColumn(label: Text("Status Revisi")),
                    DataColumn(label: Text("Nomor Revisi")),
                    DataColumn(label: Text("Aksi")),
                  ],
                  rows:
                      _pkatData.map((data) {
                        return DataRow(
                          cells: [
                            DataCell(Text(data["nomor"].toString())),
                            DataCell(Text(data["tahun"])),
                            DataCell(Text(data["pkat"])),
                            DataCell(Text(data["detail"])),
                            DataCell(Text(data["jumlah"])),
                            DataCell(Text(data["revisi"])),
                            DataCell(Text(data["status"])),
                            DataCell(Text(data["noRevisi"])),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.orange,
                                    ),
                                    onPressed: () {
                                      // Aksi edit
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      // Aksi delete
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPkatPage()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah PKAT"),
      ),
    );
  }

  PreferredSizeWidget appBar() {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/three-lines.svg',
                          color: Colors.white,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/profile.svg',
                        color: Colors.white,
                        height: 40,
                        width: 40,
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
