import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miwe/const_views/settings/widgets/container_tile.dart';
import 'package:miwe/const_views/widgets/my_drawer.dart';
import 'package:miwe/vectors/app_vectors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedLanguage;

    List<String> languages = ['Rus dili', 'Türkmen dili'];

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text('Sazlamalar')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              TileContainer(
                selected: selectedLanguage ?? 'Türkmen',
                list: languages,
                labelText: 'Dil',
                trailing: SvgPicture.asset(AppVectors.noteDropDown),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
