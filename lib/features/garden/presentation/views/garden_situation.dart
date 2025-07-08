import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:miwe/colors/app_colors.dart';

import 'package:miwe/features/garden/data/garden_model/garden_model.dart';
import 'package:miwe/features/garden/presentation/widgets/custom_row_text.dart';
import 'package:miwe/features/garden/presentation/widgets/image_indicator.dart';
import 'package:miwe/vectors/app_vectors.dart';

class GardenSituation extends StatefulWidget {
  const GardenSituation({super.key});

  @override
  State<GardenSituation> createState() => _GardenSituationState();
}

class _GardenSituationState extends State<GardenSituation> {
  int? _selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bagyň ýagdaýy')),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width / 3.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.greyE),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        DateFormat('dd-MM-yyyy').format(DateTime.now()),
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge?.copyWith(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                AppVectors.treeDuotone,
                color: AppColors.statusGreen,
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.statusGreen,
                    ),
                  ),
                  Text('Gowy', style: TextStyle(fontFamily: 'Poppins')),
                  SizedBox(height: 20),
                  Divider(color: AppColors.grey),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: PageView.builder(
                            onPageChanged: (index) {
                              setState(() {
                                _selectedImageIndex = index;
                              });
                            },
                            itemCount: gardens.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(gardens[index].imageUrl),
                              );
                            },
                          ),
                        ),
                        if (gardens.isNotEmpty && gardens.length > 1)
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(gardens.length, (index) {
                                return ImageIndicator(
                                  isActive: _selectedImageIndex == index,
                                );
                              }),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomRowText(title: 'Ýagdaýy:', valueText: 'Gowy'),
              CustomRowText(title: 'Suwaryldy:', valueText: '17.02.1015'),
              CustomRowText(
                title: 'Dermanlanyldy:',
                valueText: '(Dermanyň ady)',
              ),
              CustomRowText(title: 'Gyrkym ýagdaýy:', valueText: 'Edildi'),
              CustomRowText(title: 'Dökün:', valueText: 'Berildi'),
              CustomRowText(title: 'Ekilen senesi:', valueText: '02.09.2025'),
              CustomRowText(title: 'Ýygym sany:', valueText: '2'),

              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.greyE,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bellik', style: TextStyle(fontSize: 15)),
                      Text(
                        'Bagyň  ýagdaýy gowy suw berilmändir gyssagly suw bermeli',
                        style: TextStyle(fontSize: 15, color: AppColors.grey6A),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        backgroundColor: AppColors.closeButton,
                      ),

                      child: Center(
                        child: Text(
                          'Yza çykmak',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        backgroundColor: AppColors.appButtonBg,
                      ),

                      child: Center(
                        child: Text(
                          'Maglumat bermek',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
