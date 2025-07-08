import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/features/add_work/presentation/views/workflow.dart';

import 'package:miwe/features/gardeners/presentation/views/gardeners.dart';
import 'package:miwe/features/blocks/presentation/views/home_page.dart';
import 'package:miwe/features/notes/presentation/views/notes_page.dart';
import 'package:miwe/const_views/qr_scanner.dart/qr_code_page.dart';
import 'package:miwe/const_views/settings/views/settings_page.dart';

import 'package:miwe/features/work_programms/presentation/views/work_programmes.dart';
import 'package:miwe/vectors/app_vectors.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final List<Map<String, dynamic>> drawers = [
    {'menu': 'Baş sahypa', 'svgAdress': AppVectors.home},
    {'menu': 'Agranomlar', 'svgAdress': AppVectors.personIcon},
    {'menu': 'Bellikler', 'svgAdress': AppVectors.note1},
    {'menu': 'QR kod', 'svgAdress': AppVectors.qrKodIcon},
    {'menu': 'Iş meýilnamasy', 'svgAdress': AppVectors.workflow},
    {'menu': 'Iş bermek', 'svgAdress': AppVectors.addWork},

    {'menu': 'Sazlamalar', 'svgAdress': AppVectors.settings},
  ];

  final List drawerClasses = [
    HomePage(),
    Gardeners(),
    NotesPage(),
    QRScannerPage(),
    WorkProgrammes(),
    Workflow(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      backgroundColor: AppColors.drawerColor.withOpacity(0.9),
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
            ),
            child: Column(
              children: [
                Expanded(child: SvgPicture.asset(AppVectors.miweLogo)),
                Text('Serdar serdarow', style: TextStyle(color: Colors.white)),
                SizedBox(
                  child: Text('komekci', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: drawers.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => drawerClasses[index],
                      ),
                    );
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(drawers[index]['svgAdress']),
                    title: Text(
                      drawers[index]['menu'],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
