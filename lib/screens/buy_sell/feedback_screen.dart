import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBackScreen extends StatefulWidget {
  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  int index = 0;

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
          'FeedBack',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: context.theme.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
        child: Column(
          children: [
            SizedBox(height: mq.height*0.025,),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: index == 0
                          ?  context.theme.hoverColor
                          : Get.isDarkMode
                              ? Color.fromRGBO(45, 43, 53, 1)
                              : Color.fromRGBO(234, 234, 234, 1),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'All',
                      style: TextStyle( color: index == 0
                          ? (!Get.isDarkMode ? Colors.white : Colors.black)
                          : context.theme.primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: index == 1
                          ? context.theme.hoverColor
                          : Get.isDarkMode
                              ? Color.fromRGBO(45, 43, 53, 1)
                              : Color.fromRGBO(234, 234, 234, 1),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Positive (1)',
                      style: TextStyle(
                          color: index == 1
                              ? (!Get.isDarkMode ? Colors.white : Colors.black)
                              : context.theme.primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: index == 2
                          ? context.theme.hoverColor
                          : Get.isDarkMode
                              ? Color.fromRGBO(45, 43, 53, 1)
                              : Color.fromRGBO(234, 234, 234, 1),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Negative (1)',
                      style: TextStyle( color: index == 2
                          ? (!Get.isDarkMode ? Colors.white : Colors.black)
                          : context.theme.primaryColor),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mq.height * 0.04,
            ),
            Container(
              height: mq.height * 0.1,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.isDarkMode
                    ? Color.fromRGBO(45, 43, 53, 1)
                    : Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hicham domari',
                        style: TextStyle(
                            color: context.theme.shadowColor, fontSize: 14.5),
                      ),
                      Text(
                        'Sep 04 2021',
                        style: TextStyle(
                            color: context.theme.shadowColor, fontSize: 14.5),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Good Trader A+++',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.5,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            size: 14,
                            color: context.theme.hoverColor,
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: context.theme.hoverColor,
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: context.theme.hoverColor,
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: context.theme.hoverColor,
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: context.theme.hoverColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mq.height * 0.015,
            ),
            Container(
              height: mq.height * 0.1,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.isDarkMode
                    ? Color.fromRGBO(45, 43, 53, 1)
                    : Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hicham domari',
                        style: TextStyle(
                            color: context.theme.shadowColor, fontSize: 14.5),
                      ),
                      Text(
                        'Sep 04 2021',
                        style: TextStyle(
                            color: context.theme.shadowColor, fontSize: 14.5),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Very slow',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.5,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Color.fromRGBO(200, 200, 200, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Color.fromRGBO(200, 200, 200, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Color.fromRGBO(200, 200, 200, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Color.fromRGBO(200, 200, 200, 1),
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Color.fromRGBO(200, 200, 200, 1),
                          ),
                        ],
                      ),
                    ],
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
