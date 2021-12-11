import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chat extends StatelessWidget {
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
          'Chat',
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
            SizedBox(
              height: mq.height*0.015,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Color.fromRGBO(187, 134, 248, 1),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ali Bouchri',
                      style: TextStyle(
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Online',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: mq.height * 0.04,
            ),
            buildSenderMessage('Hi!'),
            SizedBox(
              height: mq.height * 0.028,
            ),
            buildOwnMessage('Hi! Where can we meet up?'),
            SizedBox(
              height: mq.height * 0.028,
            ),
            buildSenderMessage(
                'Anywhere in Beirut. Please share your\nlocation.'),
            Spacer(),
            buildSendMessage(),
            SizedBox(
              height: mq.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSendMessage() {
    return Builder(builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Color.fromRGBO(45, 43, 53, 1) : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: context.theme.primaryColor,
                ),
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write a message...',
                ),
              ),
            ),
            Spacer(),
            Get.isDarkMode ?
            Container(
              height: 20,
              child: Image.asset('assets/images/loca_dark.png'),
            ) : Container(
              height: 20,
              child: Image.asset('assets/images/loca.png'),
            ),
            SizedBox(
              width: 10,
            ),
            Get.isDarkMode ?
            Container(
              height: 20,
              child: Image.asset('assets/images/send_dark.png'),
            ) : Container(
              height: 20,
              child: Image.asset('assets/images/send.png'),
            ),
          ],
        ),
      );
    });
  }

  Widget buildSenderMessage(String msg) {
    return Builder(builder: (context) {
      return Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Color.fromRGBO(187, 134, 248, 1),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? Color.fromRGBO(45, 43, 53, 1)
                      : Color.fromRGBO(235, 235, 235, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                alignment: Alignment.center,
                child: Text(
                  msg,
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: context.theme.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'October 13, 2021, 4:33PM',
                style: TextStyle(
                  fontSize: 12,
                  color: Get.isDarkMode
                      ? Color.fromRGBO(90, 89, 92, 1)
                      : Colors.black87,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget buildOwnMessage(String msg) {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Color.fromRGBO(187, 134, 248, 1),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.theme.hoverColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                alignment: Alignment.center,
                child: Text(
                  msg,
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'October 13, 2021, 4:33PM',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
