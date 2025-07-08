import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/custom_button.dart';
import 'package:miwe/features/add_work/presentation/widgets/add_work_list_tile.dart';

class AddWork extends StatefulWidget {
  const AddWork({super.key});

  @override
  State<AddWork> createState() => _AddWorkState();
}

class _AddWorkState extends State<AddWork> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.statusBarColor),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(title: Text('Iş bermek')),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Material(
                      child: Container(
                        color: Colors.white,
                        child: ListTile(
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
                      ),
                    ),
                    AddWorkListTile(),

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
                              hintText: 'Edilmeli iş barada gysgaça düşündiriş',
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(onTap: () {}, title: 'Tassyklamak'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
