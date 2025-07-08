// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';

// ignore: must_be_immutable
class BlokChilpWidget extends StatefulWidget {
  bool isSelected;

  String title;
  BlokChilpWidget({Key? key, required this.isSelected, required this.title})
    : super(key: key);

  @override
  State<BlokChilpWidget> createState() => _BlokChilpWidgetState();
}

class _BlokChilpWidgetState extends State<BlokChilpWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 97,
      decoration: BoxDecoration(
        border: Border.all(
          color:
              widget.isSelected ? Colors.black : Colors.grey.withOpacity(0.2),
        ),
        color: widget.isSelected ? AppColors.bgButtonGrey : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(
            color: AppColors.grey6A,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
