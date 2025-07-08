import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/vectors/app_vectors.dart';
import 'package:svg_flutter/svg.dart';

class GardenNotesWidget extends StatelessWidget {
  const GardenNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Maksat',
                            style: TextTheme.of(
                              context,
                            ).headlineLarge?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '03.12.2025 17:40',
                            style: TextTheme.of(
                              context,
                            ).headlineLarge?.copyWith(
                              fontSize: 12,
                              color: AppColors.workTimeRange,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('Baglaryn yapraklary gurapdyr'),
                      ),
                      trailing: SvgPicture.asset(
                        AppVectors.gardenTrailing,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: AppColors.grey),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
