import 'package:audit_app_magang/model/persiapan_audit_model.dart';
import 'package:audit_app_magang/widget/card_program_audit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

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
      appBar: _appBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Filter(),
            const SizedBox(height: 4),
            for (final item in progAuditList) ProgramAuditCard(item: item),
          ],
        ),
      ),
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
                      color: Colors.blueGrey.shade400.withOpacity(0.3),
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
                      Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.blue.shade400,
                      ),
                      Text(
                        'Filter',
                        style: TextStyle(color: Colors.blue.shade400),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _appBar() {
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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "LHP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
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
