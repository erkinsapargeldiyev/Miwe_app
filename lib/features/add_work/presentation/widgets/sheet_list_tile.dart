// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';

// ignore: must_be_immutable
class SheetListTile extends StatelessWidget {
  String title;
  String subtitle;
  VoidCallback onTap;
  Widget child;

  SheetListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: TextStyle(color: AppColors.black2, fontSize: 17),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: AppColors.grey6A, fontSize: 12),
          ),
          trailing: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 50,
              width: 50,
              color: Colors.white,
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
