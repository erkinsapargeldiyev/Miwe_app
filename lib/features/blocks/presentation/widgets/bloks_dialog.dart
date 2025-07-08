import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/custom_button.dart';
import 'package:miwe/const_views/widgets/lists.dart';
import 'package:miwe/const_views/widgets/snakBar.dart';
import 'package:miwe/features/blocks/presentation/widgets/dialog_container.dart';
import 'package:miwe/features/blocks/presentation/widgets/selected_row.dart';
import 'package:miwe/features/blocks/presentation/widgets/text_field_suffix.dart';
import 'package:miwe/const_views/widgets/text_filed_app.dart';
import 'package:miwe/vectors/app_vectors.dart';

class BloksDialog {
  void bloksDialog(BuildContext context) {
    TextEditingController sprayedController = TextEditingController();
    TextEditingController fertilizeController = TextEditingController();

    final PageController pageController = PageController();
    String dialogRow = '';
    String? selectedRow;

    // final Animation<double> _scaleTransition=Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: parent, curve: curve))

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setstate) {
            return AnimatedPadding(
              duration: Duration(milliseconds: 250),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: PageView(
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // Page 1
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(AppVectors.dialogAction),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Column(
                                children: [
                                  DialogContainer(
                                    color: AppColors.waterless,
                                    title: 'Suwaryldy',
                                    onTap: () {
                                      pageController.jumpToPage(1);
                                    },
                                  ),
                                  DialogContainer(
                                    color: AppColors.appButtonBg,
                                    title: 'Hasyl ýygnaldy',
                                    onTap: () {
                                      pageController.jumpToPage(2);
                                    },
                                  ),
                                  DialogContainer(
                                    color: AppColors.wasTreated,
                                    title: 'Dermanlanyldy',
                                    onTap: () {
                                      pageController.jumpToPage(3);
                                    },
                                  ),
                                  DialogContainer(
                                    color: AppColors.fertilizer,
                                    title: 'Dökün berildi',
                                    onTap: () {
                                      pageController.jumpToPage(4);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Page 2
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            pageController.jumpToPage(0);
                          },
                          icon: Icon(Icons.close, color: Colors.black),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    SvgPicture.asset(AppVectors.dialogAction),
                                    SizedBox(height: 10),
                                    Text(
                                      'Suwarmak',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(height: 40),
                                    Column(
                                      children: [
                                        SelectedRow(
                                          list: rows,
                                          labelText:
                                              selectedRow ?? 'Saýlanmadyk',

                                          onChanged: (value) {
                                            setstate(() {
                                              selectedRow = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 60),
                                  ],
                                ),
                                CustomButton(
                                  onTap: () {
                                    if (selectedRow != null) {
                                      showGeneralDialog(
                                        pageBuilder: (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) {
                                          return SizedBox();
                                        },
                                        barrierDismissible: true,
                                        barrierLabel:
                                            MaterialLocalizations.of(
                                              context,
                                            ).modalBarrierDismissLabel,
                                        barrierColor: Colors.black54,
                                        transitionDuration: const Duration(
                                          milliseconds: 100,
                                        ),
                                        transitionBuilder: (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                          child,
                                        ) {
                                          final curvedAnimation =
                                              CurvedAnimation(
                                                parent: animation,
                                                curve: Curves.elasticOut,
                                              );
                                          return ScaleTransition(
                                            scale: animation,
                                            child: SimpleDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              children: [
                                                SimpleDialogOption(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppVectors.chekBoks,
                                                      ),
                                                      SizedBox(height: 20),
                                                      Text(
                                                        'Üstünlikli amala aşyryldy!',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${selectedRow!} suwaryldy',
                                                      ),
                                                      SizedBox(height: 20),

                                                      CustomButton(
                                                        onTap: () {
                                                          Navigator.pop(
                                                            context,
                                                          );
                                                        },
                                                        title: 'Dowam et',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },

                                        context: context,
                                      );
                                    } else {
                                      Snakbar.snakBar(
                                        title: 'Hatar saýlaň',
                                        context: context,
                                        color: Colors.red,
                                      );
                                    }
                                  },
                                  title: 'Tassyklamak',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Page 3
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            pageController.jumpToPage(0);
                          },
                          icon: Icon(Icons.close, color: Colors.black),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    SvgPicture.asset(AppVectors.dialogAction),
                                    SizedBox(height: 10),
                                    Text(
                                      'Hasyl ýygnamak',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(height: 20),
                                    SelectedRow(
                                      list: rows,
                                      labelText: selectedRow ?? 'Saýlanmadyk',

                                      onChanged: (value) {
                                        setstate(() {
                                          selectedRow = value;
                                        });
                                      },
                                    ),
                                    TextFieldSuffix(),
                                  ],
                                ),
                                CustomButton(
                                  onTap: () {},
                                  title: 'Tassyklamak',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Page 4
                    _secondDialog(
                      selectedRow: selectedRow ?? 'Saýlanmadyk',

                      onChanged: (value) {
                        setstate(() {
                          selectedRow = value;
                        });
                      },
                      pageController: pageController,
                      title: 'Dermanlanyldy',
                      hintText: 'Näme derman berildi',
                      controller: sprayedController,
                      onTap: () {},
                    ),
                    //  Page 5
                    _secondDialog(
                      selectedRow: selectedRow ?? 'Saýlanmadyk',

                      onChanged: (value) {
                        setstate(() {
                          selectedRow = value;
                        });
                      },
                      pageController: pageController,
                      title: 'Dökün berildi',
                      hintText: 'Näme dökün berildi',
                      controller: fertilizeController,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _secondDialog({
    required PageController pageController,
    required String title,
    required String hintText,
    required TextEditingController controller,
    required VoidCallback onTap,
    required String selectedRow,
    required Function(String?)? onChanged,
  }) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            pageController.jumpToPage(0);
          },
          icon: Icon(Icons.close, color: Colors.black),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppVectors.dialogAction),
                    SizedBox(height: 10),
                    Text(title, style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20),
                    SelectedRow(
                      list: rows,
                      labelText: selectedRow,
                      onChanged: onChanged,
                    ),
                    TextFiledApp(title: hintText, controller: controller),
                  ],
                ),
                CustomButton(onTap: onTap, title: 'Tassyklamak'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
