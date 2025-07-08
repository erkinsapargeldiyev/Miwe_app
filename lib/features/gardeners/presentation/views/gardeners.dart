import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/const_views/widgets/my_drawer.dart';
import 'package:miwe/features/gardeners/presentation/views/gardener_notes.dart';
import 'package:miwe/vectors/app_vectors.dart';

class Gardeners extends StatefulWidget {
  const Gardeners({super.key});

  @override
  State<Gardeners> createState() => _GardenersState();
}

class _GardenersState extends State<Gardeners> {
  List<String> gardenersList = ['Maksat', "Myrat", 'Aman', 'Ahmet'];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.statusBarColor),
      child: SafeArea(
        child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text('Agranomlar'),
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
          body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              final gardener = gardenersList[index];
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  GardenerNotes(gardenerName: gardener),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 60,
                      child: ListTile(
                        title: Text(
                          gardener,
                          style: TextTheme.of(context).headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            index == 0 ? 'Jogapkär agranom' : 'kömekçi',
                          ),
                        ),
                        leading: Stack(
                          children: [
                            SvgPicture.asset(
                              AppVectors.gardenersPerson,
                              height: 55,
                              width: 55,
                              color: Color(0xffB2B2B2),
                            ),

                            if (index == 0) ...[
                              Positioned(
                                right: 3,
                                bottom: 2,

                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Color(0xff1FB700),
                                ),
                              ),
                            ],
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppVectors.gardenTrailing,
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '(3)',
                              style: TextTheme.of(
                                context,
                              ).headlineLarge?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Colors.grey.withOpacity(0.2)),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
