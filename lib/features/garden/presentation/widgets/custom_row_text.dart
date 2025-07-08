import 'package:flutter/material.dart';

class CustomRowText extends StatelessWidget {
  final String title;
  final String valueText;
  const CustomRowText({
    super.key,
    required this.title,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(width: 10),
              Text(
                valueText,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
