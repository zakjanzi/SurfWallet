import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:surf_wallet/utils/themes.dart';

import './screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Surf Wallet',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: SplashScreen(),
    );
  }
}
