// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MapInfoWidget extends StatefulWidget {
  Color color;
  int number;
  String title;
  MapInfoWidget({
    super.key,
    required this.color,
    required this.number,
    required this.title,
  });

  @override
  State<MapInfoWidget> createState() => _MapInfoWidgetState();
}

class _MapInfoWidgetState extends State<MapInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 5),
        Text(widget.title),
        Text('(${widget.number.toString()})'),
      ],
    );
  }
}
