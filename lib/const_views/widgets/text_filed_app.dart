// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';

// ignore: must_be_immutable
class TextFiledApp extends StatelessWidget {
  String title;
  TextEditingController controller;
  TextFiledApp({Key? key, required this.title, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey6A),
          ),
          label: Text(title, style: TextStyle(fontFamily: 'Inter')),
          labelStyle: TextStyle(color: AppColors.grey6A),
          floatingLabelStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
