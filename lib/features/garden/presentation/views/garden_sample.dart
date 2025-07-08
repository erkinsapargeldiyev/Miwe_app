// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:miwe/const_views/widgets/custom_button.dart';
import 'package:miwe/features/garden/data/garden_model/garden_model.dart';
import 'package:miwe/features/garden/presentation/views/garden_note_page.dart';
import 'package:miwe/features/garden/presentation/views/gardeni_history_notes.dart';

import 'package:miwe/features/garden/presentation/widgets/custom_row_text.dart';
import 'package:miwe/features/garden/presentation/widgets/story_and_notes.dart';
import 'package:miwe/vectors/app_vectors.dart';

// ignore: must_be_immutable
class GardenSample extends StatelessWidget {
  GardenModel gardenModel;

  GardenSample({Key? key, required this.gardenModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      gardenModel.imageUrl,
                      width: double.infinity,
                      height: 275,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Üstki gradient
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            const Color(0xff014A3D).withOpacity(1),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Back IconButton
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
                    child: IconButton(
                      icon: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.7),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color(0xff014A3D),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Maglumatlar
              CustomRowText(title: 'ID:', valueText: gardenModel.id),
              CustomRowText(title: "Görnüşi:", valueText: gardenModel.gornusi),
              CustomRowText(title: 'Firmasy:', valueText: gardenModel.firmasy),
              CustomRowText(title: 'Bloky:', valueText: gardenModel.blogy),
              CustomRowText(
                title: 'Ýerleşýän koordinatasy:',
                valueText: 'X: 1, Y: J1',
              ),
              const CustomRowText(
                title: 'Güllän wagty:',
                valueText: '12-15 Noýabr',
              ),
              const CustomRowText(
                title: 'Hasyl wagty:',
                valueText: 'hasylWagty',
              ),
              const CustomRowText(
                title: 'Ekilen wagty:',
                valueText: '2-Noýabr',
              ),
              const CustomRowText(title: 'Ýygym sany:', valueText: '2'),
              const CustomRowText(title: 'Suwarylan sany:', valueText: '2'),

              const SizedBox(height: 20),
              StoryAndNotes(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              GardeniHistoryNotes(gardenId: gardenModel.id),
                    ),
                  );
                },
                title: 'Bagyň geçmişi',
                svgAdress: AppVectors.story,
              ),
              SizedBox(height: 10),
              StoryAndNotes(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              GardeniHistoryNotes(gardenId: gardenModel.id),
                    ),
                  );
                },
                title: 'Bellikler',
                svgAdress: AppVectors.note,
              ),

              SizedBox(height: 20),
              CustomButton(
                title: 'Maglumat bermek',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => GardenNotePage(gardenId: gardenModel.id),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
