import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart'; 
class ImageIndicator extends StatelessWidget {
  final bool isActive;

  const ImageIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 22.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.appButtonBg : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
