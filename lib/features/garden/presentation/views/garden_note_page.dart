import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/lists.dart';
import 'package:miwe/features/garden/presentation/views/garden_status.dart';
import 'package:miwe/features/garden/presentation/views/image_page.dart';
import 'package:miwe/features/garden/presentation/views/images_camera.dart';
import 'package:miwe/features/garden/presentation/widgets/image_indicator.dart';
import 'package:miwe/features/garden/presentation/widgets/note_button.dart';
import 'package:miwe/const_views/widgets/text_filed_app.dart';
import 'package:miwe/const_views/widgets/status_option.dart';
import 'package:miwe/const_views/widgets/custom_button.dart';
import 'package:miwe/vectors/app_vectors.dart';
import 'package:svg_flutter/svg_flutter.dart';

// ignore: must_be_immutable
class GardenNotePage extends StatefulWidget {
  String gardenId;
  GardenNotePage({super.key, required this.gardenId});

  @override
  State<GardenNotePage> createState() => _GardenNotePageState();
}

class _GardenNotePageState extends State<GardenNotePage> {
  int selectedSituation = 0;
  bool selectedHasylYetisdi = false;
  bool selectedSuwaryldy = false;

  bool selectedGyrkymEdildi = false;

  bool selectedKeselli = false;

  final _keselController = TextEditingController();

  int _selectedImageIndex = 0;

  Future pickFromCamera() async {
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (returnImage == null) return;

    setState(() {
      image = File(returnImage.path).readAsBytesSync();
      imageList.add(image!);
    });
  }

  Uint8List? image;
  List<Uint8List> imageList = [];
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.statusBarColor),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text(widget.gardenId)),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width / 3.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.greyE),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            DateFormat('dd-MM-yyyy').format(DateTime.now()),
                            style: Theme.of(
                              context,
                            ).textTheme.headlineLarge?.copyWith(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          pickFromCamera();
                        },
                        child: Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppVectors.fotoShape,
                                  height: 15,
                                  width: 25,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Surat iber',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineLarge?.copyWith(
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SvgPicture.asset(
                  AppVectors.treeDuotone,
                  color:
                      selectedSituation != null
                          ? situations[selectedSituation!]['color']
                          : Color(0xffD9D9D9),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(situations.length, (index) {
                          bool isSelected = selectedSituation == index;
                          return StatusDot(
                            option: StatusOption(
                              label: situations[index]['situation'],
                              color: situations[index]['color'],
                            ),
                            isSelected: isSelected,
                            onTap: () {
                              setState(() {
                                selectedSituation = index;
                                if (index == 3) {
                                  selectedKeselli = true;
                                } else {
                                  selectedKeselli = false;
                                }
                              });
                            },
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: NoteButton(
                          title: 'Hasyl ýetişdi',
                          isSelected: selectedHasylYetisdi,
                          onTap: () {
                            setState(() {
                              selectedHasylYetisdi = !selectedHasylYetisdi;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: NoteButton(
                          title: 'Suwaryldy',
                          isSelected: selectedSuwaryldy,
                          onTap: () {
                            setState(() {
                              selectedSuwaryldy = !selectedSuwaryldy;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: NoteButton(
                          title: 'Gyrkym edildi',
                          isSelected: selectedGyrkymEdildi,
                          onTap: () {
                            setState(() {
                              selectedGyrkymEdildi = !selectedGyrkymEdildi;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.only(top: 5, left: 15),
                      decoration: BoxDecoration(
                        color: AppColors.bgButtonGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        maxLines: 3,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Bellik ýaz...',
                          hintStyle: Theme.of(
                            context,
                          ).textTheme.headlineLarge?.copyWith(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: AppColors.grey6A,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),

                if (selectedKeselli) ...[
                  TextFiledApp(
                    title: "Näme kesel degdi",
                    controller: _keselController,
                  ),
                ],

                if (image != null) ...[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: PageView.builder(
                            onPageChanged: (index) {
                              setState(() {
                                _selectedImageIndex = index;
                              });
                            },
                            itemCount: imageList.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                ImagesCamera(images: imageList),
                                      ),
                                    );
                                  },
                                  child: Image.memory(
                                    imageList[index],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        if (imageList.isNotEmpty && imageList.length > 1)
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(imageList.length, (
                                index,
                              ) {
                                return ImageIndicator(
                                  isActive: _selectedImageIndex == index,
                                );
                              }),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomButton(
              title: 'Tassyklamak',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GardenStatus()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
