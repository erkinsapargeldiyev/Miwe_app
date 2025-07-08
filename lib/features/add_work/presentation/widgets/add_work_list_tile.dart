import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miwe/const_views/widgets/lists.dart';
import 'package:miwe/const_views/widgets/popup_menu_app.dart';
import 'package:miwe/const_views/widgets/snakBar.dart';
import 'package:miwe/features/add_work/presentation/widgets/select_garden_dialog.dart';
import 'package:miwe/features/add_work/presentation/widgets/select_gardeners_dialog.dart';
import 'package:miwe/features/add_work/presentation/widgets/sheet_list_tile.dart';
import 'package:miwe/vectors/app_vectors.dart';

class AddWorkListTile extends StatefulWidget {
  const AddWorkListTile({super.key});

  @override
  State<AddWorkListTile> createState() => _AddWorkListTileState();
}

class _AddWorkListTileState extends State<AddWorkListTile> {
  String? _selectedGardener;
  String? _selectedNumberRange;
  String? _selectedBlok;
  String _selectedRow = 'Saýlanmadyk';

  DateTimeRange selectedDates = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SheetListTile(
          title: 'Agranom',
          subtitle: _selectedGardener ?? 'Saýlanmadyk',
          onTap: () async {
            final result = await SelectGardenersDialog.showGardenersDialog(
              context,
            );
            if (result != null) {
              setState(() {});
              _selectedGardener = result;
            }
          },
          child: SvgPicture.asset(AppVectors.noteDropDown),
        ),
        SheetListTile(
          title: 'Blok',
          subtitle: _selectedBlok ?? 'Saýlanmadyk',
          onTap: () {},

          child: PopupMenuApp(
            list: bloks,
            onSelected: (String newValue) {
              setState(() {
                _selectedBlok = newValue;
              });
            },
          ),
        ),
        SheetListTile(
          title: 'Hatar',
          subtitle: _selectedRow,
          onTap: () {},

          child: PopupMenuApp(
            list: rows,
            onSelected: (String newValue) {
              setState(() {
                _selectedRow = newValue;
              });
            },
          ),
        ),

        SheetListTile(
          title: 'Bag',
          subtitle: _selectedNumberRange ?? 'Saýlanmadyk',
          onTap: () async {
            if (_selectedRow == 'Saýlanmadyk') {
              Snakbar.snakBar(
                title: 'Hatar saýlaň',
                context: context,
                color: Colors.red,
              );
            }

            if (_selectedRow != 'Saýlanmadyk') {
              final result = await SelectGarden.showNumberRangeDialog(
                context,
                _selectedRow.toString(),
              );

              if (result != null) {
                setState(() {
                  _selectedNumberRange = result['Number'];
                });
              }
            }
          },
          child: SvgPicture.asset(AppVectors.noteDropDown),
        ),

        SheetListTile(
          title: 'Wagty',
          subtitle: '${selectedDates.duration.inDays} gün',
          onTap: () async {
            final DateTimeRange? dateTimeRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2025),
              lastDate: DateTime(3000),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    datePickerTheme: DatePickerThemeData(
                      rangeSelectionBackgroundColor:
                          Colors.grey[300], // Ortadaky günler
                      // Soňky
                      todayBackgroundColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                    colorScheme: ColorScheme.light(
                      primary: Colors.black, // Saýlanan günleriň basgysy
                      onPrimary: Colors.white, // Gün ýazgysy (saýlananlar üçin)
                      surface: Colors.white,
                      onSurface:
                          Colors.black, // Gün ýazgysy (saýlanmadyklar üçin)
                    ),
                    textTheme: TextTheme(
                      bodyMedium: TextStyle(
                        color: Colors.black,
                      ), // Gün ýazgylary
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (dateTimeRange != null) {
              setState(() {
                selectedDates = dateTimeRange;
              });
            }
          },
          child: SvgPicture.asset(AppVectors.noteDropDown),
        ),
      ],
    );
  }
}
