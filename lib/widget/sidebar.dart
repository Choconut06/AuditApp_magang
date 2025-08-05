import 'package:audit_app_magang/pages/biaya_penugasanpage.dart';
import 'package:audit_app_magang/pages/closing_meetingpage.dart';
import 'package:audit_app_magang/pages/dokumen_pkatpage.dart';
import 'package:audit_app_magang/pages/draft_lhapage.dart';
import 'package:audit_app_magang/pages/homepage.dart';
import 'package:audit_app_magang/pages/opening_meetingpage.dart';
import 'package:audit_app_magang/pages/pemenuhan_dokumenpage.dart';
import 'package:audit_app_magang/pages/permintaan_dokumenpage.dart';
import 'package:audit_app_magang/pages/pkatpage.dart';
import 'package:audit_app_magang/pages/program__auditpage.dart';
import 'package:audit_app_magang/pages/rencana_biayapage.dart';
import 'package:audit_app_magang/pages/review_draft_lhapage.dart';
import 'package:audit_app_magang/pages/surat_pemberitahuanpage.dart';
import 'package:audit_app_magang/pages/komitmenpage.dart';
import 'package:audit_app_magang/pages/login.dart';
import 'package:audit_app_magang/pages/risk_assessment.dart';
import 'package:audit_app_magang/pages/tanggapanpage.dart';
import 'package:audit_app_magang/pages/temuanpage.dart';
import 'package:audit_app_magang/pages/undangan_closingpage.dart';
import 'package:audit_app_magang/pages/undangan_openingpage.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shield),
              title: const Text('Penilaian Resiko'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiskAssessmentPage(),
                  ),
                );
              },
            ),
            // Tile Program Kerja
            ExpansionTile(
              leading: const Icon(Icons.folder),
              title: const Text("Program Kerja"),
              children: [
                ListTile(
                  title: const Text('PKAT'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const PkatPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Rencana Biaya'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RencanaBiayaPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Dokumen PKAT'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DokumenPkatPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Tile Persiapan Audit
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
                        builder: (context) => const SuratPemberitahuanPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Program Audit'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProgramAuditPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Biaya Penugasan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BiayaPenugasanPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Tile Pelaksanaan Audit
            ExpansionTile(
              leading: const Icon(Icons.ballot),
              title: const Text("Pelaksanaan Audit"),
              children: [
                ListTile(
                  title: const Text('Undangan Opening'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UndanganOpeningPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Opening Meeting'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OpeningMeetingPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Permintaan Dokumen'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PermintaanDokumenPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Pemenuhan Dokumen'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PemenuhanDokumenPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Draft LHA'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DraftLHAPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Review Draft LHA'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReviewDraftLHAPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Tanggapan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TanggapanPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Temuan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TemuanPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Undangan Closing'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UndanganClosingPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Closing Meeting'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClosingMeetingPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Komitmen'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KomitmenPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
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
      ),
    );
  }
}
