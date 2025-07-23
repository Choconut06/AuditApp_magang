import 'package:audit_app_magang/model/mainmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<MainMenuModel> mainMenu = [];

  void _getMainMenu() {
    mainMenu = MainMenuModel.getMainMenu();
  }

  @override
  Widget build(BuildContext context) {
    _getMainMenu();
    return Scaffold(
      appBar: appBar(),

      body: Column(
        children: [
          mainMenuBar()
        ],
      ),
    );
  }

  SizedBox mainMenuBar() {
    return SizedBox(
          height: 300,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 127,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3)
                    )
                  ]
                ),
              ),

              Positioned(
                top: 10,  
                child: Container(
                  height: 219,
                  width: 384,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade400
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: GridView.count(
                      crossAxisCount: 4,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(mainMenu.length, (index){
                        final item = mainMenu[index];
                        return GestureDetector(
                          onTap: (){
                            print('Pindah ke halaman ${item.name}');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: item.boxColor,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    item.iconPath
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(item.name),
                            ],
                          ),
                        );
                      }
                      ),
                    ),
                  )
                ),
              )
            ],
          ),
        );
  }


  //menggunakan prefersize karena appbar custom
  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: AppBar(
        automaticallyImplyLeading: false, 
        backgroundColor: Colors.blue[400],
        flexibleSpace: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Leading icon
                      Container(
                        alignment: Alignment.center,
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
 
                      // Action icon
                      Container(
                        alignment: Alignment.center,
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
      ),
    );
  }
}
