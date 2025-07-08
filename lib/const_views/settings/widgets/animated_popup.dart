// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnimatedPopup extends StatefulWidget {
  final List<String> list;
  final String selected;
  final double width;
  final ValueChanged<String> onItemSelected;
  Widget? trailing;

   AnimatedPopup({
    Key? key,
    required this.list,
    required this.selected,
    required this.width,
    required this.onItemSelected,
    this.trailing
  }) : super(key: key);

  @override
  State<AnimatedPopup> createState() => _AnimatedPopupState();
}

class _AnimatedPopupState extends State<AnimatedPopup> {
  double _height = 0;
  double width = 0;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _height = 260;
        width = widget.width;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: AnimatedSize(
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: _height, maxWidth: width),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...widget.list.map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context, e);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              e,
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    e == widget.selected
                                        ? Colors.blue
                                        : Colors.black,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
