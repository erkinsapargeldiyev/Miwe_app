import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miwe/colors/app_colors.dart';

import 'package:miwe/const_views/qr_scanner.dart/qr_scanner.dart';
import 'package:miwe/const_views/widgets/custom_button.dart';
import 'package:miwe/const_views/widgets/my_drawer.dart';

class QRScannerPage extends StatelessWidget {
  const QRScannerPage({super.key, t});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.statusBarColor),
      child: SafeArea(
        child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text('QR Kod Skener', style: TextStyle(color: Colors.white)),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.qr_code_scanner, size: 100, color: Colors.green),
                SizedBox(height: 20),
                Text(
                  'ID-sini skaner etmek üçin',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 30),
                CustomButton(
                  onTap: () {
                    QrScanner().scanQRGarden(context);
                  },
                  title: 'Bag skaner et',
                ),
                SizedBox(height: 20),

                CustomButton(onTap: () {
                                      QrScanner().scanQRBlok(context);

                }, title: 'Blok skaner et'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
