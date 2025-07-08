import 'package:flutter/material.dart';
import 'package:miwe/const_views/theme/theme.dart';
import 'package:miwe/splash/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Miwe Agranom',
      theme: lightMode,

      home: SplashPage(),
    );
  }
}
