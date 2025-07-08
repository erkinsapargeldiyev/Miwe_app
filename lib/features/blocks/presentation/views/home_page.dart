import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/features/blocks/data/block_model/blok_model.dart';
import 'package:miwe/features/blocks/presentation/views/bloks_page.dart';
import 'package:miwe/features/blocks/presentation/widgets/chart_card.dart';
import 'package:miwe/const_views/widgets/my_drawer.dart';
import 'package:miwe/const_views/qr_scanner.dart/qr_scanner.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.statusBarColor),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.appColor,
            shape: const CircleBorder(),
            onPressed: () {
              QrScanner().scanQRGarden(context);
            },
            child: const Icon(
              Icons.qr_code_scanner_outlined,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            title: const Text(
              'Baş sahypa',
              style: TextStyle(color: Colors.white),
            ),
            actions: [],
          ),
          drawer: MyDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ListView.builder(
              itemCount: blokList.length,
              itemBuilder: (context, index) {
                final bloks = blokList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BloksPage(blok: bloks.blokNumber),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      CardChart(
                        groupNo: bloks.blokNumber,
                        gowyInt: bloks.gowy,
                        suwsyzInt: bloks.suwsyz,
                        keselliInt: bloks.kesseli,
                        guranInt: bloks.guran,
                        bellenmedikInt: bloks.bellenmedik,
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
