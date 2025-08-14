import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class UndanganOpeningPage extends StatefulWidget {
  const UndanganOpeningPage({super.key});

  @override
  State<UndanganOpeningPage> createState() => _UndanganOpeningState();
}

class _UndanganOpeningState extends State<UndanganOpeningPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(),
      drawer: const CustomDrawer(), // Drawer standar
      body: const Center(
        child: Text('Undangan Opening', style: TextStyle(fontSize: 24)),
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
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 40,
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
