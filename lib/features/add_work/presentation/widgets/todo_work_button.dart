// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';

// ignore: must_be_immutable
class TodoWorkButton extends StatelessWidget {
  VoidCallback onTap;
  String title;
  bool todoTasks;
  TodoWorkButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.todoTasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        overlayColor: Colors.black,
        elevation: 0,
        backgroundColor:
            todoTasks ? AppColors.todoWorkButton : Color(0xffF3F3F3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: todoTasks ? AppColors.todoWorkButtonText : Colors.black,
        ),
      ),
    );
  }
}
