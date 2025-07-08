// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextButtonApp extends StatelessWidget {
  String title;
  VoidCallback onTap;

  TextButtonApp({Key? key, required this.title, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(title, style: TextStyle(color: Colors.black)),
    );
  }
}
