import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login.dart';
import 'AddRiskPage.dart';

class RiskAssessmentPage extends StatefulWidget {
  const RiskAssessmentPage({super.key});

  @override
  State<RiskAssessmentPage> createState() => _RiskAssessmentPageState();
}

class _RiskAssessmentPageState extends State<RiskAssessmentPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, String>> riskData = [
    {
      "nomor": "1",
      "periode": "2023",
      "jenis": "Internal",
      "objek": "Keuangan",
      "sasaran": "Efisiensi",
      "reverensi": "ISO 31000",
      "status": "Selesai",
    },
    {
      "nomor": "2",
      "periode": "2024",
      "jenis": "Eksternal",
      "objek": "Operasional",
      "sasaran": "Efektivitas",
      "reverensi": "COSO",
      "status": "Proses",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final newRisk = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddRiskPage(),
                    ),
                  );

                  if (newRisk != null) {
                    setState(() {
                      riskData.add(newRisk);
                    });
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text("Tambah Data"),
              ),
            ),
          ),
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
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Periode')),
                    DataColumn(label: Text('Jenis Audit')),
                    DataColumn(label: Text('Objek Audit')),
                    DataColumn(label: Text('Sasaran')),
                    DataColumn(label: Text('Reverensi')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Aksi')),
                  ],
                  rows:
                      riskData.map((row) {
                        return DataRow(
                          cells: [
                            DataCell(Text(row['nomor']!)),
                            DataCell(Text(row['periode']!)),
                            DataCell(Text(row['jenis']!)),
                            DataCell(Text(row['objek']!)),
                            DataCell(Text(row['sasaran']!)),
                            DataCell(Text(row['reverensi']!)),
                            DataCell(Text(row['status']!)),
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
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.blue[400],
      toolbarHeight: 120,
      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            leading: const Icon(Icons.dashboard),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Risiko Audit'),
            onTap: () {},
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
