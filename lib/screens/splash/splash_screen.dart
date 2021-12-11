import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onboarding/choose_langauage_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, "choose_language");
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.theme.highlightColor,
      body: Column(
        children: [
          SizedBox(
            height: mq.height * 0.42,
          ),
          Center(
            child: SizedBox(
              height: mq.height * 0.11,
              width: mq.width * 0.7,
              child: Get.isDarkMode
                  ? Image.asset(
                      'assets/images/logo2.png',
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      'assets/images/logo1.png',
                      fit: BoxFit.fill,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
