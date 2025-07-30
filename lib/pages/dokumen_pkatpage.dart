import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'adddokumenpkat.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class DokumenPkatPage extends StatefulWidget {
  const DokumenPkatPage({super.key});

  @override
  State<DokumenPkatPage> createState() => _DokumenPkatPageState();
}

class _DokumenPkatPageState extends State<DokumenPkatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, String>> dokumenData = [
    {
      "nomor": "1",
      "tahun": "2024",
      "noPkat": "PKAT-001",
      "tglPkat": "01/07/2024",
      "revisi": "1",
      "status": "Disetujui",
      "noRevisi": "DP001",
    },
    {
      "nomor": "2",
      "tahun": "2025",
      "noPkat": "PKAT-002",
      "tglPkat": "15/03/2025",
      "revisi": "2",
      "status": "Revisi",
      "noRevisi": "DP002",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 800),
                child: DataTable(
                  columnSpacing: 12,
                  headingRowColor: MaterialStateProperty.all(
                    Colors.blue.shade100,
                  ),
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columns: const [
                    DataColumn(label: Text('Nomor')),
                    DataColumn(label: Text('Tahun')),
                    DataColumn(label: Text('Nomor PKAT')),
                    DataColumn(label: Text('Tanggal PKAT')),
                    DataColumn(label: Text('Revisi')),
                    DataColumn(label: Text('Status Revisi')),
                    DataColumn(label: Text('Nomor Revisi')),
                    DataColumn(label: Text('Aksi')),
                  ],
                  rows:
                      dokumenData.map((row) {
                        return DataRow(
                          cells: [
                            DataCell(Text(row['nomor']!)),
                            DataCell(Text(row['tahun']!)),
                            DataCell(Text(row['noPkat']!)),
                            DataCell(Text(row['tglPkat']!)),
                            DataCell(Text(row['revisi']!)),
                            DataCell(Text(row['status']!)),
                            DataCell(Text(row['noRevisi']!)),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.orange,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {},
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddDokumenPkatPage()),
          );

          if (result != null) {
            setState(() {
              dokumenData.add(result);
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Dokumen"),
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
                      onTap: () => _scaffoldKey.currentState?.openDrawer(),
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
