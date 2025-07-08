import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miwe/features/add_work/presentation/widgets/text_button_app.dart';

class SelectGardenersDialog {
  static Future<String?> showGardenersDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        int selectedIndex = 0;

        return StatefulBuilder(
          builder: (context, setState) {
            List<String> gardeners = [
              'Maksat',
              'Myrat',
              'Myrat',
              'Myrat',
              'Myrat',
              'Myrat',
            ];

            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              contentPadding: EdgeInsets.zero,
              content: SizedBox(
                height: MediaQuery.of(context).size.height - 300,

                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 40,
                        child: ListTile(
                          title: Text(
                            'Agranom saýla',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      ...List.generate(gardeners.length, (index) {
                        final gardener = gardeners[index];
                        return SizedBox(
                          width: 500,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                                child: ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      gardener,
                                      style: TextTheme.of(
                                        context,
                                      ).headlineLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      index == 0
                                          ? 'Jogapkär agranom'
                                          : 'kömekçi',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                  leading: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Stack(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/gardeners_person.svg',
                                          height: 45,
                                          width: 45,
                                          color: Color(0xffB2B2B2),
                                        ),

                                        if (index == 0) ...[
                                          Positioned(
                                            right: 5,
                                            bottom: 2,

                                            child: CircleAvatar(
                                              radius: 5,
                                              backgroundColor: Color(
                                                0xff1FB700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                  trailing: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Radio<int>(
                                      activeColor: Color(0xff374151),
                                      value: index,
                                      groupValue: selectedIndex,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedIndex = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  onTap:
                                      () =>
                                          setState(() => selectedIndex = index),
                                ),
                              ),
                              Divider(color: Colors.grey[350]),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButtonApp(
                  title: 'Goýbolsun',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                TextButtonApp(
                  title: 'Saýla',
                  onTap: () {
                    final selected = gardeners[selectedIndex];
                    Navigator.of(context).pop(selected);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
