import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/lists.dart';
import 'package:miwe/features/blocks/data/block_model/blok_model.dart';
import 'package:miwe/features/blocks/presentation/widgets/bloks_dialog.dart';
import 'package:miwe/features/garden/data/garden_model/garden_model.dart';
import 'package:miwe/features/garden/presentation/views/garden_sample.dart';
import 'package:miwe/const_views/widgets/status_option.dart';
import 'package:miwe/vectors/app_vectors.dart';
import 'package:svg_flutter/svg.dart';

class BloksPage extends StatefulWidget {
  final String? blok;
  final BlokModel? blokModel;
  const BloksPage({super.key,  this.blok, this.blokModel});

  @override
  State<BloksPage> createState() => _A1BlockPageState();
}

class _A1BlockPageState extends State<BloksPage> {
  int? selectedSituation;
  int? selectedJoya;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.statusBarColor),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  BloksDialog().bloksDialog(context);
                },
                icon: Icon(Icons.more_vert),
              ),
            ],
            title: Text(widget.blok ?? '', style: TextStyle(color: Colors.white)),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        bool isSelectedJoya = selectedJoya == index;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedJoya = index;
                              });
                            },
                            child: Container(
                              width: 97,
                              decoration: BoxDecoration(
                                color:
                                    isSelectedJoya
                                        ? AppColors.todoWorkButton
                                        : AppColors.bgButtonGrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Hatar №${index + 1}',
                                  style: TextStyle(
                                    color:
                                        isSelectedJoya
                                            ? AppColors.todoWorkButtonText
                                            : Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // StatusDot List
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(situations.length, (index) {
                        bool isSelected = selectedSituation == index;
                        return StatusDot(
                          option: StatusOption(
                            label: situations[index]['situation'],
                            color: situations[index]['color'],
                          ),
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              selectedSituation = index;
                            });
                          },
                        );
                      }),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: Colors.grey),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: gardens.length,
                  itemBuilder: (context, index) {
                    GardenModel garden = gardens[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => GardenSample(gardenModel: garden),
                          ),
                        );
                      },
                      trailing: SvgPicture.asset(
                        AppVectors.gardenTrailing,
                        height: 25,
                        color:
                            index == 1
                                ? AppColors.statusGreen
                                : index == 2
                                ? AppColors.statusRed
                                : index == 4
                                ? AppColors.statusYellow
                                : AppColors.statusBlue,
                      ),
                      leading: Text(
                        '${index + 1}.',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          fontFamily: 'Inter',
                        ),
                      ),
                      title: Text(
                        garden.id,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
