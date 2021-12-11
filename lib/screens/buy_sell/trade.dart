import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:surf_wallet/screens/buy_sell/chat.dart';

class Trade extends StatefulWidget {
  @override
  State<Trade> createState() => _TradeState();
}

class _TradeState extends State<Trade> {
  int index = 0;
  bool isSelected = true;

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
          'Trade',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: context.theme.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mq.height * 0.01,
              ),
              Text(
                'Trade Started with @username.',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Arrange a meeting to sell ',
                    style: TextStyle(
                      color: context.theme.shadowColor,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    '0.000062 BTC ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: context.theme.primaryColor,
                    ),
                  ),
                  Text(
                    'for ',
                    style: TextStyle(
                      color: context.theme.shadowColor,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '50,000 LBP',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/images/crypto1.png'),
                  ),
                  Text(
                    ' 0.00062 BTC ',
                    style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                      color: context.theme.primaryColor,
                    ),
                  ),
                  Text(
                    'will be sent to the buyer’s wallet.',
                    style: TextStyle(
                      color: context.theme.shadowColor,
                      fontSize: 15.5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => Chat(),
                  );
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: context.theme.hoverColor,
                        width: 1.4,
                      ),
                    ),
                    height: 55,
                    width: mq.width * 0.88,
                    alignment: Alignment.center,
                    child: Text(
                      'Chat',
                      style: TextStyle(
                        color: context.theme.hoverColor,
                        fontSize: 17.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Divider(
                color: Get.isDarkMode ? Color.fromRGBO(41, 41, 41, 1) : Color.fromRGBO(220, 220, 220, 1),
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: mq.height * 0.032,
                      ),
                      CircleAvatar(
                        backgroundColor: context.theme.hoverColor,
                        radius: 9,
                        child: CircleAvatar(
                          radius: 4.5,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Container(
                        height:
                            index <= 1 ? mq.height * 0.21 : mq.height * 0.24,
                        width: 2.5,
                        color: context.theme.hoverColor,
                      ),
                      CircleAvatar(
                        backgroundColor: Get.isDarkMode
                            ? index <= 1
                                ? Color.fromRGBO(163, 162, 161, 1)
                                : context.theme.hoverColor
                            : index <= 1
                                ? Color.fromRGBO(217, 217, 217, 1)
                                : context.theme.hoverColor,
                        radius: 9,
                        child: CircleAvatar(
                          radius: 4.5,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Container(
                        height:
                            index <= 1 ? mq.height * 0.175 : mq.height * 0.35,
                        width: 2.5,
                        color: index <= 1
                            ? Color.fromRGBO(217, 217, 217, 1)
                            : context.theme.hoverColor,
                      ),
                      CircleAvatar(
                        backgroundColor: Get.isDarkMode
                            ? index >= 3
                                ? context.theme.hoverColor
                                : Color.fromRGBO(163, 162, 172, 1)
                            : index >= 3
                                ? context.theme.hoverColor
                                : Color.fromRGBO(217, 217, 217, 1),
                        radius: 9,
                        child: CircleAvatar(
                          radius: 4.5,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: context.theme.hoverColor,
                            child: SvgPicture.asset('assets/icons/lock.svg'),
                          ),
                          SizedBox(
                            width: mq.width * 0.04,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: mq.height * 0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'You are the seller.',
                                  style: TextStyle(
                                      color: context.theme.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: mq.height * 0.01,
                                ),
                                Text(
                                  'Send your funds to escrow and arrange a\nmeeting with the buyer.',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: context.theme.shadowColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mq.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            index++;
                          });

                          await Future.delayed(Duration(seconds: 1));

                          setState(() {
                            index++;
                          });
                        },
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: Get.isDarkMode
                                      ? Color.fromRGBO(98, 3, 211, 1)
                                      : context.theme.hoverColor),
                              color: Get.isDarkMode
                                  ? index == 1
                                      ? Color.fromRGBO(61, 12, 119, 1)
                                      : index >= 2
                                          ? Color.fromRGBO(22, 21, 31, 1)
                                          : Color.fromRGBO(98, 3, 211, 1)
                                  : index == 1
                                      ? Color.fromRGBO(190, 176, 219, 1)
                                      : index >= 2
                                          ? Colors.white
                                          : context.theme.hoverColor,
                            ),
                            height: 55,
                            width: mq.width * 0.82,
                            alignment: Alignment.center,
                            child: index <= 1
                                ? Text(
                                    'Send To Escrow',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : Text(
                                    'Cancel escrow funding',
                                    style: TextStyle(
                                      color: context.theme.hoverColor,
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mq.height * 0.01,
                      ),
                      if (index >= 2)
                        Row(
                          children: [
                            SizedBox(
                              width: mq.width * 0.12,
                            ),
                            Container(
                              height: 16,
                              child: Image.asset('assets/images/i.png'),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Escrow system has been funded',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? Color.fromRGBO(159, 159, 158, 1)
                                      : Color.fromRGBO(52, 51, 51, 1)),
                            ),
                          ],
                        ),
                      SizedBox(
                        height: mq.height * 0.06,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Get.isDarkMode
                                ? index <= 1
                                    ? Color.fromRGBO(163, 162, 172, 1)
                                    : context.theme.hoverColor
                                : index <= 1
                                    ? Color.fromRGBO(217, 217, 217, 1)
                                    : context.theme.hoverColor,
                            child: SvgPicture.asset('assets/icons/coin.svg'),
                          ),
                          SizedBox(
                            width: mq.width * 0.04,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: mq.height * 0.005),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  index <= 1
                                      ? 'Buyer pays seller face to face'
                                      : 'Buyer meets seller.',
                                  style: TextStyle(
                                      color: index <= 1
                                          ? Color.fromRGBO(217, 217, 217, 1)
                                          : context.theme.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: mq.height * 0.01,
                                ),
                                Text(
                                  'Never release funds before getting your\ncash in hand. Count and check the fiat\nnotes carefully. If everything looks good,\nrelease the funds from escrow to the\nbuyer’s wallet.',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: index <= 1
                                        ? Color.fromRGBO(217, 217, 217, 1)
                                        : context.theme.shadowColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (index >= 2)
                        SizedBox(
                          height: mq.height * 0.03,
                        ),
                      if (index >= 2)
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              index++;
                            });

                            await Future.delayed(Duration(seconds: 1));

                            setState(() {
                              index++;
                            });
                          },
                          child: Center(
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Get.isDarkMode
                                      ? index <= 2
                                          ? Color.fromRGBO(98, 3, 211, 1)
                                          : Color.fromRGBO(62, 12, 122, 1)
                                      : index <= 2
                                          ? context.theme.hoverColor
                                          : Color.fromRGBO(192, 178, 221, 1),
                                ),
                                height: 55,
                                width: mq.width * 0.82,
                                alignment: Alignment.center,
                                child: Text(
                                  index <= 2 ? 'Release Funds' : 'Paid',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                        ),
                      if (index >= 2)
                        SizedBox(
                          height: mq.height * 0.01,
                        ),
                      if (index == 2)
                        Row(
                          children: [
                            SizedBox(
                              width: mq.width * 0.12,
                            ),
                            Container(
                              height: 16,
                              child: Image.asset('assets/images/i.png'),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Buyer confirmed the payment',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Get.isDarkMode ?  Color.fromRGBO(159, 159, 158, 1) : Color.fromRGBO(52, 51, 51, 1),
                              ),
                            ),
                          ],
                        ),
                      if (index == 2)
                        SizedBox(
                          height: mq.height * 0.01,
                        ),
                      if (index >= 3)
                        SizedBox(
                          height: mq.height * 0.07,
                        ),
                      if (index == 2)
                        Row(
                          children: [
                            Checkbox(
                              value: isSelected,
                              onChanged: (_) {
                                setState(() {
                                  isSelected = !(isSelected);
                                });
                              },
                              fillColor: MaterialStateColor.resolveWith(
                                (states) => context.theme.canvasColor,
                              ),
                            ),
                            Text(
                              'I confirm that the buyer has paid and don’t\nshow again',
                              style: TextStyle(
                                color: context.theme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      SizedBox(
                        height: mq.height * 0.06,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Get.isDarkMode
                                ? index <= 2
                                    ? Color.fromRGBO(163, 162, 161, 1)
                                    : context.theme.hoverColor
                                : index <= 2
                                    ? Color.fromRGBO(217, 217, 217, 1)
                                    : context.theme.hoverColor,
                            child: SvgPicture.asset('assets/icons/dollar.svg'),
                          ),
                          SizedBox(
                            width: mq.width * 0.04,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: mq.height * 0.005),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Escrow released to buyer',
                                  style: TextStyle(
                                      color: index <= 2
                                          ? Color.fromRGBO(217, 217, 217, 1)
                                          : context.theme.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: mq.height * 0.01,
                                ),
                                Text(
                                  'Release BTC for the seller.',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: index <= 2
                                        ? Color.fromRGBO(217, 217, 217, 1)
                                        : context.theme.shadowColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (index >= 3)
                        SizedBox(
                          height: mq.height * 0.03,
                        ),
                      if (index >= 3)
                        Center(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Get.isDarkMode
                                    ? index <= 2
                                        ? context.theme.hoverColor
                                        : Color.fromRGBO(62, 12, 122, 1)
                                    : index <= 2
                                        ? context.theme.hoverColor
                                        : Color.fromRGBO(192, 178, 221, 1),
                              ),
                              height: 55,
                              width: mq.width * 0.82,
                              alignment: Alignment.center,
                              child: Text(
                                'Release Escrow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ),
                      if (index >= 2)
                        SizedBox(
                          height: mq.height * 0.01,
                        ),
                      if (index <= 2)
                        SizedBox(
                          height: mq.height * 0.03,
                        ),
                      if (index == 4)
                        Column(
                          children: [
                            SizedBox(
                              height: mq.height * 0.03,
                            ),
                            SizedBox(
                              height: mq.height * 0.1,
                              width: mq.width * 0.4,
                              child: Image.asset('assets/images/done.png'),
                            ),
                            SizedBox(
                              height: mq.height * 0.03,
                            ),
                            Text(
                              'Trade has finished Successfuly',
                              style: TextStyle(
                                  color: context.theme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            SizedBox(
                              height: mq.height * 0.01,
                            ),
                            Text(
                              '0.000062 Has been sent to the buyer’s wallet',
                              style: TextStyle(
                                fontSize: 15,
                                color: context.theme.shadowColor,
                              ),
                            ),
                            SizedBox(
                              height: mq.height * 0.04,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: context.theme.hoverColor,
                                      width: 1.4,
                                    ),
                                  ),
                                  height: 55,
                                  width: mq.width * 0.82,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                      color: context.theme.hoverColor,
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (index <= 2)
                        GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: context.theme.hoverColor,
                                  width: 1.4,
                                ),
                              ),
                              height: 55,
                              width: mq.width * 0.82,
                              alignment: Alignment.center,
                              child: Text(
                                'Cancel Trade',
                                style: TextStyle(
                                  color: context.theme.hoverColor,
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (index <= 2)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: mq.height * 0.03,
                            ),
                            Divider(
                              color: Color.fromRGBO(220, 220, 220, 1),
                            ),
                            SizedBox(
                              height: mq.height * 0.03,
                            ),
                            Text(
                              'Ahmad Ahyani’s Insructions',
                              style: TextStyle(
                                  color: context.theme.primaryColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: mq.height * 0.01,
                            ),
                            Text(
                              '1 -Let’s set date and location to meet-up\n2 -Give me the cash\n3 -I’ll release the crypto to your wallet',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.8,
                                color: context.theme.shadowColor,
                              ),
                            ),
                            SizedBox(
                              height: mq.height * 0.03,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: mq.height * 0.03,
                            ),
                            Text(
                              'Trade Informations',
                              style: TextStyle(
                                  color: context.theme.primaryColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: mq.height * 0.01,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '0,000062 BTC ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.8,
                                        fontWeight: FontWeight.w600,
                                        color: context.theme.primaryColor,
                                      ),
                                    ),
                                    Text(
                                      'has been reserved for this trade,',
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.8,
                                        color: context.theme.shadowColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'including the surf’s fee of 0 BTC.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.8,
                                    color: context.theme.shadowColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: mq.height * 0.03,
                            ),
                            Center(
                              child: Container(
                                height: mq.height * 0.075,
                                width: mq.width * 0.82,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Get.isDarkMode
                                      ? Color.fromRGBO(45, 43, 53, 1)
                                      : Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Amount to be paid',
                                      style: TextStyle(
                                          color: context.theme.shadowColor,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      '50000 LL',
                                      style: TextStyle(
                                        color: context.theme.primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: mq.height * 0.03,
                            ),
                            Center(
                              child: Container(
                                height: mq.height * 0.075,
                                width: mq.width * 0.8,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Get.isDarkMode
                                      ? Color.fromRGBO(45, 43, 53, 1)
                                      : Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rate',
                                      style: TextStyle(
                                          color: context.theme.shadowColor,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      '51584000.31 LL',
                                      style: TextStyle(
                                        color: context.theme.primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(
                        height: mq.height * 0.2,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
