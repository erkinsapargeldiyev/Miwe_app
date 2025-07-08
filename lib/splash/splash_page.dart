import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miwe/colors/app_colors.dart';
import 'package:miwe/features/intro/presentation/views/intro_page.dart';
import 'package:miwe/vectors/app_vectors.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (contex) => IntroPage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.splashBg),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SvgPicture.asset(AppVectors.splashLogo),
                ),
              ),
            ),
            SvgPicture.asset(AppVectors.splashBg),
          ],
        ),
      ),
    );
  }
}
