import 'package:flutter/material.dart';
import 'package:miwe/const_views/widgets/blok_chilp_widget.dart';
import 'package:miwe/const_views/widgets/lists.dart';

class SelectedBlok extends StatefulWidget {
  const SelectedBlok({super.key});

  @override
  State<SelectedBlok> createState() => _SelectedBlokState();
}

class _SelectedBlokState extends State<SelectedBlok> {
  int? selectedBlok;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          bool isSelectedBlokNote = selectedBlok == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedBlok = index;
                });
              },
              child: BlokChilpWidget(
                isSelected: isSelectedBlokNote,
                title: index == 0 ? 'Hemmesi' : bloks[index - 1],
              ),
            ),
          );
        },
      ),
    );
  }
}
