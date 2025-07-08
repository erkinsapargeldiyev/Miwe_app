import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miwe/vectors/app_vectors.dart';

typedef SelectedPopup = Function(String);

// ignore: must_be_immutable
class PopupMenuApp extends StatefulWidget {
  List<String> list;
  final SelectedPopup onSelected;

  PopupMenuApp({super.key, required this.onSelected, required this.list});

  @override
  State<PopupMenuApp> createState() => _PopupMenuAppState();
}

class _PopupMenuAppState extends State<PopupMenuApp> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      itemBuilder: (context) {
        return List.generate(
          widget.list.length,
          (index) => PopupMenuItem<String>(
            value: widget.list[index],
            child: Text(widget.list[index]),
          ),
        );
      },
      onSelected: (newValue) {
        widget.onSelected(newValue); // Call parent widget's function
      },
      icon: SvgPicture.asset(AppVectors.noteDropDown),
    );
  }
}
