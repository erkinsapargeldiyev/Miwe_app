import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/vectors/app_vectors.dart';
import 'package:svg_flutter/svg_flutter.dart';

class HarvestSeason extends StatelessWidget {
  final List<String> list;
  final String labelText;
  final Function(String?)? onChanged;

  const HarvestSeason({
    super.key,
    required this.list,
    required this.labelText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.greyE,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          final Offset offset = renderBox.localToGlobal(Offset.zero);
          final Size size = renderBox.size;

          showMenu<String>(
            context: context,
            position: RelativeRect.fromLTRB(
              offset.dx,
              offset.dy + size.height,
              offset.dx + size.width,
              offset.dy,
            ),
            items:
                list.map((item) {
                  return PopupMenuItem<String>(value: item, child: Text(item));
                }).toList(),
          ).then((value) {
            if (value != null && onChanged != null) {
              onChanged!(value);
            }
          });
        },

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              labelText,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontSize: 13,
              ),
            ),
            SvgPicture.asset(AppVectors.noteDropDown),
          ],
        ),
      ),
    );
  }
}
