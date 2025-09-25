// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/features/blocks/presentation/widgets/bloks_dialog.dart';
import 'package:miwe/features/blocks/presentation/widgets/map_info_widget.dart';
import 'package:miwe/features/garden/data/garden_model/garden_model.dart';
import 'package:miwe/features/garden/presentation/views/garden_sample.dart';
import 'package:miwe/vectors/app_vectors.dart';
import 'package:svg_flutter/svg_flutter.dart';


class MapGardens extends StatefulWidget {
  final int good;
  final int waterless;
  final int sick;
  final int dry;
  final int unmarked;
  final String blokNumber;

  const MapGardens({
    Key? key,
    required this.good,
    required this.waterless,
    required this.sick,
    required this.dry,
    required this.unmarked,
    required this.blokNumber,
  }) : super(key: key);

  @override
  State<MapGardens> createState() => _MapGardensState();
}

class _MapGardensState extends State<MapGardens> {
  final int rows = 21;
  final int columns = 21;
  late List<List<CellData?>> tableData;

  final ScrollController verticalControllerGrid = ScrollController();
  final ScrollController verticalControllerRows = ScrollController();

  final ScrollController horizontalControllerGrid = ScrollController();
  final ScrollController horizontalControllerColumns = ScrollController();

  bool _verticalScrollIsChanging = false;
  bool _horizontalScrollIsChanging = false;

  double cellSize = 40;

  @override
  void initState() {
    super.initState();
    tableData = generateTableData(rows, columns, gardenListStatus);

    verticalControllerGrid.addListener(() {
      if (_verticalScrollIsChanging) return;
      _verticalScrollIsChanging = true;
      verticalControllerRows.jumpTo(verticalControllerGrid.offset);
      _verticalScrollIsChanging = false;
    });

    horizontalControllerGrid.addListener(() {
      if (_horizontalScrollIsChanging) return;
      _horizontalScrollIsChanging = true;
      horizontalControllerColumns.jumpTo(horizontalControllerGrid.offset);
      _horizontalScrollIsChanging = false;
    });

    horizontalControllerColumns.addListener(() {
      if (_horizontalScrollIsChanging) return;
      _horizontalScrollIsChanging = true;
      horizontalControllerGrid.jumpTo(horizontalControllerColumns.offset);
      _horizontalScrollIsChanging = false;
    });
  }

  @override
  void dispose() {
    verticalControllerGrid.dispose();
    verticalControllerRows.dispose();
    horizontalControllerGrid.dispose();
    horizontalControllerColumns.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(widget.blokNumber),
            const SizedBox(height: 5),
            const Text('Karta', style: TextStyle(fontSize: 10)),
          ],
        ),
        actions: [
           IconButton(
                onPressed: () {
                  BloksDialog().bloksDialog(context);
                },
                icon: Icon(Icons.menu),
              ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MapInfoWidget(
                  color: AppColors.statusGreen,
                  number: widget.good,
                  title: 'Gowy',
                ),
                MapInfoWidget(
                  color: AppColors.statusBlue,
                  number: widget.waterless,
                  title: 'Suwsyz',
                ),
                MapInfoWidget(
                  color: AppColors.statusYellow,
                  number: widget.sick,
                  title: 'Keselli',
                ),
                MapInfoWidget(
                  color: AppColors.statusRed,
                  number: widget.dry,
                  title: 'Guran',
                ),
                MapInfoWidget(
                  color: AppColors.statusGrey,
                  number: widget.unmarked,
                  title: 'Bellenmedik',
                ),
              ],
            ),
          ),
          SizedBox(
            height: cellSize,
            child: Row(
              children: [
                Container(
                  width: cellSize,
                  height: cellSize,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Center(
                    child: Text(
                      '#',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: horizontalControllerColumns,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(columns, (index) {
                        return Container(
                          width: cellSize,
                          height: cellSize,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              'J$index',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: cellSize,
                  child: SingleChildScrollView(
                    controller: verticalControllerRows,
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: List.generate(rows, (index) {
                        return Container(
                          width: cellSize,
                          height: cellSize,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              '$index ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: horizontalControllerGrid,
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      controller: verticalControllerGrid,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: List.generate(rows, (rowIndex) {
                          return Row(
                            children: List.generate(columns, (colIndex) {
                              final cell = tableData[rowIndex][colIndex];
                              return GestureDetector(
                                onTap: () {
                                  if (cell != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>GardenSample(gardenModel: cell.gardenModel)
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  width: cellSize,
                                  height: cellSize,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.statusGrey,
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AppVectors.gardenTrailing,
                                      color: cell?.color ?? AppColors.statusGrey,
                                      height: cellSize - 10,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Color getColorByStatus(String status) {
  switch (status) {
    case 'Gowy':
      return AppColors.statusGreen;
    case 'Suwsyz':
      return AppColors.statusBlue;
    case 'Keselli':
      return AppColors.statusYellow;
    case 'Guran':
      return AppColors.statusRed;
    case 'Bellenmedik':
      return AppColors.statusGrey;
    default:
      return AppColors.statusGrey;
  }
}

List<List<CellData?>> generateTableData(
  int rows,
  int columns,
  List<GardenStatusMap> gardens,
) {
  List<List<CellData?>> table = List.generate(
    rows,
    (_) => List.generate(columns, (_) => null),
  );

  for (var garden in gardens) {
    if (garden.row < rows && garden.column < columns) {
      table[garden.row][garden.column] = CellData(
        color: getColorByStatus(garden.status),
        gardenModel: garden.gardenModel,
      );
    }
  }
  return table;
}

class CellData {
  final Color color;
  final GardenModel gardenModel;

  CellData({required this.color, required this.gardenModel});
}
