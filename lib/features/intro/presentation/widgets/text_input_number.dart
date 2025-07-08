// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:miwe/colors/app_colors.dart';

class TextInputNumber extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const TextInputNumber({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        }
        return null;
      },
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((state) {
          if (state.contains(MaterialState.error)) {
            return TextStyle(color: Colors.red);
          }
          return TextStyle(color: Colors.black);
        }),
        labelStyle: MaterialStateTextStyle.resolveWith((states) {
          if (states.contains(MaterialState.error)) {
            return TextStyle(color: Colors.red);
          }
          return TextStyle(color: AppColors.grey6A);
        }),
        label: Text(labelText),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorText: null,
      ),
    );
  }
}
