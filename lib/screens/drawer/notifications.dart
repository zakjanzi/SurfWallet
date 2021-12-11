import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
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
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: context.theme.primaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: mq.height * 0.02,
          ),
          buildNotificationTile(
            mq: mq,
            title: 'Email validated',
            subTitle: 'You just confirmed your emai. Thanks!',
            date: 'October 13, 2021, 4:33PM',
          ),
          buildNotificationTile(
            mq: mq,
            title: 'Sign up Successful',
            subTitle: 'Your signed up. Welcome!',
            date: 'October 13, 2021, 4:33PM',
          ),
        ],
      ),
    );
  }

  Widget buildNotificationTile(
      {Size mq, String title, String subTitle, String date}) {
    return Builder(builder: (context) {
      return Container(
        margin: EdgeInsets.only(bottom: mq.height * 0.04),
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: context.theme.primaryColor,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 13,
                    color: Get.isDarkMode
                        ? Color.fromRGBO(108, 107, 118, 1)
                        : Color.fromRGBO(51, 51, 51, 1),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 16,
                color: Get.isDarkMode
                    ? Color.fromRGBO(108, 107, 118, 1)
                    : Color.fromRGBO(51, 51, 51, 1),
              ),
            ),
          ],
        ),
      );
    });
  }
}
