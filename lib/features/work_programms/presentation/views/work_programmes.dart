import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/my_drawer.dart';
import 'package:miwe/const_views/widgets/selected_blok.dart';
import 'package:miwe/features/add_work/presentation/widgets/remove_edit_button.dart';
import 'package:miwe/features/add_work/presentation/widgets/work_buttons.dart';

import 'package:miwe/vectors/app_vectors.dart';
import 'package:svg_flutter/svg.dart';

class WorkProgrammes extends StatefulWidget {
  const WorkProgrammes({super.key});

  @override
  State<WorkProgrammes> createState() => _AddWorkState();
}

class _AddWorkState extends State<WorkProgrammes> {
  int selectedButton = 0;
  int? selectedBlok;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.statusBarColor),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          drawer: MyDrawer(),

          appBar: AppBar(title: Text('Iş meýilnamasy')),

          body: Column(
            children: [
              WorkButtons(),

              SizedBox(height: 50, child: SelectedBlok()),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),

                      child: Container(
                        height: 240,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.bgButtonGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppVectors.calendar,
                                    color: AppColors.workTimeRange,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '10.05.2024ý ',
                                    style: TextStyle(
                                      color: AppColors.workTimeRange,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  Text(
                                    '-10.06.2025ý',
                                    style: TextStyle(
                                      color: AppColors.workTimeRange,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  if (index == 1) ...[
                                    Container(
                                      height: 30,
                                      width:
                                          MediaQuery.of(context).size.height /
                                          6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xffD96464),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'wagtynda tamamlanmady',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontFamily: 'Roboto',

                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                'A1 blogyn yagdaylaryny dermanlamaly',
                                style: TextStyle(fontFamily: 'Roboto'),
                              ),
                              Text(
                                'Baglaryn gozegciligini guyclendirmeli suwarys islerini gecirmeli',
                                style: TextStyle(
                                  color: AppColors.workTimeRange,
                                ),
                              ),
                              SizedBox(height: 20),

                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width / 1.8,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'A2 BLok - J№3-[1-30] Bag',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.7,
                                    child: RemoveEditButton(
                                      onTap: () {},
                                      color: AppColors.appButtonBg,
                                      child: Text(
                                        'Tamamladym',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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


  // ...List.generate(
              //   companyList.length,
              //   (index) => Text(companyList[index]),
              // ),
