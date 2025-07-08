// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:miwe/const_views/settings/widgets/animated_popup.dart';

import 'package:svg_flutter/svg_flutter.dart';

class TileContainer extends StatefulWidget {
  String selected;
  List<String> list;
  String labelText;
  String? nameGArdener;
  String? phoneNumber;
  String? password;
  Widget? trailing;
  String? titleIcon;
  VoidCallback? onTap;

  TileContainer({
    super.key,
    required this.selected,
    required this.list,
    required this.labelText,
    this.nameGArdener,
    this.phoneNumber,
    this.password,
    required this.trailing,
    this.titleIcon,
  });

  @override
  State<TileContainer> createState() => _TileContainerState();
}

class _TileContainerState extends State<TileContainer> {
  final GlobalKey _key = GlobalKey();

  void _showScrolllablePopup() async {
    String? selectedValue;
    final RenderBox renderBox =
        _key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    final showPopup = await showDialog<String>(
      context: context,
      barrierColor: Colors.transparent,

      builder: (context) {
        return Stack(
          children: [
            Positioned(
              left: offset.dx + MediaQuery.of(context).size.width / 2,
              top: offset.dy,

              child: AnimatedPopup(
                list: widget.list,
                selected: widget.selected,
                width: 150,
                onItemSelected: (value) {
                  selectedValue = value;
                },
              ),
            ),
          ],
        );
      },
    );
    if (showPopup != null && showPopup != widget.selected) {
      setState(() {
        widget.selected = showPopup;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showScrolllablePopup,
      child: Container(
        key: _key,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ListTile(
          title: Row(
            children: [
              Text(widget.labelText),
              SizedBox(width: 10),
              if (widget.titleIcon != null) SvgPicture.asset(widget.titleIcon!),
            ],
          ),
          subtitle: Text(
            widget.selected,
            style: TextStyle(color: Colors.black54),
          ),
          trailing: widget.trailing,
        ),
      ),
    );
  }
}
