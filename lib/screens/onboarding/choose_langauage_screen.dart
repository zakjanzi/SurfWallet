import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onboarding/onboarding_screen.dart';
import '../../data/controllers/choose_language_controllers.dart';

class ChooseLanguageScreen extends StatelessWidget {
  ChooseLanguageScreen({Key key}) : super(key: key);

  final chooseLanguageController = Get.put(ChooseLanguageController());

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: mq.height * 0.24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<ChooseLanguageController>(
                builder: (ctx) => buildLanguageContainer(
                    context: context,
                    mq: mq,
                    lang: 'English',
                    condition: chooseLanguageController.isSelectedEnglish),
              ),
              SizedBox(
                width: mq.width * 0.05,
              ),
              GetBuilder<ChooseLanguageController>(
                builder: (ctx) => buildLanguageContainer(
                    context: context,
                    mq: mq,
                    lang: 'العربية',
                    condition: chooseLanguageController.isSelectedArabic),
              ),
            ],
          ),
          SizedBox(
            height: mq.height * 0.12,
          ),
          SizedBox(
            width: mq.width * 0.35,
            height: 55,
            child: OutlinedButton(
              onPressed: () {
                if (Get.isDarkMode) {
                  Get.changeThemeMode(ThemeMode.light);
                } else {
                  Get.changeThemeMode(ThemeMode.dark);
                }
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color.fromRGBO(224, 224, 224, 1),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: SizedBox(
                      height: 25,
                      width: 22,
                      child: Get.isDarkMode
                          ? Image.asset('assets/images/sun.png')
                          : Image.asset('assets/images/moon.png'),
                    ),
                  ),
                  Text(
                    Get.isDarkMode ? 'light mode' : 'Dark mode',
                    style: TextStyle(color: context.theme.primaryColor, fontSize: 13.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLanguageContainer({BuildContext context, Size mq, String lang, bool condition}) {
    return GestureDetector(
      onTap: () async {
        if (lang == "English") {
          chooseLanguageController.selectEnglish();
        } else {
          chooseLanguageController.selectArabic();
        }

        Future.delayed(const Duration(milliseconds: 600));
        Navigator.pushNamed(context, "onboarding_screen");
      },
      child: Container(
        height: mq.width * 0.42,
        width: mq.width * 0.42,
        decoration: BoxDecoration(
          color: condition == true ? context.theme.canvasColor : context.theme.cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            lang,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color:
                  Get.isDarkMode ? Colors.white : (condition == true ? Colors.white : Colors.black),
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
