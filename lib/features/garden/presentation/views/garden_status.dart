import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/lists.dart';
import 'package:miwe/const_views/widgets/status_option.dart';
import 'package:miwe/const_views/widgets/gardener_works_note.dart';


class GardenStatus extends StatefulWidget {
  const GardenStatus({super.key});

  @override
  State<GardenStatus> createState() => _GardenStatusState();
}

class _GardenStatusState extends State<GardenStatus> {
  int selectedSituation = 0;
  bool selectedHasylYetisdi = false;
  bool selectedSuwaryldy = false;
  bool selectedDermanlanyldy = false;

  bool selectedHasylYgnaldy = false;
  bool selectedGyrkymEdildi = false;
  bool selectedDokunBerildi = false;

  bool selectedKeselli = false;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.statusBarColor),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Baglaryň ýagdaýlary')),
          body: Column(
            children: [
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
              GardenerWorksNote(),
            ],
          ),
        ),
      ),
    );
  }
}
