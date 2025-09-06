import 'package:audit_app_magang/pages/addpkat.dart';
import 'package:audit_app_magang/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:audit_app_magang/model/program_kerja_model.dart';
import 'package:audit_app_magang/widget/card_program_kerja.dart';

class PkatPage extends StatefulWidget {
  const PkatPage({super.key});

  @override
  State<PkatPage> createState() => _PkatPageState();
}

class _PkatPageState extends State<PkatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<ProgramKerjaItem> items;

  @override
  void initState() {
    super.initState();
    items = ProgramKerjaItem.samplePkat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _filterBar(),
            const SizedBox(height: 4),
            for (final item in items)
              CardProgramKerja(
                item: item,
                onEdit: () {
                  // TODO: aksi edit
                },
                onDelete: () {
                  setState(() {
                    items.remove(item);
                  });
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // Arahkan ke form tambah PKAT jika ada
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPkatPage()),
          );

          if (result is ProgramKerjaItem) {
            setState(() {
              items.add(result);
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah PKAT"),
      ),
    );
  }

  Widget _filterBar() {
    return Row(
      children: [
        Container(
          height: 60,
          width: 160,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: GestureDetector(
            onTap: () {
              // TODO: buka modal filter
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blueGrey.shade400.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.filter_alt_outlined, color: Colors.blue.shade400),
                  Text('Filter', style: TextStyle(color: Colors.blue.shade400)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: AppBar(
        backgroundColor: Colors.blue[400],
        automaticallyImplyLeading: false,
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
                    const Text(
                      'PKAT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
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
