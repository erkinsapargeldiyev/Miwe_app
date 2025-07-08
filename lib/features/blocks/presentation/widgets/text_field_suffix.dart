import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/lists.dart';
import 'package:miwe/features/blocks/presentation/widgets/harvest_season.dart';

class TextFieldSuffix extends StatefulWidget {
  const TextFieldSuffix({super.key});

  @override
  State<TextFieldSuffix> createState() => _TextFieldSuffixState();
}

class _TextFieldSuffixState extends State<TextFieldSuffix> {
  TextEditingController controller = TextEditingController();

  String? selectedRow;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            controller: controller,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyE),
              ),

              label: Text(
                'Hasyly(tonna)',
                style: TextStyle(fontFamily: 'Inter'),
              ),
              labelStyle: TextStyle(color: AppColors.grey6A),
              floatingLabelStyle: TextStyle(color: Colors.black),
            ),
          ),

          if (controller.text.isNotEmpty) ...[
            Positioned(
              right: 5,
              top: 7,
              child: Column(
                children: [
                  HarvestSeason(
                    list: season,
                    labelText: selectedRow ?? 'Saýlanmadyk',
                    onChanged: (value) {
                      setState(() {
                        selectedRow = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
