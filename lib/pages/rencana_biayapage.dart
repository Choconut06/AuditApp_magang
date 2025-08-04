// import 'package:audit_app_magang/pages/biaya_penugasanpage.dart';
// import 'package:audit_app_magang/pages/dokumen_pkatpage.dart';
// import 'package:audit_app_magang/pages/homepage.dart';
// import 'package:audit_app_magang/pages/pkatpage.dart';
// import 'package:audit_app_magang/pages/program__auditpage.dart';
// import 'package:audit_app_magang/pages/risk_assessment.dart';
// import 'package:audit_app_magang/pages/surat_pemberitahuanpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'addrencanabiaya.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class RencanaBiayaPage extends StatefulWidget {
  const RencanaBiayaPage({super.key});

  @override
  State<RencanaBiayaPage> createState() => _RencanaBiayaPageState();
}

class _RencanaBiayaPageState extends State<RencanaBiayaPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, String>> biayaData = [
    {
      "nomor": "1",
      "tahun": "2024",
      "pkat": "PKAT-001",
      "total": "15 Juta",
      "revisi": "1",
      "status": "Disetujui",
      "noRevisi": "RB001",
    },
    {
      "nomor": "2",
      "tahun": "2025",
      "pkat": "PKAT-002",
      "total": "22 Juta",
      "revisi": "2",
      "status": "Revisi",
      "noRevisi": "RB002",
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
                    DataColumn(label: Text('PKAT')),
                    DataColumn(label: Text('Total Biaya')),
                    DataColumn(label: Text('Revisi')),
                    DataColumn(label: Text('Status Revisi')),
                    DataColumn(label: Text('Nomor Revisi')),
                    DataColumn(label: Text('Aksi')),
                  ],
                  rows:
                      biayaData.map((row) {
                        return DataRow(
                          cells: [
                            DataCell(Text(row['nomor']!)),
                            DataCell(Text(row['tahun']!)),
                            DataCell(Text(row['pkat']!)),
                            DataCell(Text(row['total']!)),
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
          final newData = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddRencanaBiayaPage(),
            ),
          );

          if (newData != null) {
            setState(() {
              biayaData.add(newData);
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Rencana Biaya"),
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
