import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/lists.dart';
import 'package:miwe/const_views/widgets/selected_blok.dart';
import 'package:miwe/const_views/widgets/status_option.dart';
import 'package:miwe/const_views/widgets/my_drawer.dart';
import 'package:miwe/vectors/app_vectors.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<String> noteSearhBloks = ['Hemmesi', 'A1 blok', 'A2 blok', 'A3 blok'];

  int? selectedBlokNote;
  int? selectedSituation;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.statusBarColor),
      child: SafeArea(
        child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text('Bellikler'),
            actions: [
              SvgPicture.asset(AppVectors.calendar),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  DateFormat('dd-MM-yyyy').format(DateTime.now()),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          body: Column(
            children: [
              SizedBox(height: 50, child: SelectedBlok()),
              SizedBox(height: 10),
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
                child: Divider(color: Color(0xffDDDDDD)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
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
                                  color: Color(0xff202020),
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
                            color:
                                index == 1
                                    ? AppColors.statusBlue
                                    : index == 2
                                    ? AppColors.statusGreen
                                    : AppColors.statusRed,
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(color: Color(0xffDDDDDD)),
                        ),
                      ],
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
