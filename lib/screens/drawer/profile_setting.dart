import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './change_password.dart';
import './change_username.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key key}) : super(key: key);

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  bool isTrue = Get.isDarkMode;
  bool isEnglishSelected = true;
  bool isArabicSelected = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: context.theme.primaryColor,
          ),
        ),
        title: Text(
          'Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: context.theme.primaryColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: mq.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 16,
                color: context.theme.shadowColor,
              ),
            ),
          ),
          SizedBox(
            height: mq.height * 0.012,
          ),
          ListTile(
            leading: Text(
              'Username',
              style: TextStyle(
                fontSize: 16.5,
                color:
                    Get.isDarkMode ? context.theme.shadowColor : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_sharp,
                color: context.theme.shadowColor,
              ),
              onPressed: () {
                Get.to(() => const ChangeUsernameScreen());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
            child: Text(
              'Swiftbaza915',
              style: TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.w700,
                color:
                    Get.isDarkMode ? Colors.white : context.theme.shadowColor,
              ),
            ),
          ),
          SizedBox(
            height: mq.height * 0.012,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
            child: Text(
              'This is how your trade partners see you.',
              style: TextStyle(fontSize: 16, color: context.theme.shadowColor),
            ),
          ),
          SizedBox(
            height: mq.height * 0.017,
          ),
          Divider(
            color: context.theme.shadowColor.withOpacity(0.25),
          ),
          ListTile(
            leading: const Text(
              'Change password',
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_sharp,
                color: context.theme.shadowColor,
              ),
              onPressed: () {
                Get.to(
                  () => const ChangePasswordScreen(),
                );
              },
            ),
          ),
          Divider(
            color: context.theme.shadowColor.withOpacity(0.25),
          ),
          ListTile(
            leading: const Text(
              'Language',
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEnglishSelected = true;
                        isArabicSelected = false;
                      });
                    },
                    child: Container(
                      height: mq.height * 0.036,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal:5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: isEnglishSelected
                            ? context.theme.hoverColor
                            : context.theme.backgroundColor,
                        border: Border.all(
                          width: 1.8,
                          color: isEnglishSelected
                              ? context.theme.hoverColor
                              : context.theme.shadowColor,
                        ),
                      ),
                      child: Text(
                        'English',
                        style: TextStyle(
                          color: isEnglishSelected
                              ? Get.isDarkMode
                                  ? Colors.black
                                  : Colors.white
                              : !Get.isDarkMode
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEnglishSelected = false;
                        isArabicSelected = true;
                      });
                    },
                    child: Container(
                      height: mq.height * 0.036,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal:5),
                      decoration: BoxDecoration(
                        color: isArabicSelected
                            ? context.theme.hoverColor
                            : context.theme.backgroundColor,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          width: 1.8,
                          color: isArabicSelected
                              ? context.theme.canvasColor
                              : context.theme.shadowColor,
                        ),
                      ),
                      child: Text(
                        'Arabic',
                        style: TextStyle(
                          color: isArabicSelected
                              ? Get.isDarkMode
                                  ? Colors.black
                                  : Colors.white
                              : !Get.isDarkMode
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: context.theme.shadowColor.withOpacity(0.25),
          ),
          SwitchListTile(
            onChanged: (value) {
              setState(() {
                isTrue = value;
              });
              if (Get.isDarkMode) {
                Get.changeThemeMode(ThemeMode.light);
              } else {
                Get.changeThemeMode(ThemeMode.dark);
              }
            },
            activeColor: context.theme.hoverColor,
            value: isTrue,
            title: const Text(
              'Dark mode',
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(
            color: context.theme.shadowColor.withOpacity(0.25),
          ),
          ListTile(
            leading: const Text(
              'About',
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_sharp,
                color: context.theme.shadowColor,
              ),
              onPressed: () {},
            ),
          ),
          Divider(
            color: context.theme.shadowColor.withOpacity(0.25),
          ),
          ListTile(
            leading: const Text(
              'App version',
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                '1.0.0',
                style: TextStyle(
                  fontSize: 16,
                  color: context.theme.shadowColor,
                ),
              ),
            ),
          ),
          Divider(
            color: context.theme.shadowColor.withOpacity(0.25),
          ),
          ListTile(
            leading: const Text(
              'Support',
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: mq.width * 0.14,
                height: mq.height * 0.032,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1.8, color: context.theme.hoverColor),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 20,
                  color: context.theme.hoverColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
