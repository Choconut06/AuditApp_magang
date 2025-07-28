import 'package:audit_app_magang/pages/biaya_penugasanpage.dart';
import 'package:audit_app_magang/pages/homepage.dart';
import 'package:audit_app_magang/pages/pkatpage.dart';
import 'package:audit_app_magang/pages/program__auditpage.dart';
import 'package:audit_app_magang/pages/rencana_biayapage.dart';
import 'package:audit_app_magang/pages/risk_assessment.dart';
import 'package:audit_app_magang/pages/surat_pemberitahuanpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login.dart';
import 'adddokumenpkat.dart';

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
      drawer: _buildDrawer(),
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

  Drawer _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shield),
            title: const Text('Penilaian Resiko'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RiskAssessmentPage()),
              );
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.folder),
            title: const Text("Program Kerja"),
            children: [
              ListTile(
                title: const Text('PKAT'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const PkatPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Rencana Biaya'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const RencanaBiayaPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Dokumen PKAT'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const DokumenPkatPage()),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.receipt_long),
            title: const Text("Persiapan Audit"),
            children: [
              ListTile(
                title: const Text('Surat Pemberitahuan'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SuratPemberitahuanPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Program Audit'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const ProgramAuditPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Biaya Penugasan'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BiayaPenugasanPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
