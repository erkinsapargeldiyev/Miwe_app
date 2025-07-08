import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/custom_button.dart';
import 'package:miwe/features/add_work/presentation/widgets/add_work_list_tile.dart';

class BottomSheetDialog {
  static void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,

      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          expand: false,

          builder: (context, controller) {
            return StatefulBuilder(
              builder: (context, setState) {
                return ListView(
                  controller: controller,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),

                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    'Düzediş etmek',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: AppColors.grey),
                          ListTile(
                            title: TextFormField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                hintText: 'Edilmeli işiň adyny ýazyň',
                                hintStyle: TextStyle(
                                  color: AppColors.grey6A,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 130,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                padding: EdgeInsets.only(top: 5, left: 15),
                                decoration: BoxDecoration(
                                  color: AppColors.bgButtonGrey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  maxLines: 3,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Edilmeli iş barada gysgaça düşündiriş',
                                    hintStyle: Theme.of(
                                      context,
                                    ).textTheme.headlineLarge?.copyWith(
                                      fontFamily: 'Roboto',
                                      fontSize: 17,
                                      color: AppColors.grey6A,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          AddWorkListTile(),
                          SizedBox(height: 5),
                          CustomButton(onTap: () {}, title: 'Tassyklamak'),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
