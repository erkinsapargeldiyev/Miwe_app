import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/garden_notes_widget.dart';

// ignore: must_be_immutable
class GardeniHistoryNotes extends StatelessWidget {
  String gardenId;
  GardeniHistoryNotes({Key? key, required this.gardenId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.statusBarColor),
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text('Bellikler'),
              Text(
                gardenId,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ),
        body: GardenNotesWidget(),
      ),
    );
  }
}
