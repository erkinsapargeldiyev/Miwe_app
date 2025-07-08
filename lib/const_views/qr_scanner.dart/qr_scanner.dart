import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:miwe/features/blocks/data/block_model/blok_model.dart';
import 'package:miwe/features/blocks/presentation/views/bloks_page.dart';
import 'package:miwe/features/garden/data/garden_model/garden_model.dart';
import 'package:miwe/features/garden/presentation/views/garden_sample.dart';

final options = ScanOptions(
  strings: {
    'cancel': 'Yza gaýtarmak',
    'flash_on': 'Çyrany ýak',
    'flash_off': 'Çyrany öçür',
  },

  useCamera: -1,
  autoEnableFlash: false,
  android: AndroidOptions(useAutoFocus: true),
);

class QrScanner {
  Future<void> scanQRGarden(BuildContext context, ) async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': 'Yza gaýtarmak',
            'flash_on': 'Çyrany ýak',
            'flash_off': 'Çyrany öçür',
          },
        ),
      );

      if (result.rawContent.isNotEmpty) {
        // Skener edilen ID-ni tap
        final scannedId = result.rawContent;
        final matchedBlok = gardens.firstWhere(
          (garden) => garden.id == scannedId,
        );

        if (matchedBlok != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GardenSample(gardenModel: matchedBlok),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text('Nädogry ID'),
                  content: Text('$scannedId ID-li blok tapylmady'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
          );
        }
      }
    } catch (e) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text('Skaner ýalňyşlygy'),
              content: Text(
                'QR kod skaner edilýärkä ýalňyşlyk döredi: ${e.toString()}',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );
    }
  }

   Future<void> scanQRBlok(BuildContext context,) async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': 'Yza gaýtarmak',
            'flash_on': 'Çyrany ýak',
            'flash_off': 'Çyrany öçür',
          },
        ),
      );

      if (result.rawContent.isNotEmpty) {
        // Skener edilen ID-ni tap
        final scannedId = result.rawContent;
        final matchedBlok = blokList.firstWhere(
          (blok) => blok.idBlok == scannedId,
        );

        if (matchedBlok != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BloksPage(blokModel: matchedBlok,),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text('Nädogry ID'),
                  content: Text('$scannedId ID-li blok tapylmady'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
          );
        }
      }
    } catch (e) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text('Skaner ýalňyşlygy'),
              content: Text(
                'QR kod skaner edilýärkä ýalňyşlyk döredi: ${e.toString()}',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );
    }
  }
}
