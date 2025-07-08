// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';

class SelectedRowWidget extends StatefulWidget {
  SelectedRowWidget({Key? key}) : super(key: key);

  @override
  State<SelectedRowWidget> createState() => _SelectedRowWidgetState();
}

class _SelectedRowWidgetState extends State<SelectedRowWidget> {
  int? selectedRow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          bool isSelectedJoyaNote = selectedRow == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedRow = index;
                });
              },
              child: Container(
                width: 97,
                decoration: BoxDecoration(
                  color:
                      isSelectedJoyaNote
                          ? AppColors.todoWorkButtonText.withOpacity(0.2)
                          : Color(0xffF3F3F3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    index == 0 ? 'Hemmesi' : 'Hatar №${index + 1}',
                    style: TextStyle(
                      color:
                          isSelectedJoyaNote
                              ? AppColors.todoWorkButtonText
                              : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
