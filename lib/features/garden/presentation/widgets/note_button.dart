// ignore: unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';

class NoteButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  // ignore: use_super_parameters
  const NoteButton({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.greyE : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColors.grey6A : AppColors.greyE,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: 12,
              color: AppColors.grey6A,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ),
    );
  }
}
