import 'package:audit_app_magang/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audit_app_magang/pages/addbuktipermulaanpage.dart';

class BuktiPermulaanpage extends StatefulWidget {
  const BuktiPermulaanpage({super.key});

  @override
  State<BuktiPermulaanpage> createState() => _BuktiPermulaanPageState();
}

class _BuktiPermulaanPageState extends State<BuktiPermulaanpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> _buktiPermulaanData = [
    {
      "nomor": 1,
      "tahun": "2025",
      "objekAudit": "Audit Operasional Cabang",
      "buktiPermulaan": "Indikasi penyimpangan SOP",
      "rev": "1",
      "status": "Dalam Proses",
      "#": "BP001",
    },
    {
      "nomor": 2,
      "tahun": "2025",
      "objekAudit": "Audit Keuangan Pusat",
      "buktiPermulaan": "Kelebihan pembayaran vendor",
      "rev": "2",
      "status": "Disetujui",
      "#": "BP002",
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
              "Daftar Bukti Permulaan",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            /// Tabel Responsif
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double tableWidth = constraints.maxWidth;

                  // Gunakan scroll horizontal jika layar sempit
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: tableWidth, // Lebar minimal = lebar layar
                      ),
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue.shade100,
                        ),
                        headingTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        columns: const [
                          DataColumn(label: Text("Nomor")),
                          DataColumn(label: Text("Tahun")),
                          DataColumn(label: Text("Objek Audit")),
                          DataColumn(label: Text("Bukti Permulaan")),
                          DataColumn(label: Text("Rev")),
                          DataColumn(label: Text("Status")),
                          DataColumn(label: Text("#")),
                          DataColumn(label: Text("Aksi")),
                        ],
                        rows:
                            _buktiPermulaanData.map((data) {
                              return DataRow(
                                cells: [
                                  DataCell(Text(data["nomor"].toString())),
                                  DataCell(Text(data["tahun"])),
                                  DataCell(Text(data["objekAudit"])),
                                  DataCell(Text(data["buktiPermulaan"])),
                                  DataCell(Text(data["rev"])),
                                  DataCell(Text(data["status"])),
                                  DataCell(Text(data["#"])),
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
                                                  'Edit data ${data["objekAudit"]}',
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
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Hapus data ${data["objekAudit"]}',
                                                ),
                                              ),
                                            );
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddBuktiPermulaanPage()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Bukti"),
      ),
    );
  }

  /// Custom AppBar
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
