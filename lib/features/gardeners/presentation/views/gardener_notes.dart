// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/gardener_works_note.dart';
import 'package:miwe/const_views/widgets/selected_row_widget.dart';
import 'package:miwe/vectors/app_vectors.dart';
import 'package:svg_flutter/svg.dart';

// ignore: must_be_immutable
class GardenerNotes extends StatelessWidget {
  String gardenerName;
  GardenerNotes({Key? key, required this.gardenerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.statusBarColor),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(gardenerName),
            actions: [
              SvgPicture.asset(AppVectors.calendar),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  DateFormat('dd-MM-yyyy').format(DateTime.now()),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: 10),
              SelectedRowWidget(),
              SizedBox(height: 20),
              GardenerWorksNote(),
            ],
          ),
        ),
      ),
    );
  }
}
