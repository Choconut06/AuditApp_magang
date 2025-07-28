import 'package:audit_app_magang/model/persiapan_audit_model.dart';
import 'package:audit_app_magang/pages/biaya_penugasanpage.dart';
import 'package:audit_app_magang/pages/dokumen_pkatpage.dart';
import 'package:audit_app_magang/pages/homepage.dart';
import 'package:audit_app_magang/pages/pkatpage.dart';
import 'package:audit_app_magang/pages/rencana_biayapage.dart';
import 'package:audit_app_magang/pages/risk_assessment.dart';
import 'package:audit_app_magang/pages/surat_pemberitahuanpage.dart';
import 'package:audit_app_magang/widget/program_audit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login.dart';

class ProgramAuditPage extends StatefulWidget {
  const ProgramAuditPage({super.key});

  @override
  State<ProgramAuditPage> createState() => _ProgramAuditPageState();
}

class _ProgramAuditPageState extends State<ProgramAuditPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<ProgramAuditModel> progAuditList = [];

  @override
  void initState() {
    super.initState();
    _getSuratList();
  }

  void _getSuratList() {
    progAuditList = ProgramAuditModel.getProgramAuditList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(),
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Filter(),
            const SizedBox(
              height: 4,
            ),
            for (final item in progAuditList) ProgramAuditCard(item: item)
          ],
        ),
      )
    );
  }

  Row Filter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Container(
            height: 60,
            width: 160,
            padding: EdgeInsets.only(left: 16, right: 16, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.blueGrey.shade400.withOpacity(0.3)
                        ),
                      borderRadius: BorderRadius.circular(24),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.shade400,
                      //     offset: Offset(2.0, 2.0),
                      //     blurRadius: 10.0,
                      //     spreadRadius: 0.1
                      //   ),
                      //   BoxShadow(
                      //     color: const Color.fromARGB(255, 255, 255, 255),
                      //     offset: Offset(-2.0, -2.0),
                      //     blurRadius: 10.0,
                      //     spreadRadius: 0.1
                      //   ),
                      // ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.filter_alt_outlined, color: Colors.blue.shade400,),
                        Text(
                          'Filter',
                          style: TextStyle(
                            color: Colors.blue.shade400
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {

                  },
                )
              ],
            ),
          ),
        ]
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
                    // Menu Button
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
                    //title
                    const Text(
                      'Program Audit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    // Profile icon
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
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shield),
            title: const Text('Penilaian Resiko'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RiskAssessmentPage(),
                ),
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
                    MaterialPageRoute(builder: (context) => PkatPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Rencana Biaya'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RencanaBiayaPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Dokumen PKAT'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DokumenPkatPage()),
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
                      builder: (context) => SuratPemberitahuanPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Program Audit'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProgramAuditPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Biaya Penugasan'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BiayaPenugasanPage(),
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
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}