import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/lists.dart';
import 'package:miwe/const_views/widgets/my_drawer.dart';
import 'package:miwe/const_views/widgets/selected_blok.dart';
import 'package:miwe/features/add_work/presentation/views/add_work.dart';
import 'package:miwe/features/add_work/presentation/widgets/bottom_sheet_dialog.dart';
import 'package:miwe/features/add_work/presentation/widgets/remove_edit_button.dart';
import 'package:miwe/features/add_work/presentation/widgets/work_buttons.dart';

import 'package:miwe/vectors/app_vectors.dart';

class Workflow extends StatefulWidget {
  const Workflow({super.key});

  @override
  State<Workflow> createState() => _AddWorkState();
}

class _AddWorkState extends State<Workflow> {
  bool todoTasks = true;
  bool endTasks = false;

  int? selectedBlok;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.statusBarColor),
      child: SafeArea(
        child: DefaultTabController(
          length: companyList.length,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.appColor,
              shape: const CircleBorder(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddWork()),
                );
              },
              child: const Icon(Icons.add, color: Colors.white),
            ),
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
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.8,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'A2 BLok - Joya №3-[1-30] Bag',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: Colors.black.withOpacity(0.1),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Dayach',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),

                                    Expanded(
                                      child: RemoveEditButton(
                                        onTap: () {},
                                        color: AppColors.appButtonBg,
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppVectors.delete,
                                              height: 15,
                                            ),
                                            SizedBox(width: 6),

                                            Text(
                                              'Aýyrmak',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),

                                    Expanded(
                                      child: RemoveEditButton(
                                        onTap: () {
                                          BottomSheetDialog.bottomSheet(
                                            context,
                                          );
                                        },
                                        color: AppColors.appButtonBg,
                                        child: Center(
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                AppVectors.edit,
                                                height: 14,
                                              ),
                                              SizedBox(width: 6),
                                              Text(
                                                'Düzetmek',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
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
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
