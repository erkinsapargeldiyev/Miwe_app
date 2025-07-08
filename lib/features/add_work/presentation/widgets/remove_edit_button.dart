// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RemoveEditButton extends StatelessWidget {
  VoidCallback onTap;
  Color color;
  Widget child;
  RemoveEditButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onTap,
      color: color,
      child: Center(child: child),
    );
  }
}
