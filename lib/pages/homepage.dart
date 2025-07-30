import 'package:audit_app_magang/model/mainmenu.dart';
import 'package:audit_app_magang/pages/biaya_penugasanpage.dart';
import 'package:audit_app_magang/pages/dokumen_pkatpage.dart';
import 'package:audit_app_magang/pages/pkatpage.dart';
import 'package:audit_app_magang/pages/program__auditpage.dart';
import 'package:audit_app_magang/pages/rencana_biayapage.dart';
import 'package:audit_app_magang/pages/surat_pemberitahuanpage.dart';
import 'package:audit_app_magang/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'risk_assessment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<MainMenuModel> mainMenu = [];

  @override
  void initState() {
    super.initState();
    _getMainMenu();
  }

  void _getMainMenu() {
    mainMenu = MainMenuModel.getMainMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(child: menuContainer()),
        ),
      ),
    );
  }

  Container menuContainer() {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: List.generate(mainMenu.length, (index) {
          final item = mainMenu[index];
          return GestureDetector(
            onTap: () {
              switch (item.name) {
                case 'Penilaian Risiko':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RiskAssessmentPage(),
                    ),
                  );
                  break;
                case 'PKAT':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PkatPage()),
                  );
                  break;
                case 'Rencana Biaya':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RencanaBiayaPage(),
                    ),
                  );
                  break;
                case 'Dokumen PKAT':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DokumenPkatPage(),
                    ),
                  );
                  break;
                case 'Surat Pemberitahuan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuratPemberitahuanPage(),
                    ),
                  );
                  break;
                case 'Program Audit':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProgramAuditPage(),
                    ),
                  );
                  break;
                case 'Biaya Penugasan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BiayaPenugasanPage(),
                    ),
                  );
                  break;
                default:
                  // fallback jika menu tidak ditemukan
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Halaman belum tersedia')),
                  );
              }
            },
            child: SizedBox(
              width: 70,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: item.boxColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        item.iconPath,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        }),
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
}
