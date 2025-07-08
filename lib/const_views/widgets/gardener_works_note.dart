import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/features/garden/presentation/views/garden_situation.dart';
import 'package:miwe/vectors/app_vectors.dart';
import 'package:svg_flutter/svg.dart';

class GardenerWorksNote extends StatelessWidget {
  const GardenerWorksNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,

        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GardenSituation(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, -1),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                        // ↓ aşakdan kölege
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 1),
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            '25.05.2025',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                'Hasyl ýetişdi',
                                style: TextStyle(
                                  color: AppColors.grey6A,
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Dermanlanyldy',
                                style: TextStyle(
                                  color: AppColors.grey6A,
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Suwaryldy',
                                style: TextStyle(
                                  color: AppColors.grey6A,
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: SvgPicture.asset(
                                  AppVectors.gardenTrailing,
                                  height: 30,
                                  width: 30,
                                  color:
                                      index == 1
                                          ? AppColors.statusBlue
                                          : (index == 2
                                              ? AppColors.statusYellow
                                              : AppColors.statusRed),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
