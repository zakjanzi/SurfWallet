import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './my_offers.dart';
import './my_trades.dart';
import './notifications.dart';

import './profile_setting.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Drawer(
      child: Container(
        color: context.theme.backgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: mq.height * 0.08,
            ),
            CircleAvatar(
              radius: mq.width * 0.12,
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: mq.height * 0.034,
            ),
            Text(
              'Swiftbaza915',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.2,
                color: context.theme.primaryColor,
              ),
            ),
            SizedBox(
              height: mq.height * 0.035,
            ),
            SizedBox(
              height: 50,
              width: mq.width * 0.42,
              child: OutlinedButton(
                child: Text(
                  'Profile & Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.5,
                    color: context.theme.hoverColor,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  side: BorderSide(
                    color: context.theme.hoverColor,
                  ),
                ),
                onPressed: () {
                  Get.to(
                    () => const ProfileSetting(),
                  );
                },
              ),
            ),
            SizedBox(
              height: mq.height * 0.035,
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => MyOffers(),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: mq.width * 0.12,
                  ),
                  Text(
                    'My Offers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mq.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                color: Get.isDarkMode
                    ? Color.fromRGBO(41, 41, 41, 1)
                    : Color.fromRGBO(235, 235, 235, 1),
              ),
            ),
            SizedBox(
              height: mq.height * 0.01,
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => MyTrades(),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: mq.width * 0.12,
                  ),
                  Text(
                    'My Trades',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mq.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                color: Get.isDarkMode
                    ? Color.fromRGBO(41, 41, 41, 1)
                    : Color.fromRGBO(235, 235, 235, 1),
              ),
            ),
            SizedBox(
              height: mq.height * 0.01,
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => Notifications(),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: mq.width * 0.12,
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
