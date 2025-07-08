import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';

import 'package:miwe/features/add_work/presentation/widgets/text_button_app.dart';
import 'package:miwe/features/intro/presentation/widgets/text_input_number.dart';

class NumberRangeSelectionDialog extends StatefulWidget {
  String title;
  NumberRangeSelectionDialog({super.key, required this.title});

  @override
  State<NumberRangeSelectionDialog> createState() =>
      _NumberRangeSelectionDialogState();
}

class _NumberRangeSelectionDialogState
    extends State<NumberRangeSelectionDialog> {
  bool allGarden = false;

  TextEditingController numberRangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Bag saýlaň',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${widget.title} - hemmesini saýla'),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: AppColors.appButtonBg,
                  value: allGarden,
                  onChanged: (_) {
                    setState(() {
                      allGarden = !allGarden;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 30),

            TextInputNumber(
              controller: numberRangeController,
              labelText: 'San aralygyny ýazyň',
            ),
            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButtonApp(
                  title: 'Goýbolsun',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 8),
                TextButtonApp(
                  title: 'Saýla',
                  onTap: () {
                    if (numberRangeController.text.isNotEmpty) {
                      Navigator.of(
                        context,
                      ).pop({'Number': numberRangeController.text});
                    } else if (allGarden == true) {
                      Navigator.of(context).pop({'Number': 'Ählisi'});
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Aralygy saylan')));
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectGarden {
  static Future showNumberRangeDialog(
    BuildContext context,
    String title,
  ) async {
    return await showDialog(
      context: context,
      builder: (context) => NumberRangeSelectionDialog(title: title),
    );
  }
}
